import psycopg2
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas

conn = psycopg2.connect(
    host="localhost",
    user="postgres",
    password="12345",
    database="Delivery"
)

cur = conn.cursor()

def listar_entidades():
    try:
        cur.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='public'")
        tablas = cur.fetchall()
        print("Entidades (tablas) en la base de datos:")
        for i, tabla in enumerate(tablas, start=1):
            print(f"{i}. {tabla[0]}")
    except psycopg2.Error as error:
        print("Error al listar entidades:", error)

def listar_atributos_por_entidad():
    entidad = input("Ingrese el número de la entidad (tabla): ")
    try:
        cur.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='public'")
        tablas = cur.fetchall()
        entidad_seleccionada = tablas[int(entidad) - 1][0]

        cur.execute(f"SELECT column_name FROM information_schema.columns WHERE table_name='{entidad_seleccionada}'")
        columnas = cur.fetchall()
        print(f"Atributos (columnas) en la entidad '{entidad_seleccionada}':")
        for i, columna in enumerate(columnas, start=1):
            print(f"{i}. {columna[0]}")
    except (IndexError, ValueError, psycopg2.Error) as error:
        print("Error al listar atributos por entidad:", error)

def agregar_tabla_con_atributos():
    nombre_tabla = input("Ingrese el nombre de la nueva tabla (entidad): ")

    # Crear la tabla
    try:
        cur.execute(f"CREATE TABLE {nombre_tabla} (id SERIAL PRIMARY KEY)")
        print(f"Tabla '{nombre_tabla}' creada correctamente.")
    except psycopg2.Error as error:
        print("Error al crear la tabla:", error)
        return
    
    # Agregar atributos
    while True:
        nombre_atributo = input("Ingrese el nombre del atributo (o 'fin' para terminar): ")
        if nombre_atributo.lower() == 'fin':
            break
        tipo_dato = input(f"Ingrese el tipo de dato para {nombre_atributo}: ")
        try:
            cur.execute(f"ALTER TABLE {nombre_tabla} ADD COLUMN {nombre_atributo} {tipo_dato}")
            print(f"Atributo '{nombre_atributo}' agregado correctamente.")
        except psycopg2.Error as error:
            print("Error al agregar atributo:", error)

    conn.commit()

def generar_reporte_pdf(entidades_seleccionadas):
    try:
        c = canvas.Canvas("reporte.pdf", pagesize=letter)
        width, height = letter
        c.setFont("Helvetica", 12)

        y_inicial = height - 40

        for idx, (entidad, atributos) in enumerate(entidades_seleccionadas.items(), start=1):
            # Añadir nueva página para cada entidad, excepto la primera
            if idx > 1:
                c.showPage()

            y = y_inicial

            # Encabezado de la entidad
            c.drawString(30, y, f"{entidad}:")
            y -= 20

            # Encabezado de los atributos
            for i, atributo in enumerate(atributos, start=1):
                c.drawString(50 + (i - 1) * 120, y, atributo)
            
            y -= 20

            # Obtener y mostrar los datos de la entidad
            try:
                cur.execute(f"SELECT {', '.join(atributos)} FROM {entidad}")
                resultados = cur.fetchall()

                for row in resultados:
                    y -= 20
                    for i, valor in enumerate(row, start=1):
                        c.drawString(50 + (i - 1) * 120, y, str(valor))
            except psycopg2.Error as error:
                print(f"Error al obtener datos de {entidad}: {error}")
                continue

            y -= 20

        c.save()
        print("Reporte generado correctamente en 'reporte.pdf'.")
    except Exception as e:
        print(f"Error al generar el reporte PDF: {e}")

def menu_principal():
    while True:
        print("|------------------------------------|")
        print("|  1. Listar entidades               |")
        print("|  2. Listar atributos por entidad   |")
        print("|  3. Agregar tabla con atributos    |")
        print("|  4. Generar informe en PDF         |")
        print("|  5. Salir                          |")
        print("|------------------------------------|")

        opcion = input("Selecciona una opción: ")

        if opcion == "1":
            listar_entidades()
        elif opcion == "2":
            listar_atributos_por_entidad()
        elif opcion == "3":
            agregar_tabla_con_atributos()
        elif opcion == "4":
            generar_informe_pdf_menu()
        elif opcion == "5":
            break
        else:
            print("Opción inválida. Intente nuevamente.")

def seleccionar_entidades():
    entidades_seleccionadas = {}

    while True:
        listar_entidades()
        entidad = input("Ingrese el número de la entidad (tabla) o 'fin' para terminar: ")

        if entidad.lower() == 'fin':
            break
        
        try:
            cur.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='public'")
            tablas = cur.fetchall()
            entidad_seleccionada = tablas[int(entidad) - 1][0]

            cur.execute(f"SELECT column_name FROM information_schema.columns WHERE table_name='{entidad_seleccionada}'")
            columnas = cur.fetchall()
            atributos_disponibles = [columna[0] for columna in columnas]

            # Solicitar al usuario que seleccione atributos
            print(f"Atributos disponibles en '{entidad_seleccionada}':")
            for i, atributo in enumerate(atributos_disponibles, start=1):
                print(f"{i}. {atributo}")

            seleccionados = input("Ingrese los números de los atributos separados por coma (ej. 1, 2, 3): ")
            seleccionados = [int(x.strip()) - 1 for x in seleccionados.split(',')]

            atributos_seleccionados = [atributos_disponibles[idx] for idx in seleccionados]

            entidades_seleccionadas[entidad_seleccionada] = atributos_seleccionados
        except (IndexError, ValueError, psycopg2.Error) as error:
            print("Error al seleccionar entidad o atributos:", error)
    
    return entidades_seleccionadas

def generar_informe_pdf_menu():
    entidades_seleccionadas = seleccionar_entidades()
    if entidades_seleccionadas:
        generar_reporte_pdf(entidades_seleccionadas)

def main():
    menu_principal()

    cur.close()
    conn.close()

if __name__ == "__main__":
    main()
