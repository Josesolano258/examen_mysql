CREATE DATABASE examen_ventas;


USE examen_ventas;

-- En la tabla clientes trae PRIMARY KEY , que es una llave principal
-- o llave primaria que seria (id_cliente)

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    telefono VARCHAR(20)
);

-- En la tabla productos trae una PROMARY KEY , que seria (id_producto)

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio_producto DECIMAL(10,2) NOT NULL
);

-- en la tabla ventas trae un PRIMARY KEY , que es (id_venta)
-- La tabla ventas trae un foreing key que es una llave foranea en pocas palabras 
-- que viene de la tabla clientes que seria id_cliente 

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- en la tabla detalle trae 2 PRYMARY KEY , que serian (id_venta id_producto)
-- la tabla detalle_venta trae 2 foreign key , que son de la tabla ventas
-- y de la tabla productos

CREATE TABLE detalle_venta (
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);