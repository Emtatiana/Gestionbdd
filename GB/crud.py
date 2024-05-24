import psycopg2

def conectar(base_datos):
    conn = psycopg2.connect(
        database=base_datos,
        user="postgres",
        password="12345",
        host="localhost",
        port="5432"
    )
    return conn

def obtener_columnas(conn, tabla):
    cursor = conn.cursor()
    cursor.execute(f"SELECT column_name, data_type FROM information_schema.columns WHERE table_name = '{tabla}'")
    columnas = cursor.fetchall()
    cursor.close()
    return columnas

def generar_procedimiento_crud(base_datos, tabla, columnas, nombre_archivo):
    ruta_archivo = fr"C:\Users\Emily\Desktop\GB\crud\{nombre_archivo}"

    with open(ruta_archivo, 'w', encoding='utf-8') as archivo:
        archivo.write("-- Procedimiento CRUD para la tabla " + tabla + "\n")
        archivo.write("CREATE OR REPLACE FUNCTION crud_" + tabla + "(\n")
        archivo.write("    IN accion VARCHAR(10),\n")
        archivo.write("    IN p_id INT")
        
        for col in columnas:
            archivo.write(f",\n    IN p_{col[0]} {col[1]}")
        
        archivo.write("\n) RETURNS SETOF " + tabla + " AS $$\n")
        archivo.write("BEGIN\n")
        
        archivo.write("    IF accion = 'CREATE' THEN\n")
        
        col_insert = [f"{col[0]}" for col in columnas if col[0] != 'id']
        val_insert = [f"p_{col[0]}" for col in columnas if col[0] != 'id']
        
        if col_insert:
            archivo.write("        INSERT INTO " + tabla + " (")
            archivo.write(", ".join(col_insert))
            archivo.write(")\n        VALUES (")
            archivo.write(", ".join(val_insert))
            archivo.write(");\n")
        else:
            archivo.write("        RAISE EXCEPTION 'No hay columnas para insertar';\n")

        archivo.write("    ELSIF accion = 'READ' THEN\n")
        archivo.write("        RETURN QUERY SELECT * FROM " + tabla + ";\n")
        
        archivo.write("    ELSIF accion = 'UPDATE' THEN\n")
        
        col_update = [f"{col[0]} = p_{col[0]}" for col in columnas if col[0] != 'id']
        
        if col_update:
            archivo.write("        UPDATE " + tabla + " SET ")
            archivo.write(", ".join(col_update))
            archivo.write("\n        WHERE id = p_id;\n")
        else:
            archivo.write("        RAISE EXCEPTION 'No hay columnas para actualizar';\n")
        
        archivo.write("    ELSIF accion = 'DELETE' THEN\n")
        archivo.write("        DELETE FROM " + tabla + " WHERE id_" + tabla + " = p_id;\n")
        
        archivo.write("    ELSE\n")
        archivo.write("        RAISE EXCEPTION 'Acción no válida';\n")
        
        archivo.write("    END IF;\n")
        archivo.write("    RETURN QUERY SELECT * FROM " + tabla + ";\n")
        archivo.write("END;\n")
        archivo.write("$$ LANGUAGE plpgsql;\n")

    print(f"Archivo {ruta_archivo} generado exitosamente.")

if __name__ == "__main__":
    base_datos = input("Ingrese el nombre de la base de datos: ")
    tabla = input("Ingrese el nombre de la tabla: ")
    nombre_archivo = input("Ingrese el nombre del archivo (con extensión .sql): ")
    
    conn = conectar(base_datos)
    columnas = obtener_columnas(conn, tabla)
    generar_procedimiento_crud(base_datos, tabla, columnas, nombre_archivo)
    conn.close()
