/*==============================================================*/
/* Table: CLASIFICACION_MANTENIMIENTO                           */
/*==============================================================*/
create table CLASIFICACION_MANTENIMIENTO (
   ID_CLASIFICACION_MANTEMIENTO INT4                 not null,
   NOMBRE_CM            CHAR(50)             not null,
   constraint PK_CLASIFICACION_MANTENIMIENTO primary key (ID_CLASIFICACION_MANTEMIENTO)
);

/*==============================================================*/
/* Table: CLASIFICACION_PRODUCTO                                */
/*==============================================================*/
create table CLASIFICACION_PRODUCTO (
   ID_CLASIFICACION_PRODUCTO INT4                 not null,
   NOMBRE_CLASIFICACION_PRODUCTO CHAR(50)             not null,
   constraint PK_CLASIFICACION_PRODUCTO primary key (ID_CLASIFICACION_PRODUCTO)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   CEDULA_CLIENTE       CHAR(40)             not null,
   NOMBRES_CLIENTE      CHAR(40)             not null,
   APELLIDOS_CLIENTE    CHAR(40)             not null,
   DIRECCION_CLIENTE    CHAR(100)            not null,
   CORREO_CLIENTE       CHAR(40)             not null,
   TELEFONO_CLIENTE     CHAR(40)             not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          INT4                 not null,
   ID_TIPO_EMPLEADO     INT4                 not null,
   CEDULA_EMPLEADO      CHAR(40)             not null,
   NOMBRES_EMPLEADO     CHAR(40)             not null,
   APELLIDOS_EMPLEADO   CHAR(40)             not null,
   FECHA_NACIMIENTO_EMPLEADO DATE                 not null,
   DIRECCION_EMPLEADO   CHAR(100)            not null,
   TELEFONO_EMPLEADO    INT4                 not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Table: FACTURA_MANTENIMIENTO                                 */
/*==============================================================*/
create table FACTURA_MANTENIMIENTO (
   ID_FACTURA_MANTENIMIENTO INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   SUBTOTAL_FACTURA_MANTENIMIENTO MONEY                not null,
   IVA_FACTURA_MANTENIMIENTO MONEY                not null,
   TOTAL_FACTURA_MANTENIMIENTO MONEY                not null,
   FECHA_FACTURA_MANTENIMIENTO DATE                 not null,
   constraint PK_FACTURA_MANTENIMIENTO primary key (ID_FACTURA_MANTENIMIENTO)
);

/*==============================================================*/
/* Table: FACTURA_MANTENIMIENTO_LINE                            */
/*==============================================================*/
create table FACTURA_MANTENIMIENTO_LINE (
   ID_FML               INT4                 not null,
   ID_FACTURA_MANTENIMIENTO INT4                 not null,
   ID_PRODUCTO_MANTENIMIENTO INT4                 not null,
   constraint PK_FACTURA_MANTENIMIENTO_LINE primary key (ID_FML)
);

/*==============================================================*/
/* Table: FACTURA_VENTA                                         */
/*==============================================================*/
create table FACTURA_VENTA (
   ID_FACTURA_VENTA     INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   FECHA_FACTURA_VENTA  DATE                 not null,
   TOTAL_FACTURA_VENTA  MONEY                not null,
   IVA_FACTURA_VENTA    MONEY                not null,
   SUBTOTAL_FACTURA_VENTA MONEY                not null,
   constraint PK_FACTURA_VENTA primary key (ID_FACTURA_VENTA)
);

/*==============================================================*/
/* Table: FACTURA_VENTA_LINE                                    */
/*==============================================================*/
create table FACTURA_VENTA_LINE (
   ID_FVL               INT4                 not null,
   ID_FACTURA_VENTA     INT4                 not null,
   ID_PRODUCTO          INT4                 not null,
   constraint PK_FACTURA_VENTA_LINE primary key (ID_FVL)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          INT4                 not null,
   ID_CLASIFICACION_PRODUCTO INT4                 not null,
   DESCRIPCION_PRODUCTO CHAR(50)             not null,
   NOMBRE_PRODUCTO      CHAR(50)             not null,
   PRECIO_PRODUCTO      CHAR(50)             not null,
   STOCK_PRODUCTO       NUMERIC              not null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: PRODUCTO_MANTENIMIENTO                                */
/*==============================================================*/
create table PRODUCTO_MANTENIMIENTO (
   ID_PRODUCTO_MANTENIMIENTO INT4                 not null,
   ID_CLASIFICACION_MANTEMIENTO INT4                 not null,
   ID_CLASIFICACION_PRODUCTO INT4                 not null,
   DESCRIPCION_PM       CHAR(100)            not null,
   constraint PK_PRODUCTO_MANTENIMIENTO primary key (ID_PRODUCTO_MANTENIMIENTO)
);

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO (
   ID_TIPO_EMPLEADO     INT4                 not null,
   PUESTO_TIPO_EMPLEADO CHAR(40)             not null,
   SALARIO_TIPO_EMPLEADO MONEY                not null,
   constraint PK_TIPO_EMPLEADO primary key (ID_TIPO_EMPLEADO)
);

alter table EMPLEADO
   add constraint FK_EMPLEADO_DISPONE_TIPO_EMP foreign key (ID_TIPO_EMPLEADO)
      references TIPO_EMPLEADO (ID_TIPO_EMPLEADO)
      on delete restrict on update restrict;

alter table FACTURA_MANTENIMIENTO
   add constraint FK_FACTURA__REALIZA___EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table FACTURA_MANTENIMIENTO
   add constraint FK_FACTURA__TIENE__CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table FACTURA_MANTENIMIENTO_LINE
   add constraint FK_FACTURA__TIENE_____FACTURA_ foreign key (ID_FACTURA_MANTENIMIENTO)
      references FACTURA_MANTENIMIENTO (ID_FACTURA_MANTENIMIENTO)
      on delete restrict on update restrict;

alter table FACTURA_MANTENIMIENTO_LINE
   add constraint FK_FACTURA__TIENE_____PRODUCTO foreign key (ID_PRODUCTO_MANTENIMIENTO)
      references PRODUCTO_MANTENIMIENTO (ID_PRODUCTO_MANTENIMIENTO)
      on delete restrict on update restrict;

alter table FACTURA_VENTA
   add constraint FK_FACTURA__PRODUCE_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table FACTURA_VENTA
   add constraint FK_FACTURA__TIENE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table FACTURA_VENTA_LINE
   add constraint FK_FACTURA__TIENE_____FACTURA_ foreign key (ID_FACTURA_VENTA)
      references FACTURA_VENTA (ID_FACTURA_VENTA)
      on delete restrict on update restrict;

alter table FACTURA_VENTA_LINE
   add constraint FK_FACTURA__TIENE_____PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_POSEE_CLASIFIC foreign key (ID_CLASIFICACION_PRODUCTO)
      references CLASIFICACION_PRODUCTO (ID_CLASIFICACION_PRODUCTO)
      on delete restrict on update restrict;

alter table PRODUCTO_MANTENIMIENTO
   add constraint FK_PRODUCTO_ADQUIERE__CLASIFIC foreign key (ID_CLASIFICACION_PRODUCTO)
      references CLASIFICACION_PRODUCTO (ID_CLASIFICACION_PRODUCTO)
      on delete restrict on update restrict;

alter table PRODUCTO_MANTENIMIENTO
   add constraint FK_PRODUCTO_TIENE_____CLASIFIC foreign key (ID_CLASIFICACION_MANTEMIENTO)
      references CLASIFICACION_MANTENIMIENTO (ID_CLASIFICACION_MANTEMIENTO)
      on delete restrict on update restrict;


/*
INSERT INTO public.tipo_empleado(
	id_tipo_empleado, puesto_tipo_empleado, salario_tipo_empleado)
	VALUES (1,'Vendedor',530);
	
INSERT INTO public.tipo_empleado(
	id_tipo_empleado, puesto_tipo_empleado, salario_tipo_empleado)
	VALUES (2,'Tecnico',400);

insert into empleado (id_empleado, id_tipo_empleado, cedula_empleado, nombres_empleado, apellidos_empleado, fecha_nacimiento_empleado, direccion_empleado, telefono_empleado) values (1, 1, '5828586068', 'Leyla', 'Akers', '1998-11-01', '6649 Cambridge Court', '0675264327');
insert into empleado (id_empleado, id_tipo_empleado, cedula_empleado, nombres_empleado, apellidos_empleado, fecha_nacimiento_empleado, direccion_empleado, telefono_empleado) values (2, 2, '6773090431', 'Eadie', 'Tosney', '1991-12-05', '3 East Trail', '0705713900');
insert into empleado (id_empleado, id_tipo_empleado, cedula_empleado, nombres_empleado, apellidos_empleado, fecha_nacimiento_empleado, direccion_empleado, telefono_empleado) values (3, 2, '0224953923', 'Jena', 'Rowatt', '1998-09-09', '318 Goodland Plaza', '0319863288');
insert into empleado (id_empleado, id_tipo_empleado, cedula_empleado, nombres_empleado, apellidos_empleado, fecha_nacimiento_empleado, direccion_empleado, telefono_empleado) values (4, 2, '3598673833', 'Geoffrey', 'Dossantos', '1991-11-16', '28 Farmco Crossing', '0121744024');
insert into empleado (id_empleado, id_tipo_empleado, cedula_empleado, nombres_empleado, apellidos_empleado, fecha_nacimiento_empleado, direccion_empleado, telefono_empleado) values (5, 1, '7431313322', 'Nonah', 'Feathersby', '1993-12-22', '06 Cherokee Way', '0055910659');
insert into empleado (id_empleado, id_tipo_empleado, cedula_empleado, nombres_empleado, apellidos_empleado, fecha_nacimiento_empleado, direccion_empleado, telefono_empleado) values (6, 2, '6453509229', 'Ronald', 'Smedley', '1991-10-13', '76689 Veith Terrace', '0762468309');
insert into empleado (id_empleado, id_tipo_empleado, cedula_empleado, nombres_empleado, apellidos_empleado, fecha_nacimiento_empleado, direccion_empleado, telefono_empleado) values (7, 2, '7740165522', 'Raquel', 'Basini-Gazzi', '1997-07-24', '9 Tennyson Center', '0208072924');
insert into empleado (id_empleado, id_tipo_empleado, cedula_empleado, nombres_empleado, apellidos_empleado, fecha_nacimiento_empleado, direccion_empleado, telefono_empleado) values (8, 2, '0725693809', 'Sunshine', 'Shurman', '1995-09-05', '88759 Oak Valley Pass', '0147748251');
insert into empleado (id_empleado, id_tipo_empleado, cedula_empleado, nombres_empleado, apellidos_empleado, fecha_nacimiento_empleado, direccion_empleado, telefono_empleado) values (9, 2, '8368757983', 'Aharon', 'Zylbermann', '1994-02-13', '10083 Laurel Alley', '0424040430');
insert into empleado (id_empleado, id_tipo_empleado, cedula_empleado, nombres_empleado, apellidos_empleado, fecha_nacimiento_empleado, direccion_empleado, telefono_empleado) values (10, 1, '7633413980', 'Abeu', 'Krolak', '1996-02-09', '1 Bluejay Pass', '0371754021');


insert into cliente (id_cliente, cedula_cliente, nombres_cliente, apellidos_cliente, direccion_cliente, correo_cliente, telefono_cliente) values (1, '2400518128', 'Sheilah', 'Bruun', '1410 Luster Trail', '1645773304', 'sbruun0@sohu.com');
insert into cliente (id_cliente, cedula_cliente, nombres_cliente, apellidos_cliente, direccion_cliente, correo_cliente, telefono_cliente) values (2, '2231622625', 'Alejandrina', 'Dayborne', '788 Badeau Court', '1531883091', 'adayborne1@issuu.com');
insert into cliente (id_cliente, cedula_cliente, nombres_cliente, apellidos_cliente, direccion_cliente, correo_cliente, telefono_cliente) values (3, '2984755139', 'Jsandye', 'Instrell', '55825 Bartillon Drive', '1769800338', 'jinstrell2@ask.com');
insert into cliente (id_cliente, cedula_cliente, nombres_cliente, apellidos_cliente, direccion_cliente, correo_cliente, telefono_cliente) values (4, '2628217695', 'Audi', 'Klemencic', '632 Mosinee Drive', '1731840292', 'aklemencic3@squidoo.com');
insert into cliente (id_cliente, cedula_cliente, nombres_cliente, apellidos_cliente, direccion_cliente, correo_cliente, telefono_cliente) values (5, '2747673684', 'Clemente', 'Lowless', '5030 Golf Alley', '1759955470', 'clowless4@elegantthemes.com');
insert into cliente (id_cliente, cedula_cliente, nombres_cliente, apellidos_cliente, direccion_cliente, correo_cliente, telefono_cliente) values (6, '2451395226', 'Layney', 'Erni', '674 Fordem Crossing', '1984744709', 'lerni5@discuz.net');
insert into cliente (id_cliente, cedula_cliente, nombres_cliente, apellidos_cliente, direccion_cliente, correo_cliente, telefono_cliente) values (7, '2179078375', 'Cal', 'Nealand', '687 Debra Lane', '1730338307', 'cnealand6@dyndns.org');
insert into cliente (id_cliente, cedula_cliente, nombres_cliente, apellidos_cliente, direccion_cliente, correo_cliente, telefono_cliente) values (8, '2732487700', 'Orson', 'Hailey', '40 Green Ridge Point', '1098956620', 'ohailey7@hc360.com');
insert into cliente (id_cliente, cedula_cliente, nombres_cliente, apellidos_cliente, direccion_cliente, correo_cliente, telefono_cliente) values (9, '1105773314', 'Yvonne', 'Vinck', '4 Lawn Park', '1130805293', 'yvinck8@ca.gov');
insert into cliente (id_cliente, cedula_cliente, nombres_cliente, apellidos_cliente, direccion_cliente, correo_cliente, telefono_cliente) values (10, '1341745010', 'Karlee', 'Disman', '30307 Vernon Center', '1627864252', 'kdisman9@stanford.edu');


insert into clasificacion_mantenimiento (id_clasificacion_mantemiento, nombre_cm) values ( 1, 'Correctivo');
insert into clasificacion_mantenimiento (id_clasificacion_mantemiento, nombre_cm) values ( 2, 'Preventivo');
insert into clasificacion_mantenimiento (id_clasificacion_mantemiento, nombre_cm) values ( 3, 'Predictivo');


insert into clasificacion_producto (id_clasificacion_producto, nombre_clasificacion_producto) values ( 1, 'Viento');
insert into clasificacion_producto (id_clasificacion_producto, nombre_clasificacion_producto) values ( 2, 'Cuerda');
insert into clasificacion_producto (id_clasificacion_producto, nombre_clasificacion_producto) values ( 3, 'Percusión');
insert into clasificacion_producto (id_clasificacion_producto, nombre_clasificacion_producto) values ( 4, 'Instrumentos eléctricos');


insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (1, 1, 'Nuevo diseño de llaves', 'SAXOFÓN ALTO CUSTOM EX', 110, 7);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (2, 1, 'Potente de flexibilidad', 'CUSTOM Z ALTO SAXOPHONES', 26, 11);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (3, 1, 'Resina Abs Llaves Plateadas', 'CLARINETE BUFFET B12 BC2540 EN SIB', 165, 2);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (4, 2, 'Compas 95 al compás 107', 'OBOE K 370 DE MOZART', 120, 6);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (5, 2, 'Ukulele Epiphone', 'UKELELE EPIPHONE EULPVSNH3', 55, 10);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (6, 2, 'Ukulele Epit power', 'UKELELE EPIPHONE EULPHSNH1', 21, 2);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (7, 3, 'serie Academy de Taylor Guitars', 'GUITARRA TAYLOR ACADEMY 12', 180, 13);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (8, 3, 'Acuña SAA2 timbaleta', 'TIMBAL VIC FIRTH Vic Firth', 144, 13);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (9, 4, 'SABIAN B8X 45003X', 'PLATILLOS SABIAN Sabian XSR 16', 15, 6);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (10, 4, 'Bajo Fender', 'BASS SQUIER AFFINITY J', 77, 4);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (11, 4, '100 vatios de potencia', 'SINTETIZADOR ROLAND KC-200', 146, 14);
insert into producto (id_producto, id_clasificacion_producto, descripcion_producto, nombre_producto, precio_producto, stock_producto) values (12, 4, 'Pack de guitarra electrica Squier', 'GUITARRA ELECTRICA SQUIER 037-1823', 153, 3);


insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (1, 1, 1,'2020/1/1',542,49.44,607.04);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (2, 1, 3, '2020/4/5',421,65.28,471.52);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (3, 5, 1, '2020/2/2',412,22.32,461.44);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (4, 5, 6, '2020/2/1',544,122.88,609.28);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (5, 10, 9, '2020/1/5',186,64.92,208.32);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (6, 5, 5, '2020/1/2',1024,6.72,1146.88);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (7, 1, 4, '2020/1/6',541,10.44,605.92);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (8, 5, 4, '2020/12/7',56,25.68,62.72);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (9, 1, 10, '2020/8/2',87,62.76,97.44);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (10, 5, 3, '2020/9/4',214,65.76,239.68);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (11, 1, 8, '2020/7/4',523,17.64,585.76);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (12, 1, 7, '2020/9/6',548,29.52,613.76);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (13, 10, 1, '2020/1/1',147,17.04,164.64);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (14, 10, 10, '/2020/5/12',246,1.44,275.52);
insert into factura_venta (id_factura_venta, id_empleado, id_cliente, fecha_factura_venta,subtotal_factura_venta,iva_factura_venta,total_factura_venta) values (15, 10, 2, '2020/12/10',142,4.68,159.04);


insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (1, 1, 4);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (2, 1, 7);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (3, 1, 8);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (4, 2, 9);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (5, 2, 12);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (6, 3, 4);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (7, 3, 1);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (8, 4, 2);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (9, 4, 7);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (10, 4, 3);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (11, 5, 8);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (12, 5, 9);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (13, 6, 10);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (14, 6, 11);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (15, 7, 12);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (16, 7, 5);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (17, 7, 6);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (18, 8, 9);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (19, 8, 7);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (20, 9, 8);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (21, 9, 1);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (22, 9, 2);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (23, 9, 6);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (24, 10, 4);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (25, 10, 1);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (26, 10, 7);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (27, 10, 9);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (28, 11, 4);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (29, 11, 5);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (30, 11, 7);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (31, 12, 9);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (32, 13, 1);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (33, 13, 6);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (34, 13, 7);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (35, 14, 1);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (36, 14, 9);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (37, 14, 8);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (38, 15, 7);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (39, 15, 4);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (40, 15, 7);
insert into factura_venta_line (id_fvl, id_factura_venta, id_producto) values (41, 15, 9);


insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (1, 3, 1, 'FLAUTA SILVERADA YAMAHA');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (2, 1, 1, 'FLAUTA DULCE YAMAHA  DAÑO EN BISEL');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (3, 2, 1, 'FLAUTA YRS23 - DAÑO EN CONDUCTO');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (4, 1, 1, 'TROMPETA NIQUELADA AMATI - DAÑO EN PULSADOR DE PISTON');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (5, 2, 2, 'UKELELE U1MS FDA');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (6, 3, 2, 'UKELELE BLASS - DAÑO EN PUENTE');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (7, 1, 2, 'GUITARRA ACUSTICA - DAÑO EN EL CLAVIJERO');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (8, 3, 3, 'SABIAN XSR 20 - DAÑO EN CAMPANA');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (9, 2, 3, 'SABIAN ASR 270 - DAÑO EN ARCO');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (10, 2, 3, 'BOMBO VIC FIRTH - DAÑO EN TENSOR');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (11, 3, 4, 'GUITARRA ELECTRICA FENDER - CUERDAS');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (12, 3, 4, 'BAJO FENDER - DAÑO EN PUENTE');
insert into producto_mantenimiento (id_producto_mantenimiento, id_clasificacion_mantemiento, id_clasificacion_producto, descripcion_pm) values (13, 2, 4, 'AMPLIFICADOR MARSHALL ds78');


insert into factura_mantenimiento (id_factura_mantenimiento, id_cliente, id_empleado, subtotal_factura_mantenimiento, iva_factura_mantenimiento, total_factura_mantenimiento, fecha_factura_mantenimiento) values (1, 8, 2, 24, 2.88, 26.88, '2020-07-20');
insert into factura_mantenimiento (id_factura_mantenimiento, id_cliente, id_empleado, subtotal_factura_mantenimiento, iva_factura_mantenimiento, total_factura_mantenimiento, fecha_factura_mantenimiento) values (2, 10, 3, 48, 5.76, 53.76, '2020-08-14');
insert into factura_mantenimiento (id_factura_mantenimiento, id_cliente, id_empleado, subtotal_factura_mantenimiento, iva_factura_mantenimiento, total_factura_mantenimiento, fecha_factura_mantenimiento) values (3, 1, 4, 56, 6.72, 62.72, '2020-06-11');
insert into factura_mantenimiento (id_factura_mantenimiento, id_cliente, id_empleado, subtotal_factura_mantenimiento, iva_factura_mantenimiento, total_factura_mantenimiento, fecha_factura_mantenimiento) values (4, 8, 6, 95, 11.4, 106.4, '2020-11-06');
insert into factura_mantenimiento (id_factura_mantenimiento, id_cliente, id_empleado, subtotal_factura_mantenimiento, iva_factura_mantenimiento, total_factura_mantenimiento, fecha_factura_mantenimiento) values (5, 6, 7, 12, 1.44, 13.44, '2020-05-29');
insert into factura_mantenimiento (id_factura_mantenimiento, id_cliente, id_empleado, subtotal_factura_mantenimiento, iva_factura_mantenimiento, total_factura_mantenimiento, fecha_factura_mantenimiento) values (6, 9, 8, 65, 7.8, 72.8, '2020-11-03');
insert into factura_mantenimiento (id_factura_mantenimiento, id_cliente, id_empleado, subtotal_factura_mantenimiento, iva_factura_mantenimiento, total_factura_mantenimiento, fecha_factura_mantenimiento) values (7, 1, 9, 74, 8.88, 82.88, '2020-11-03');


insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (1, 1, 5);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (2, 5, 6);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (3, 6, 9);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (4, 2, 2);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (5, 2, 5);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (6, 3, 8);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (7, 1, 12);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (8, 6, 5);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (9, 5, 8);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (10, 5, 13);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (11, 7, 4);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (12, 5, 6);
insert into factura_mantenimiento_line (id_fml, id_factura_mantenimiento, id_producto_mantenimiento) values (13, 1, 12);


*/

/*
select 
factura_venta.id_factura_venta,
count(factura_venta.fecha_factura_venta) as num_facturas,
factura_venta.fecha_factura_venta
FROM  factura_venta
where(factura_venta.fecha_factura_venta >= '01/01/2020' and factura_venta.fecha_factura_venta <= '31/01/2020')
group by factura_venta.id_factura_venta, factura_venta.fecha_factura_venta


---------------------------------------------------------------------------------------------------------------------



select
cliente.id_cliente,
cliente.cedula_cliente,
cliente.nombres_cliente,
cliente.apellidos_cliente,
count(factura_venta.id_factura_venta) as cantidad
from factura_venta
inner join public.cliente on cliente.id_cliente=factura_venta.id_cliente
where cliente.cedula_cliente = '2400518128'
group by cliente.id_cliente,
cliente.cedula_cliente,
cliente.nombres_cliente,
cliente.apellidos_cliente


-----------------------------------------------------------------------------------------------------------------------------------

Escriba una consulta para mostrar el nombre y pellido de los empleados, los cuales estan incluidos en facturas de mantenimiento cuyo precio total
es mayor a 60 dolares

Mostrar las facturas de mantenimiento superiores 60 dolares

SELECT id_factura_mantenimiento,
fecha_factura_mantenimiento,
total_factura_mantenimiento
from factura_mantenimiento
where total_factura_mantenimiento >= '60'




------------------------------------------------------------------------------------------------------

Consultar cuantas facturas de venta a hecho el empleado con el id=1 para el cliente con el id=1
SELECT
cliente.id_cliente,
cliente.nombres_cliente,
cliente.apellidos_cliente,
empleado.id_empleado,
empleado.id_tipo_empleado,
empleado.nombres_empleado,
empleado.apellidos_empleado
from factura_venta
INNER JOIN public.cliente on cliente.id_cliente = factura_venta.id_cliente
INNER JOIN public.empleado on empleado.id_empleado = factura_venta.id_empleado
where cliente.id_cliente = 1 and empleado.id_empleado= 1

*/
