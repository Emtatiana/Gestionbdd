import psycopg2 

conn = psycopg2.connect( 
    dbname = "Delivery",
    user="postgres",
    password="12345",
    host="localhost",
    port="5432"
)

cur = conn.cursor()

def crear_usuario():
    nombre_usuario = input("Ingrese  nombre del usuario: ")
    contraseña = input("Ingrese contraseña del nuevo usuario: ")
    sql = f"CREATE ROLE {nombre_usuario} WITH LOGIN PASSWORD '{contraseña}'"
    cur.execute(sql)
    conn.commit()
    print ("") 
    print("Usuario creado: ")
    print ("")

def modificar_usuario():
    nombre_usuario = input(  "Ingrese nombre del usuario a modificar: ")
    nuevo_nombre = input("Ingrese nuevo nombre del usuario: ")
    nueva_contraseña = input("Ingrese nueva contraseña: ")
    
    try:
        cur.execute(f"SELECT 1 FROM pg_roles WHERE rolname = '{nombre_usuario}'")
        if cur.fetchone() is None:
            print ("") 
            print("El usuario especificado no existe.")
            return

        if nuevo_nombre and nueva_contraseña:
            sql = f"ALTER ROLE {nombre_usuario} RENAME TO {nuevo_nombre}; ALTER ROLE {nuevo_nombre} WITH PASSWORD '{nueva_contraseña}'"
        elif nuevo_nombre: 
            sql = f"ALTER ROLE {nombre_usuario} RENAME TO {nuevo_nombre}"
        elif nueva_contraseña:
            sql = f"ALTER ROLE {nombre_usuario} WITH LOGIN PASSWORD '{nueva_contraseña}'"
        else:
            print("No se realizo ningun cambio. ")
            return
        cur.execute(sql)
        conn.commit()
        print("Usuario modificado. ")
        
        print ("") 
    
    except (Exception, psycopg2.Error) as error:
        print("Error al modificar usuario : ", error)

def eliminar_usuario():
    nombre_usuario= input("Ingrese nombre del usuario que desea eliminar: ")

    try:
        cur.execute(f"SELECT 1 FROM pg_roles WHERE rolname = '{nombre_usuario}'")
        if cur.fetchone() is None:
            print("")
            print("No existe el usuario")
            return

        sql = f"DROP ROLE {nombre_usuario}"
        cur.execute(sql)
        conn.commit()
        print("Usuario Eliminado")
        print ("") 
    except (Exception, psycopg2.Error) as error:
        print("Error al eliminar usuario: ", error)

def menu():
    print("|--------------------------|")
    print("|  1. Crear nuevo usuario  |")
    print("|  2. Modificar usuario    |")
    print("|  3. Eliminar usuario     |")
    print("|  4. Salir                |")
    
    print ("") 

    opcion = input(  "Selecciona una opcion --->   ")

    print ("") 
    return opcion

while True:
    opcion = menu()
    if opcion == "1":
        crear_usuario()
    elif opcion == "2":
        modificar_usuario()
    elif opcion == "3":
        eliminar_usuario()
    elif opcion == "4":
        break
    else:
        print("Opcion invalida...")

cur.close()
conn.close()