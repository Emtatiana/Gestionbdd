-- Procedimiento CRUD para la tabla localidad
CREATE OR REPLACE FUNCTION crud_localidad(
    IN accion VARCHAR(10),
    IN p_id INT,
    IN p_id_localidad integer,
    IN p_estado_localidad character varying,
    IN p_codigo_postal character varying
) RETURNS SETOF localidad AS $$
BEGIN
    IF accion = 'CREATE' THEN
        INSERT INTO localidad (id_localidad, estado_localidad, codigo_postal)
        VALUES (p_id_localidad, p_estado_localidad, p_codigo_postal);
    ELSIF accion = 'READ' THEN
        RETURN QUERY SELECT * FROM localidad;
    ELSIF accion = 'UPDATE' THEN
        UPDATE localidad SET id_localidad = p_id_localidad, estado_localidad = p_estado_localidad, codigo_postal = p_codigo_postal
        WHERE id = p_id;
    ELSIF accion = 'DELETE' THEN
        DELETE FROM localidad WHERE id = p_id;
    ELSE
        RAISE EXCEPTION 'Acción no válida';
    END IF;
    RETURN QUERY SELECT * FROM localidad;
END;
$$ LANGUAGE plpgsql;
