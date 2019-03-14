/* Tabla de h2 */
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(1, 'Lore', 'Espinosa Marquez', 'lorena.espinosa@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(2, 'Chava', 'Flores', 'salvador.flores@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(3, 'Zeus', 'Flores Espinosa', 'zeus.flores.espinosa@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(4, 'Livierth', 'S', 'Livierth@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(5, 'Livierth', 'F', 'Livierthf@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(6, 'Pedro', 'P', 'pedro@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(7, 'Pedro', 'F', 'pedroF@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(8, 'Yolanda', 'M', 'yolanda@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(9, 'Andres', 'P', 'andres@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(10, 'Gabriel', 'F', 'gabriel@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(11, 'Arturo', 'F', 'arturo@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(12, 'Ix', 'F', 'ix@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(13, 'Daniel', 'F', 'daniel@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(14, 'Diego', 'F', 'diego@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(15, 'Berenice', 'F', 'berenice@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(16, 'Carlos', 'F', 'carlos@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(17, 'Luis', 'F', 'luis@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(18, 'Norma', 'F', 'norma@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(19, 'Ada', 'F', 'ada@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(20, 'Homero', 'F', 'homero@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(21, 'Jose', 'F', 'jose@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(22, 'Eber', 'F', 'eber@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(23, 'Raul', 'F', 'raul@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(24, 'Javier', 'F', 'javier@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(25, 'Luis', 'F', 'luis@email.com', '2017-02-07','');
INSERT INTO clientes(id, nombre, apellido, email, create_at, foto) VALUES(26, 'Hector', 'F', 'hector@email.com', '2017-02-07','');
/* productos */
INSERT INTO productos(nombre, precio, create_at) VALUES('Panasonic Pantalla LCD', 259990, NOW());
INSERT INTO productos(nombre, precio, create_at) VALUES('SONY Camara Digital', 123490, NOW());
INSERT INTO productos(nombre, precio, create_at) VALUES('Apple Ipod shuffle', 159990, NOW());
INSERT INTO productos(nombre, precio, create_at) VALUES('SONY notebook', 59990, NOW());
INSERT INTO productos(nombre, precio, create_at) VALUES('Hewlet packard', 25990, NOW());
INSERT INTO productos(nombre, precio, create_at) VALUES('Bianchi', 9990, NOW());
INSERT INTO productos(nombre, precio, create_at) VALUES('Mica', 2590, NOW());
/* facturas */
INSERT INTO facturas(descripcion, observacion, cliente_id, create_at) VALUES('Factura equipos', 'Observaciones', 1, NOW());
INSERT INTO lineas_factura(cantidad, factura_id, producto_id) VALUES(1,1,1);
INSERT INTO lineas_factura(cantidad, factura_id, producto_id) VALUES(2,1,2);
INSERT INTO lineas_factura(cantidad, factura_id, producto_id) VALUES(1,1,1);
INSERT INTO facturas(descripcion, observacion, cliente_id, create_at) VALUES('Factura equipos dOS', 'Observaciones', 1, NOW());
INSERT INTO lineas_factura(cantidad, factura_id, producto_id) VALUES(1,2,1);
INSERT INTO lineas_factura(cantidad, factura_id, producto_id) VALUES(2,2,2);

INSERT INTO users(username, password, enabled) VALUES('Chava', '$2a$10$D1S2pSD.SHTYVVuYYn79LuUbmzhkFUM8F9XNeYDTpwKVmLCT9pIgu', 1);
INSERT INTO users(username, password, enabled) VALUES('Admin', '$2a$10$DKqUZ0lfnUv/J7DS2ammkO0h4vmV4d67SoAP.fj3Ror/9ABnXOwSu', 1);

INSERT INTO authorities(user_id, authority) VALUES(1,'ROLE_USER');
INSERT INTO authorities(user_id, authority) VALUES(2,'ROLE_USER'); 
INSERT INTO authorities(user_id, authority) VALUES(2,'ROLE_ADMIN');