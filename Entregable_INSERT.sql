/****************** ENTREGABLE INSERT *************************/
-- 5 registros para cada dimension y la tabla de hechos
INSERT INTO ProyectoEstudiante_37.Producto
(ID_Producto, Nombre, Marca, Color, Necesita_refrigeracion, Dias_tiempo_entrega, cantidad_por_salida, 
Precio_minorista_recomendado, Impuesto, Precio_unitario)
VALUES
(1, 'Filete de Atun Florida en Agua 110Kcal Lata 150g', 'Florida', 'No especificado', 1, 0, 10, 6.4, .18, 6),
(2, 'Chocolate Hershey''s Kisses corazón Caja 120g', 'Hershey''s', 'Rojo', 0, 0, 5, 20, .18, 15.4),
(3, 'Arroz Extra añejo FARAON Bolsa 5Kg', 'Faraon', 'Naranja', 0, 1, 10, 23.59, .18, 21.5),
(4, 'Papas PRINGLES Sabor Original Lata 124g', 'Pringles', 'Rojo', 0, 0, 10, 10.9, .18, 8.9),
(5, 'Mayonesa ALACENA Doypack 950g', 'Alacena', 'Amarillo', 1, 0, 20, 18.7, .18, 13.99);

INSERT INTO ProyectoEstudiante_37.Proveedor
(ID_Proveedor, Nombre, Categoria, Contacto_principal, Referencia, Dias_pago, Codigo_postal)
VALUES
(1, 'Pepsico Alimentos Peru S.R.L.', 'Alimentos', 'Juan Perez', 'Av. Proceres 1355 Lima', 15, 17015),
(2, 'Snacks America Latina', 'Alimentos', 'Jose Gomes', 'Av. Gambetta 897 Lima', 10, 17015),
(3, 'Corporación Vega S.A.C.', 'Alimentos', 'Vanessa Tello', 'Av. Pardo 145 Piura', 5, 15015),
(4, 'Distribuidora Sulca S.A.C.', 'Alimentos', 'Maria Pariona', 'Av. Argentina 125 Lima', 1, 17015),
(5, 'Arcor del Peru S.A.', 'Alimentos', 'Leonardo Sulca', 'Av. Proceres 1355 Arequipa', 25, 10015);

INSERT INTO ProyectoEstudiante_37.Cliente
(ID_Cliente, Cliente_Factura, Grupo_Compras, Categoria, Nombre, Codigo_postal, Dias_pago, Contacto_principal)
VALUES
(1, 'William Sanjinez', 'DOC_012443', 'Debito', 'Regular', 17015, 5, 'William Sanjinez'),
(2, 'Marco Lopez', 'DOC_012443', 'Debito', 'Regular', 17015, 5, 'Marco Lopez'),
(3, 'Joel Cueva', 'DOC_53453443', 'Debito', 'Regular', 17015, 5, 'Joel Cueva'),
(4, 'Paolo Farfán', 'DOC_0435454', 'Debito', 'Regular', 17015, 20, 'Paolo Farfán'),
(5, 'Pedro Torres', 'DOC_0989433', 'Debito', 'Regular', 17015, 20, 'Pedro Torres');


INSERT INTO ProyectoEstudiante_37.Fecha
(Fecha, Dia, Mes, Anio, Numero_semana_ISO)
VALUES
( '2010-01-23 12:45:56', 23, 'Jan', 2010, 5),
( '2011-01-23 12:45:56', 23, 'Jan', 2011, 5),
( '2012-01-23 12:45:56', 23, 'Jan', 2012, 5),
( '2013-01-23 12:45:56', 23, 'Jan', 2013, 5),
( '2014-01-23 12:45:56', 23, 'Jan', 2014, 5);


INSERT INTO ProyectoEstudiante_37.TipoTransaccion
(ID_Tipo_transaccion, Nombre)
VALUES
(1, 'Recibo de existencias'),
(2, 'Transferencia de existencias'),
(3, 'Salida de existencias'),
(4, 'Ajuste de existencias'),
(5, 'Reembolso');


INSERT INTO ProyectoEstudiante_37.Movimiento
(ID_Producto, ID_Cliente, ID_Proveedor, ID_Tipo_transaccion, Fecha_movimiento, Cantidad)
VALUES
( 1,3,3,1,'2010-01-23 12:45:56', 23),
( 2,3,3,1,'2011-01-23 12:45:56', 9),
( 3,3,3,3,'2012-01-23 12:45:56', -10),
( 4,2,3,1,'2013-01-23 12:45:56', 16),
( 5,2,3,3,'2014-01-23 12:45:56', -5);


/****************** ENTREGABLE SELECT *************************/
/**
 * número de productos que se movieron en el inventario en un rango de fechas por cliente, proveedor,
 * y/o tipo de transacción. 
 * Fuentes:
 * Movimientos, Tipos de transacción, Proveedores, Clientes y Productos
 */

SELECT
	cliente.Nombre,
	proveedor.Nombre ,
	tipo_transacction.Nombre,
	sum(movimientos.Cantidad)
FROM
	ProyectoEstudiante_37.Movimiento as movimientos,
	ProyectoEstudiante_37.TipoTransaccion as tipo_transacction,
	ProyectoEstudiante_37.Proveedor as proveedor,
	ProyectoEstudiante_37.Cliente as cliente
WHERE
	movimientos.Fecha_movimiento BETWEEN '2010-01-22' AND '2017-01-24' 
	AND tipo_transacction.ID_Tipo_transaccion = movimientos.ID_Tipo_transaccion
	AND proveedor.ID_Proveedor = movimientos.ID_Proveedor 
	AND cliente.ID_Cliente = movimientos.ID_Cliente
GROUP BY
	cliente.Nombre,
	proveedor.Nombre ,
	tipo_transacction.Nombre;


