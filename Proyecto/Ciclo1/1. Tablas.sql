BEGIN
   FOR cur_rec IN (SELECT object_name, object_type
                     FROM user_objects
                    WHERE object_type IN
                             ('TABLE',
                              'VIEW',
                              'PACKAGE',
                              'PROCEDURE',
                              'FUNCTION',
                              'SEQUENCE',
                              'SYNONYM',
                              'PACKAGE BODY'
                             ))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                 );
      END;
   END LOOP;
END;
/

CREATE TABLE clientes(
documento NUMBER(15)NOT NULL,
nombres VARCHAR2(25)NOT NULL,
fechaNacimiento DATE NOT NULL,
ubicacion VARCHAR2(15),
telefono NUMBER(10),
correo VARCHAR2(30)
);

CREATE TABLE ubicaciones(
direccion VARCHAR2(15)NOT NULL,
ciudad VARCHAR2(15)NOT NULL,
departamento VARCHAR2(15)NOT NULL
);

CREATE TABLE pedidos(
idPedido NUMBER(5)NOT NULL,
fecha DATE NOT NULL,
cliente NUMBER(15),
pago NUMBER(5)NOT NULL
);

CREATE TABLE pagos(
idPago NUMBER(5) NOT NULL,
fechaLimite DATE NOT NULL,
fechaPagada DATE
);

CREATE TABLE requerimientos(
producto VARCHAR2(5)NOT NULL,
pedido NUMBER(5)NOT NULL,
cantidad NUMBER(10)NOT NULL,
precio NUMBER(10)NOT NULL
);

CREATE TABLE productos(
idProducto VARCHAR2(5)NOT NULL,
nombre VARCHAR2(25)NOT NULL,
descripcion VARCHAR2(50),
precio NUMBER(10)NOT NULL,
marca VARCHAR2(25)NOT NULL,
categoria VARCHAR2(5),
detalles XMLTYPE
);

CREATE TABLE categorias(
idCategoria VARCHAR2(5)NOT NULL,
nombre VARCHAR2(25)NOT NULL,
categoria VARCHAR2(5)
);

CREATE TABLE adquisiciones(
producto VARCHAR2(5)NOT NULL,
compra NUMBER(5)NOT NULL,
cantidad NUMBER(10)NOT NULL,
precio NUMBER (10) NOT NULL
);
CREATE TABLE compras(
idCompra NUMBER(5)NOT NULL,
fechaCompra DATE NOT NULL,
proveedor NUMBER(15),
despacho NUMBER(5)NOT NULL
);

CREATE TABLE proveedores(
documento NUMBER(15)NOT NULL,
nombre VARCHAR2(25)NOT NULL,
telefono NUMBER(10),
correo VARCHAR2(30)
);

CREATE TABLE despachos(
idDespacho NUMBER(5)NOT NULL,
fechaEnvio DATE NOT NULL,
fechaLlegada DATE,
bodega VARCHAR2(5)NOT NULL
);

CREATE TABLE bodegas(
idBodega VARCHAR2(5)NOT NULL,
ubicacion VARCHAR2(15)
);

CREATE TABLE almacenamientos(
producto VARCHAR2(5)NOT NULL,
bodega VARCHAR2(5)NOT NULL,
cantidad NUMBER(10)NOT NULL
);






