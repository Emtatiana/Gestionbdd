import subprocess
import psycopg2

def respaldo_de_base_de_datos():
    nombre_archivo = input("Ingrese el nombre del archivo de respaldo (sin extensión): ")
    nombre_db = input("Ingrese el nombre de la base de datos que desea respaldar: ")
    ruta_pg_dump = r"C:\Program Files\PostgreSQL\16\bin\pg_dump.exe"
    ruta_archivo = fr"C:\Users\Emily\Desktop\GB\respaldos\{nombre_archivo}.sql"

    comando = [
        ruta_pg_dump,
        "--file", ruta_archivo,
        "--host", "localhost",
        "--port", "5432",
        "--username", "postgres",
        "--role", "postgres",
        "--format", "c",
        "--verbose",
        nombre_db
    ]

    try:
        subprocess.run(comando, shell=True, check=True)
        print("Respaldo realizado correctamente.")
    except subprocess.CalledProcessError as e:
        print("Error al realizar el respaldo:", e)

def restauracion_de_un_archivo():
    nombre_archivo = input("Ingrese el nombre del archivo de respaldo a restaurar (incluyendo la extensión): ")
    nombre_db_nueva = input("Ingrese el nombre para la nueva base de datos donde se restaurará el respaldo: ")
    ruta_pg_restore = r"C:\Program Files\PostgreSQL\16\bin\pg_restore.exe"
    ruta_archivo = fr"C:\Users\Emily\Desktop\GB\respaldos\{nombre_archivo}"

    try:
        conn = psycopg2.connect(
            dbname="postgres",
            user="postgres",
            password="12345",
            host="localhost",
            port="5432"
        )
        conn.set_session(autocommit=True)
    except psycopg2.Error as e:
        print("Error al conectarse a la base de datos:", e)
        return
    
    try:
        with conn.cursor() as cur:
            cur.execute(f"CREATE DATABASE {nombre_db_nueva}")
        print(f"Se ha creado la nueva base de datos '{nombre_db_nueva}' correctamente.")
    except psycopg2.Error as e:
        print("Error al crear la nueva base de datos:", e)
        conn.close()
        return
    
    comando = [
        ruta_pg_restore,
        "--dbname", nombre_db_nueva,
        "--host", "localhost",
        "--port", "5432",
        "--username", "postgres",
        "--role", "postgres",
        "--verbose",
        ruta_archivo
    ]

    try:
        subprocess.run(comando, shell=True, check=True)
        print(f"Restauración del respaldo '{nombre_archivo}' en la nueva base de datos '{nombre_db_nueva}' realizada correctamente.")
    except subprocess.CalledProcessError as e:
        print("Error al realizar la restauración:", e)
    finally:
        conn.close()

def menu():
    print("1. Respaldo de base de datos")
    print("2. Restauracion de un archivo")
    print("3. Salir")

    opcion = input("Selecciona una opcion: ")
    return opcion

while True:
    opcion = menu()
    if opcion == "1":
        respaldo_de_base_de_datos()
    elif opcion == "2":
        restauracion_de_un_archivo()
    elif opcion == "3":
        break
    else:
        print("Opcion invalida...")
