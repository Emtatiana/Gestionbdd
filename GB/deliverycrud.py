import psycopg2

def conectar():
    conn = psycopg2.connect(
    dbname="Delivery",
    user="postgres",
    password="12345",
    host="localhost",
    port="5432"
    )
    return conn

def ejecutar_consulta(sql, *args):
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(sql, args)
    conn.commit()
    cursor.close()
    conn.close()

def obtener_nombres_columnas(tabla):
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(f"SELECT column_name FROM information_schema.columns WHERE table_name = '{tabla}'")
    nombres_columnas = [row[0] for row in cursor.fetchall()]
    cursor.close()
    conn.close()
    return nombres_columnas

def obtener_columna_primaria(tabla):
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(f"SELECT column_name FROM information_schema.columns WHERE table_name = '{tabla}' AND column_default LIKE 'nextval%'")
    columna_primaria = cursor.fetchone()[0]
    cursor.close()
    conn.close()
    return columna_primaria

def menu_principal():
    while True:
        print("")
        print("         MENU               ")
        print("|--------------------------|")
        print("|   1. Insertar registro   |")
        print("|   2. Modificar registro  |")
        print("|   3. Eliminar registro   |")
        print("|   4. Salir               |")

        print("")

        opcion = input("Seleccione una opción ---> ")
        
        print("")

        if opcion == "1":
            tabla = input("Ingrese nombre de la tabla: ")
            nombres_columnas = obtener_nombres_columnas(tabla)
            valores = []
            for columna in nombres_columnas:
                if columna != 'id':
                    valor = input(f"Ingrese valor para {columna}: ")
                    valores.append(valor)
            placeholders = ', '.join(['%s'] * len(nombres_columnas))
            sql = f"INSERT INTO {tabla} ({', '.join(nombres_columnas)}) VALUES ({placeholders})"
            ejecutar_consulta(sql, *valores)
            print("Registro insertado correctamente.")
        elif opcion == "2":
            tabla = input("Ingrese nombre de la tabla: ")
            id_registro = input("Ingrese ID del registro a modificar: ")
            columna_primaria = obtener_columna_primaria(tabla)
            nombres_columnas = obtener_nombres_columnas(tabla)
            for columna in nombres_columnas:
                if columna != columna_primaria:
                    nuevo_valor = input(f"Ingrese nuevo valor para {columna}: ")
                    sql = f"UPDATE {tabla} SET {columna} = %s WHERE {columna_primaria} = %s"
                    ejecutar_consulta(sql, nuevo_valor, id_registro)
            print("Registro modificado correctamente.")

        elif opcion == "3":
            tabla = input("Ingrese nombre de la tabla: ")
            id_registro = input("Ingrese ID del registro a eliminar: ")
            columna_primaria = obtener_columna_primaria(tabla)
            sql = f"DELETE FROM {tabla} WHERE {columna_primaria} = %s"
            ejecutar_consulta(sql, id_registro)
            print("Registro eliminado correctamente.")
        elif opcion == "4":
            break
        else:
            print("Opción inválida")


if __name__ == "__main__":
    menu_principal()