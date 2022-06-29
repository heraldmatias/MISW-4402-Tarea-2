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
