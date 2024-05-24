-- Procedimiento CRUD para la tabla cliente
CREATE OR REPLACE FUNCTION crud_cliente(
    IN accion VARCHAR(10),
    IN p_id INT,
    IN p_id_cliente integer,
    IN p_nombre_cliente character varying,
    IN p_telefono_cliente character varying
) RETURNS SETOF cliente AS $$
BEGIN
    IF accion = 'CREATE' THEN
        INSERT INTO cliente (id_cliente, nombre_cliente, telefono_cliente)
        VALUES (p_id_cliente, p_nombre_cliente, p_telefono_cliente);
    ELSIF accion = 'READ' THEN
        RETURN QUERY SELECT * FROM cliente;
    ELSIF accion = 'UPDATE' THEN
        UPDATE cliente SET id_cliente = p_id_cliente, nombre_cliente = p_nombre_cliente, telefono_cliente = p_telefono_cliente
        WHERE id = p_id;
    ELSIF accion = 'DELETE' THEN
        DELETE FROM cliente WHERE id_cliente = p_id;
    ELSE
        RAISE EXCEPTION 'Acción no válida';
    END IF;
    RETURN QUERY SELECT * FROM cliente;
END;
$$ LANGUAGE plpgsql;
