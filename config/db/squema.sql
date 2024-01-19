CREATE TABLE viajes (
  id SERIAL, 
  destino VARCHAR(50) NOT NULL, 
  presupuesto INT NOT NULL
);

ALTER TABLE viajes ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT NOW();
ALTER TABLE viajes ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT NOW();

CREATE FUNCTION update_updated_at_viajes()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_viajes_updated_at
    BEFORE UPDATE
    ON
        viajes
    FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_viajes();




CREATE TABLE equipamiento (
  id SERIAL, 
  nombre VARCHAR(50)
  );

ALTER TABLE equipamiento ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT NOW();
ALTER TABLE equipamiento ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT NOW();

CREATE FUNCTION update_updated_at_equipamiento()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_equipamiento_updated_at
    BEFORE UPDATE
    ON
        equipamiento
    FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_equipamiento();