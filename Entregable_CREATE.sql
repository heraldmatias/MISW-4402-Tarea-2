/**
 * Producto
 * Proveedor
 * Cliente
 * Fecha
 * TipoTransaccion
 * Movimiento 
 */

/****************** ENTREGABLE CREATE *************************/

/*
 * Las dimensiones y tabla de hechos han sido creadas según el diagrama dimensional propuesto
 * en la parte 1 de la tarea. No se tomo en cuenta el screenshot con un conjunto de sentencias SQL propuestas
 * ya que por ejemplo, la sentencia para crear la dimension Productos no estaba acorde al modelo propuesto. 
*/
CREATE TABLE Producto (
ID_Producto SMALLINT, 
Nombre VARCHAR(100),
Marca VARCHAR(30),
Color VARCHAR(20), 
Necesita_refrigeracion BOOLEAN, 
Dias_tiempo_entrega SMALLINT, 
cantidad_por_salida INT, 
Precio_minorista_recomendado FLOAT, 
Impuesto FLOAT,
Precio_unitario FLOAT,
PRIMARY KEY(ID_Producto));

CREATE TABLE Proveedor (
ID_Proveedor SMALLINT, 
Nombre VARCHAR(30),
Categoria VARCHAR(20), 
Contacto_principal VARCHAR(30), 
Referencia VARCHAR(30), 
Dias_pago INT,
Codigo_postal INT,
PRIMARY KEY(ID_Proveedor));

CREATE TABLE Cliente (
ID_Cliente SMALLINT, 
Cliente_Factura VARCHAR(20),
Grupo_Compras VARCHAR(20), 
Categoria VARCHAR(30),  
Nombre VARCHAR(70),
Codigo_postal INT,
Dias_pago INT,
Contacto_principal VARCHAR(30),
PRIMARY KEY(ID_Cliente));

CREATE TABLE Fecha (
Fecha DATETIME, 
Dia TINYINT, 
Mes VARCHAR(20), 
Anio SMALLINT,
Numero_semana_ISO TINYINT,
PRIMARY KEY(Fecha));

CREATE TABLE TipoTransaccion (
ID_Tipo_transaccion TINYINT, 
Nombre VARCHAR(30) ,
PRIMARY KEY(ID_Tipo_transaccion));

CREATE TABLE Movimiento (
  ID_Producto smallint,
  ID_Cliente smallint,
  ID_Proveedor smallint,
  ID_Tipo_transaccion smallint,
  Fecha_movimiento DATETIME,
  Cantidad int,
  PRIMARY KEY(ID_Producto, ID_Proveedor, ID_Cliente, ID_Tipo_transaccion)
);
