
CREATE TABLE boleta (
  idboleta BIGINT(20) NOT NULL,
  idusuario VARCHAR(20),
  serieboleta VARCHAR(4),
  numboleta BIGINT(10) NOT NULL,
  fechaelaboleta DATE DEFAULT NULL,
  fechacancelacion DATE DEFAULT NULL,
  total DOUBLE DEFAULT NULL,
  son VARCHAR(300),
  idCliente VARCHAR(20),
  fechaLetras VARCHAR(200),
  estado VARCHAR(30),
  fechaCancelLetras VARCHAR(200),
  descripcionboleta VARCHAR(300),
  descripcionigv VARCHAR(300),
  PRIMARY KEY (idboleta,numboleta),
  UNIQUE KEY idboleta (idboleta),
  KEY idcliente (idCliente),
  KEY idusuario (idusuario)
) ENGINE=MYISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table boleta */

INSERT  INTO boleta(idboleta,idusuario,serieboleta,numboleta,fechaelaboleta,fechacancelacion,total,son,idCliente,fechaLetras,estado,fechaCancelLetras,descripcionboleta,descripcionigv) VALUES (1,NULL,'001',178,'2012-02-04','2012-02-13',150,'CIENTO CINCUENTA Y 00/100 NUEVOS SOLES','22','Tacna, 6 de Febrero del 2012','ANULADO','Tacna, 13 de Febrero del 2012','POR EL SERVICIO DE:',NULL),(2,NULL,'001',179,'2012-02-04','2012-02-09',0,' Y 00/100 NUEVOS SOLES','22','Tacna, 6 de Febrero del 2012','ANULADO','Tacna, 9 de Febrero del 2012','POR EL SERVICIO DE:',NULL),(3,NULL,'001',180,'2011-01-19','2012-02-09',150,'CIENTO CINCUENTA Y 00/100 NUEVOS SOLES','22','Tacna, 6 de Febrero del 2012','ANULADO','Tacna, 9 de Febrero del 2012','POR EL SERVICIO DE:',NULL),(4,NULL,'001',181,'2012-04-04',NULL,150,'CIENTO CINCUENTA Y 00/100 NUEVOS SOLES','22','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','POR EL SERVICIO DE:',NULL),(5,NULL,'001',182,'2012-01-19',NULL,150,'CIENTO CINCUENTA Y 00/100 NUEVOS SOLES','22','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','POR EL SERVICIO DE:',NULL),(6,NULL,'001',183,'2012-02-13',NULL,700,'SETECIENTOS   Y 00/100 NUEVOS SOLES','1','Tacna, 13 de Febrero del 2012','CANCELADO','Tacna, 13 de Febrero del 2012','POR EL SERVICIO DE TRANSPORTE DE:',NULL),(7,NULL,'001',184,'2012-02-17',NULL,230,'DOCIENTOS TREINTA Y 00/100 NUEVOS SOLES','1','Tacna, 17 de Febrero del 2012','CANCELADO','Tacna, 17 de Febrero del 2012','POR EL SERVICIO DE:','');

/*Table structure for table cliente */

DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
  idCliente BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  razonSocial VARCHAR(100),
  ruc VARCHAR(10),
  pais VARCHAR(20),
  departamento VARCHAR(100),
  estado VARCHAR(1),
  tipo VARCHAR(100),
  PRIMARY KEY (idCliente),
  UNIQUE KEY idcliente (idCliente)
) ENGINE=MYISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table cliente */

INSERT  INTO cliente(idCliente,razonSocial,ruc,pais,departamento,estado,tipo) VALUES (1,'OXIQUIN','1046537040','PERU','TACNA','1','Agencia'),(2,'TRANSPORTES CANO','23456789','PERU','TACNA','1','TRANSPORTISTA'),(4,'DEPOSITOS DEL PERU','34863454','PERU','TACNA','1','ADUANA'),(5,'GRUPO LINARES S.A.','34979878','PERU','TACNA','1','LOGISTICA'),(6,'WILLIAM CALISAYA','44012468','PERU','AREQUIPA','1','CLIENTE NATURAL'),(11,'INDURA S.A.','34598039','PERU','TACNA','1','TRANSPORTISTA'),(10,'MARANATHA SA','12345678','PERU','TACNA','1','Cliente'),(12,'JOSE MANUEL LIMACHI','1046537040','PERU','TACNA','1','Proveedores'),(13,'VULCO PERU','1046532558','PERU','MOQUEGUA','1','Transportista'),(17,'LOS PROCABLES S.A','1046534774','CHILE','ARICA','1','Transportista'),(22,'NELSON BINDER DIAZ','RUT 717000','CHILE','ARICA','1','Cliente'),(21,'DISTRIBUIDORA GARCIA S.A.','2010001975','PERU','AREQUIPA','1','Cliente'),(20,'DDP DEL PERU S.A.C.','2051969421','PERU','TACNA','1','Operador Logistico'),(19,'FAMESA EXPLOSIVOS S.A.C.','2010011221','PERU','LIMA','1','Cliente'),(23,'INDEPENDIENTE(SIN RAZON SOCIAL)','SIN RUC','SIN PAIS','SIN DEP.','-','-'),(0,'','','','','','');

/*Table structure for table conductor */

DROP TABLE IF EXISTS conductor;

CREATE TABLE conductor (
  idconductor BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  idcliente VARCHAR(20)  NOT NULL,
  dniconductor VARCHAR(10),
  licenciaconductor VARCHAR(12),
  apellidopconductor VARCHAR(100),
  apellidomconductor VARCHAR(100),
  nombreconductor VARCHAR(100),
  ciudadconductor VARCHAR(50),
  paisconductor VARCHAR(10),
  estado VARCHAR(2),
  PRIMARY KEY (idconductor,idcliente),
  UNIQUE KEY idconductor (idconductor),
  KEY idcliente (idcliente)
) ENGINE=MYISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table conductor */

INSERT  INTO conductor(idconductor,idcliente,dniconductor,licenciaconductor,apellidopconductor,apellidomconductor,nombreconductor,ciudadconductor,paisconductor,estado) VALUES (1,'1','38476234','23234980','CALISAYA','PARI','WILLIAM','TACNA','PERU','1'),(2,'5','2349234','87687003','DAVILA','COTRADO','GUILLERMO','TACNA','PERU','1'),(3,'11','46537040','46537040','LIMACHI','CHAVEZ','JOSE','TACNA','PERU','1'),(4,'2','45366558','45366558',' HUANCA','CHAVEZ','CARLOS','PUNO','PERU','1'),(5,'2','45855885','45855885','BRANIES','JUAN DE DIOS','JOSUE','LIMA','PERU','1'),(6,'12','3214223','312321','LIMACHI','CHAVEZ','JOSE','TACNA','PERU','1'),(7,'23','46532584','46532874','ARU','LA TORRE','JUAN CARLOS','TACNA','PERU','1'),(8,'23','123','eqw','123','123','12','123','123','1'),(0,'','','','','','','','','');

/*Table structure for table crt */

DROP TABLE IF EXISTS crt;

CREATE TABLE crt (
  idcrt BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  idcliente VARCHAR(20),
  numero_2 VARCHAR(20),
  detalle_transportista VARCHAR(200),
  destinatario_4 VARCHAR(15),
  consignatario_6 VARCHAR(15),
  notificar_9 VARCHAR(15),
  idpais VARCHAR(20),
  lugarporteador_7 VARCHAR(20),
  lugarentrega_8 VARCHAR(20),
  fechaemision_5 DATE DEFAULT NULL,
  porteadorsucesivo_10 VARCHAR(100),
  detallebultos_11 VARCHAR(700),
  pesobruto_12 VARCHAR(20),
  volumen_13 VARCHAR(20),
  valor_14 VARCHAR(20),
  moneda_14 VARCHAR(5),
  gastos_15 VARCHAR(20),
  remitente_15a VARCHAR(50),
  remitente_15b VARCHAR(50),
  montoremitente_15a VARCHAR(10),
  montoremitente_15b VARCHAR(10),
  totalremitente_15 VARCHAR(10),
  moneda_15a VARCHAR(10),
  destinatario_15a VARCHAR(10),
  destinatario_15b VARCHAR(10),
  monto_15a VARCHAR(10),
  monto_15b VARCHAR(10),
  totalmonto_15 VARCHAR(10),
  moneda_15b VARCHAR(10),
  valormercancia_16 VARCHAR(50),
  anexos_17 VARCHAR(100),
  instruccionesaduana_18 VARCHAR(200),
  montofleteextern_19 VARCHAR(50),
  montorembolso_20 VARCHAR(50),
  nombrefirmaremitente_21 VARCHAR(100),
  fecha_21 DATE DEFAULT NULL,
  declaraciones_22 VARCHAR(200),
  nombreporteador_23 VARCHAR(100),
  fechaporteador_23 DATE DEFAULT NULL,
  nombrefirmadestin_24 VARCHAR(100),
  fechadestin_24 DATE DEFAULT NULL,
  PRIMARY KEY (idcrt),
  UNIQUE KEY iddrt (idcrt),
  KEY idcliente (idcliente),
  KEY idpais (idpais)
) ENGINE=MYISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table crt */

INSERT  INTO crt(idcrt,idcliente,numero_2,detalle_transportista,destinatario_4,consignatario_6,notificar_9,idpais,lugarporteador_7,lugarentrega_8,fechaemision_5,porteadorsucesivo_10,detallebultos_11,pesobruto_12,volumen_13,valor_14,moneda_14,gastos_15,remitente_15a,remitente_15b,montoremitente_15a,montoremitente_15b,totalremitente_15,moneda_15a,destinatario_15a,destinatario_15b,monto_15a,monto_15b,totalmonto_15,moneda_15b,valormercancia_16,anexos_17,instruccionesaduana_18,montofleteextern_19,montorembolso_20,nombrefirmaremitente_21,fecha_21,declaraciones_22,nombreporteador_23,fechaporteador_23,nombrefirmadestin_24,fechadestin_24) VALUES (54,'1','CRT-2','        GRUPO LINARES S.A.\r\n        \r\n        ','2','12','6','1','11','9','2012-12-12','porteadores','SON: 84 ZAPATAS','241,533.00','111111','valor','US$','COLLECT','DE AQUI PARA ALLA','DE AQUI PARA ALLA2','costo1','costo2','total','US$','puntos','puntos2','838,740.00','838,344.00','total','US$','declaracion','documeAnexo','instrucciones','montoflete','TEXTO','NOMBRE FIRMA','2014-12-12','declaracion','NOMBRE PORTEADOR','2012-12-12','NOMBRE DESTINA','2012-12-12');

/*Table structure for table detalleboleta */

DROP TABLE IF EXISTS detalleboleta;

CREATE TABLE detalleboleta (
  idDetalleBoleta BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  cantidad VARCHAR(30),
  descripcion VARCHAR(150),
  precioUnit DOUBLE DEFAULT NULL,
  importe DOUBLE DEFAULT NULL,
  idboleta INT(11) DEFAULT NULL,
  PRIMARY KEY (idDetalleBoleta),
  KEY idboleta (idboleta)
) ENGINE=MYISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table detalleboleta */

INSERT  INTO detalleboleta(idDetalleBoleta,cantidad,descripcion,precioUnit,importe,idboleta) VALUES (28,'1','VEHICULO DE APOYO GUIA (INCLUIDO PILOTO) PARA CAMIONES CON CARGA SOBREDIMIENSIONADA RUTA: TACNA-MATARANI',0,150,1),(29,'0','---',0,0,2),(30,'1','VEHICULO DE APOYO GUIA (INCLUIDO PILOTO) PARA CAMIONES CON CARGA SOBREDIMENSIONADA RUTA: TACNA-MATARANI',0,150,3),(31,'1','VEHICULO DE APOYO GUIA (INCLUIDO PILOTO) PARA CAMIONES CON CARGA SOBREDIMENSIONADA RUTA: TACNA-MATARANI',0,150,4),(32,'1','VEHICULO DE APOYO GUIA (INCLUIDO PILOTO) PARA CAMIONES CON CARGA SOBREDIMENSIONADA RUTA: TACNA-MATARANI',0,150,5),(38,'1','BULTOS QUE CONTIENEN PRODUCTOS FARMACEUTICOS\r\n',0,400,6),(37,'1','CAJAS QUE CONTIENEN VIVERES',0,300,6),(39,'','CAJAS',0,230,7);

/*Table structure for table detallecliente */

DROP TABLE IF EXISTS detallecliente;

CREATE TABLE detallecliente (
  iddetallecliente BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  direccion VARCHAR(100),
  telefono VARCHAR(15),
  email VARCHAR(100),
  descrip VARCHAR(100),
  idcliente VARCHAR(20),
  PRIMARY KEY (iddetallecliente),
  UNIQUE KEY iddetallecliente (iddetallecliente),
  KEY idcliente (idcliente)
) ENGINE=MYISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table detallecliente */

INSERT  INTO detallecliente(iddetallecliente,direccion,telefono,email,descrip,idcliente) VALUES (12,'CPM LEGUIA MZ Y 24','952624449','josmarl567@gmail.com','-','12'),(11,'LOS ALAMOS 634','457687','-','-','11'),(10,'CN. CT-2 MZ-6 LT-1','952633245','-','-','6'),(4,'CHILENOS','234234','-','-','1'),(2,'AV INSDUSTRIAL 345','987987','transportescano@cano.com.pe','-','2'),(1,'PJE LEGUI 345','37876','logistica@grupolinares.com.pe','-','5'),(13,'CALLE ARICA 123','956362514','lpro@gmail.com','-','17'),(14,'Car. Autopista Ancon KM 28 - Puente Piedra - Lima','','','','19'),(15,'Apliacion Bolognesi Mz. G LT. 5 TACNA','','','','20'),(16,'Av. San Jeronimo Nro. 119 Umacollo Arequipa','','','','21'),(17,'Arica - Chile','','','','22'),(0,'','','','',''),(19,'Calle Alto Alianza Nro 50','346623','nada','nada','102');

/*Table structure for table detallefactura */

DROP TABLE IF EXISTS detallefactura;

CREATE TABLE detallefactura (
  idDetalleFactura BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  cantidad VARCHAR(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  precioUnit DECIMAL(18,2) DEFAULT NULL,
  importe DECIMAL(18,2) DEFAULT NULL,
  idFactura INT(11) DEFAULT NULL,
  PRIMARY KEY (idDetalleFactura),
  UNIQUE KEY idDetalleFactura (idDetalleFactura),
  KEY idFactura (idFactura)
) ENGINE=MYISAM AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table detallefactura */

INSERT  INTO detallefactura(idDetalleFactura,descripcion,cantidad,precioUnit,importe,idFactura) VALUES (273,'2','12.00','0.00','12.00',22),(272,'1','12.00','0.00','12.00',22),(279,'BULTO QUE CONTIENEN EXPLOSIVOS','1.00','0.00','457.00',25),(271,'BALDES CONTENIENDO: EXAK DETERCLOR','60.00','0.00','180.00',21),(270,'SERVICIO DE TRANSPORTE TERRESTRE INTERNACIONAL TACNA(PERU)-ARICA(CHILE) DE:','0.00','0.00','0.00',21),(269,'SILO DE METAL CON ACCESORIOS','1','0.00','3800.00',20),(268,'TRANSPORTE TERRESTRE\r\nRUTA: AREQUIPA - TOQUEPALA','','0.00','0.00',20),(253,'POR LA SERVICIO DE TRANSPORTE TERRESTRE EN 02 CAMAS BAJAS\r\nRUTA: EXSA(TACNA)-LA JOYA(AREQUIPA)','','0.00','0.00',12),(254,'POR LA SERVICIO DE TRANSPORTE TERRESTRE EN 02 CAMAS BAJAS\r\nRUTA: EXSA(TACNA)-LA JOYA(AREQUIPA)\r\n','','0.00','0.00',12),(255,'POR LA SERVICIO DE TRANSPORTE TERRESTRE EN 02 CAMAS BAJAS\r\nRUTA: EXSA(TACNA)-LA JOYA(AREQUIPA)','','0.00','0.00',12),(256,'POR LA SERVICIO DE TRANSPORTE TERRESTRE EN 02 CAMAS BAJAS\r\nRUTA: EXSA(TACNA)-LA JOYA(AREQUIPA)','0.00','0.00','0.00',13),(257,'POR LA SERVICIO DE TRANSPORTE TERRESTRE EN 02 CAMAS BAJAS\r\nRUTA: EXSA(TACNA)-LA JOYA(AREQUIPA)','0.00','0.00','0.00',13),(258,'POR LA SERVICIO DE TRANSPORTE TERRESTRE EN 02 CAMAS BAJAS\r\nRUTA: EXSA(TACNA)-LA JOYA(AREQUIPA)','0.00','0.00','0.00',13),(259,'ALQUILER DE GRUA KOBELCO PARA RELIZAR TRABAJOS DE CARGUIO DE 02 SILOS EN PLANTA DE EXSA(SAMA)','0.00','0.00','2000.00',14),(260,'POR LA SERVICIO DE TRANSPORTE TERRESTRE EN 02 CAMAS BAJAS\r\nRUTA: EXSA(TACNA)-LA JOYA(AREQUIPA)','0.00','0.00','0.00',15),(261,'SILOS DE METAL CON ACCESORIOS','2.00','0.00','4400.00',15),(262,'POR EL SERVICIO DE 02 DEVEHICULOS DE APOYO GUIA PARA CARGA SOBREDIMENSIONADA','0.00','0.00','2000.00',16),(263,'POR EL SERVICIO DE 02 VEHICULOS DE APOYO GUIA PARA 07 CAMIONES CON TUBOS DE 19 M. DE LARGO DE PLACA: DCLS-70/JF-6793 DCZL-15/JF-6794 DCSB-94/JF-6795 CTLR-19/JL-5143 DCLS-71/JF-6792 DCLS-68/JF-6795 CTLR-20/JL-1584','0.00','0.00','288.14',17),(264,'POR EL SERVICIO DE 1 VEHICULO DE APOYO GUIA PARA 01 CAMION CON SOBREDIMENSION EN EL LARGO','0.00','0.00','1355.93',18),(265,'RUTA: C.F. TACNA-LIMA-TACNA','0.00','0.00','0.00',18),(266,'POR EL SERVICIO DE TRANSPORTE TERRESTRE RUTA: AREQUIPA - CUAJONE','0.00','0.00','0.00',19),(267,'SILO DE METAL CON ACCESORIOS','1.00','0.00','3500.00',19),(274,'1','12.00','0.00','12.00',22),(275,'POR EL SERVICIO DE 01 VEHICULOS DE APOYO GUIA PARA 04 CAMIONES CON TUBOS DE 19 M. DE LARGO DE PLACA: CHPS-63/JK-4203 BKWZ-73/JJ-8291 XW-2261/JJ-3384 XW-2259/JL-1583','0.00','0.00','144.07',23),(276,'RUTA: C.F. SANTA ROSA - TACNA-ITE','0.00','0.00','0.00',23),(277,'VEHICULOS DE APOYO GUIA PARA 03 CAMIONES CON TUBOS DE 19 M. DE LARGO DE PLACAS: BDRC-73/JJ-3383 BKWZ-72/JJ-8292 CHVC-18/JK-4202','1.00','0.00','144.07',24),(278,'RUTA: C.F. SANTA ROSA - TACNA-ITE','0.00','0.00','0.00',24),(280,'CAJAS QUE CONTIENEN FOCOS FLUORESCENTES\r\n','2.00','0.00','398.00',25),(281,'TRANSPORTE DE BULTOS','','0.00','2300.00',26);

/*Table structure for table detalleguiaremision */

DROP TABLE IF EXISTS detalleguiaremision;

CREATE TABLE detalleguiaremision (
  idDetalleGuia BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  idGuia INT(20) DEFAULT NULL,
  codigo VARCHAR(100),
  descripcion VARCHAR(100),
  cantidad DOUBLE DEFAULT NULL,
  unidMedida VARCHAR(20),
  pesoTotal DOUBLE DEFAULT NULL,
  PRIMARY KEY (idDetalleGuia),
  KEY idGuia (idGuia)
) ENGINE=MYISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table detalleguiaremision */

INSERT  INTO detalleguiaremision(idDetalleGuia,idGuia,codigo,descripcion,cantidad,unidMedida,pesoTotal) VALUES (41,2,' 002','GABINETE ELECTRICO BOLQUETE',1,'BULTO',980),(40,2,' 001','SCOOP DUCTO AURE VOLQUETE',1,'BUTO',1150),(39,1,' 002','USADO, REPARACION INCONCLUSA',1,'BULTO',980),(38,1,' 001','CABINA DE OPERADOR VOLQUETE',1,'BULTO',1950);

/*Table structure for table factura */

DROP TABLE IF EXISTS factura;

CREATE TABLE factura (
  idFactura BIGINT(20) NOT NULL,
  idCliente VARCHAR(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  serieFactura VARCHAR(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  numFactura BIGINT(7) NOT NULL,
  fechaFactura DATE DEFAULT NULL,
  fechaCancel DATE DEFAULT NULL,
  subtotal DOUBLE DEFAULT NULL,
  igv DOUBLE DEFAULT NULL,
  total DOUBLE DEFAULT NULL,
  son VARCHAR(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  fechaLetras VARCHAR(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  estado VARCHAR(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  fechaCancelLetras VARCHAR(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  descFactura VARCHAR(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  descripcionigv VARCHAR(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (idFactura,numFactura),
  UNIQUE KEY idFactura (idFactura),
  KEY idCliente (idCliente)
) ENGINE=MYISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table factura */

INSERT  INTO factura(idFactura,idCliente,serieFactura,numFactura,fechaFactura,fechaCancel,subtotal,igv,total,son,fechaLetras,estado,fechaCancelLetras,descFactura,descripcionigv) VALUES (24,'20','001',1582,'2025-01-12',NULL,144.07,25.93,170,'CIENTO SETENTA Y 00/100 DOLARES AMERICANOS','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','POR EL SERVICIO DE:\r\n',NULL),(23,'20','001',1581,'2024-01-12',NULL,144.07,25.93,170,'CIENTO SETENTA Y 00/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','null',NULL),(22,'','001',1580,'2012-02-06',NULL,3500,630,4130,'CUATRO MIL CIENTO TREINTA Y 00/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____',NULL,NULL),(21,'21','001',1579,'2012-01-18',NULL,180,0,180,'CIENTO OCHENTA Y 00/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','null',NULL),(20,'19','001',1578,'2012-01-18',NULL,3800,684,4484,'CUATRO MIL CUATROCIENTOS OCHENTA Y CUATRO Y 00/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','POR EL SERVICIO DE:\r\n',''),(19,'19','001',1577,'2012-01-17',NULL,3500,630,4130,'CUATRO MIL CIENTO TREINTA Y 00/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','POR EL SERVICIO DE:\r\n',''),(12,'19','001',1570,'2012-01-10','2012-02-16',6400,1152,7552,'SIETE MIL QUINIENTOS CINCUENTA Y DOS Y 00/100 DOLARES AMERICANOS','Tacna, 7 de Febrero del 2012','ANULADO','Tacna, 16 de Febrero del 2012','POR EL SERVICIO DE:\r\n\r\n\r\n',''),(13,'19','001',1571,'2012-02-06','2012-02-08',6400,1152,7552,'SIETE MIL QUINIENTOS CINCUENTA Y DOS Y 00/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','CANCELADO','Tacna, 8 de Febrero del 2012','POR EL SERVICIO DE:\r\n',''),(14,'19','001',1572,'2012-01-10',NULL,2000,360,2360,'DOS MIL TRECIENTOS SESENTA Y 00/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','POR EK SERVICIO DE:\r\n',''),(15,'19','001',1573,'2012-02-06',NULL,4400,792,5192,'CINCO MIL CIENTO NOVENTA Y DOS Y 00/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','POR EL SERVICIO DE:\r\n',''),(16,'19','001',1574,'2012-01-10',NULL,2000,360,2360,'DOS MIL TRECIENTOS SESENTA Y 00/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','POR EL SERVICIO DE:\r\n',''),(17,'20','001',1575,'2012-01-17',NULL,288.14,51.87,340.01,'TRECIENTOS CUARENTA Y 01/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','POR EL SERVICIO DE:\r\n',''),(18,'20','001',1576,'2012-01-17',NULL,1355.93,244.07,1600,'MIL SEISCIENTOS   Y 00/100 NUEVOS SOLES','Tacna, 6 de Febrero del 2012','POR CANCELAR','Tacna, __  de  _________________  del  ____','POR EL SERVICIO DE:',''),(25,'20','001',1583,'2012-02-13','2012-02-13',855,162.45,1017.45,'MIL  DIECISIETE Y 45/100 NUEVOS SOLES','Tacna, 13 de Febrero del 2012','ANULADO','Tacna, 13 de Febrero del 2012','POR EL SERVICIO DE:',NULL),(26,'1','001',1584,'2012-02-17',NULL,2300,414,2714,'DOS MIL SETECIENTOS CUATORCE Y 00/100 NUEVOS SOLES','Tacna, 17 de Febrero del 2012','CANCELADO','Tacna, 17 de Febrero del 2012','POR EL SERVICIO DE :\r\n','EXONERADO DEL IGV D.S. 055-99-EF APENDICE II NUMERAL TRES');

/*Table structure for table guia_remision */

DROP TABLE IF EXISTS guia_remision;

CREATE TABLE guia_remision (
  idGuia BIGINT(20) NOT NULL,
  serie VARCHAR(4),
  nroGuia BIGINT(7) NOT NULL,
  puntoPartida VARCHAR(200),
  idpais VARCHAR(20),
  puntoLlegada VARCHAR(200),
  ciudadA VARCHAR(100),
  idcliente VARCHAR(20),
  fechaTraslado VARCHAR(100),
  rSocialDestinatario VARCHAR(100),
  costoMinimo DOUBLE DEFAULT NULL,
  totCantidad DOUBLE DEFAULT NULL,
  totBulto VARCHAR(50),
  totPesoTot DOUBLE DEFAULT NULL,
  idconductor VARCHAR(10),
  idtracto VARCHAR(10),
  idrampla VARCHAR(100),
  datosTransportista VARCHAR(100),
  estado VARCHAR(30),
  PRIMARY KEY (idGuia,nroGuia),
  UNIQUE KEY idGuia (idGuia),
  KEY idpais (idpais),
  KEY idrampla (idrampla,puntoPartida),
  KEY idtracto (idtracto,puntoPartida),
  KEY idconductor (idconductor,puntoPartida),
  KEY idcliente (puntoPartida)
) ENGINE=MYISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table guia_remision */

INSERT  INTO guia_remision(idGuia,serie,nroGuia,puntoPartida,idpais,puntoLlegada,ciudadA,idcliente,fechaTraslado,rSocialDestinatario,costoMinimo,totCantidad,totBulto,totPesoTot,idconductor,idtracto,idrampla,datosTransportista,estado) VALUES (3,'001',3,'punto partida','','punto llegada','','','2012-02-17','',0,0,'',0,'','2','','1',' '),(2,'001',2,'punto partida','3','punto llegada','8','12','2012-02-15','11',0,2,'BULTOS',2130,'6','','4','2','CANCELADO'),(1,'001',1,'punto partida','5','punto llegada','12','19','2012-02-15','21',0,2,'BULTOS',2930,'5','4','6','5','CANCELADO');

/*Table structure for table impuestogeneralventas */

DROP TABLE IF EXISTS impuestogeneralventas;

CREATE TABLE impuestogeneralventas (
  idIgv INT(11) NOT NULL,
  igv DOUBLE DEFAULT NULL,
  nombreIgv VARCHAR(20) DEFAULT NULL,
  estado VARCHAR(10) DEFAULT NULL,
  descripcionIgv VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (idIgv)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

/*Data for the table impuestogeneralventas */

INSERT  INTO impuestogeneralventas(idIgv,igv,nombreIgv,estado,descripcionIgv) VALUES (1,0.18,'18%','activo','IGV ACTIVO 18%');

/*Table structure for table mic */

DROP TABLE IF EXISTS mic;

CREATE TABLE mic (
  idmic BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  uno_nombre VARCHAR(100),
  uno_direccion VARCHAR(100),
  uno_descripcion VARCHAR(100),
  uno_codigoaduana VARCHAR(100),
  dos_rol VARCHAR(100),
  die_rolcontribuyente VARCHAR(100),
  veicua_aduanadestino VARCHAR(60),
  veicua_codigoadu VARCHAR(60),
  veincin_moneda VARCHAR(10),
  veinsei_origenmerca VARCHAR(60),
  veinsei_codmerca VARCHAR(60),
  veinsie_valor VARCHAR(20),
  veinoch_flete VARCHAR(60),
  veinnue_seguro VARCHAR(20),
  trein_tipobulto VARCHAR(60),
  trein_numero VARCHAR(30),
  treinun_cantidad VARCHAR(30),
  treindos_peso VARCHAR(30),
  treinsie_numprecinto VARCHAR(100),
  treinocho_descripcion VARCHAR(500),
  treinnuev_fecha DATE DEFAULT NULL,
  tres_transito_si VARCHAR(4),
  tres_transito_no VARCHAR(4),
  cuat_nro VARCHAR(20),
  seis_fechaemision DATE DEFAULT NULL,
  siet_aduanaciudad VARCHAR(60),
  siet_codigo VARCHAR(10),
  ocho_destino VARCHAR(60),
  ocho_codigo VARCHAR(5),
  diesei_camion VARCHAR(100),
  diesei_direccion VARCHAR(120),
  diesiet_rolcontri VARCHAR(60),
  dieoch_placacamion VARCHAR(60),
  dienue_marca VARCHAR(60),
  dienue_numero VARCHAR(20),
  veint_capacidad VARCHAR(60),
  veinuno_anio VARCHAR(60),
  treintres_remitente VARCHAR(200),
  treintres_direccion VARCHAR(200),
  treintres_pais VARCHAR(30),
  treincua_destinatario VARCHAR(200),
  treincua_direccion VARCHAR(200),
  treincua_pais VARCHAR(30),
  treincin_consignatario VARCHAR(200),
  treincin_direccion VARCHAR(200),
  treincin_pais VARCHAR(30),
  treinsei_documento VARCHAR(150),
  treinsei_fecha DATE DEFAULT NULL,
  treinsei_factura VARCHAR(60),
  treinsei_codigo VARCHAR(20),
  cuaren_nrodata VARCHAR(100),
  idcliente VARCHAR(30),
  idconductor VARCHAR(30),
  idtracto VARCHAR(30),
  idrampla VARCHAR(100),
  idpais VARCHAR(30),
  cinc_hoja VARCHAR(30),
  nueve_direccion VARCHAR(120),
  doce_marca VARCHAR(20),
  doce_num VARCHAR(20),
  trece_cap VARCHAR(30),
  cator_anio VARCHAR(4),
  veintres_crt VARCHAR(30),
  nueve_codigo VARCHAR(30),
  diesei_codigo VARCHAR(30),
  veindos_rampla VARCHAR(30),
  quince_re VARCHAR(2),
  quince_se VARCHAR(2),
  veindos_re VARCHAR(2),
  veindos_se VARCHAR(2),
  treinsei_texto VARCHAR(50),
  PRIMARY KEY (idmic),
  UNIQUE KEY idmic (idmic),
  KEY idpais (idpais),
  KEY idrampla (idrampla,idcliente),
  KEY idtracto (idtracto,idcliente),
  KEY idconductor (idconductor,idcliente),
  KEY idcliente (idcliente)
) ENGINE=MYISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table mic */

INSERT  INTO mic(idmic,uno_nombre,uno_direccion,uno_descripcion,uno_codigoaduana,dos_rol,die_rolcontribuyente,veicua_aduanadestino,veicua_codigoadu,veincin_moneda,veinsei_origenmerca,veinsei_codmerca,veinsie_valor,veinoch_flete,veinnue_seguro,trein_tipobulto,trein_numero,treinun_cantidad,treindos_peso,treinsie_numprecinto,treinocho_descripcion,treinnuev_fecha,tres_transito_si,tres_transito_no,cuat_nro,seis_fechaemision,siet_aduanaciudad,siet_codigo,ocho_destino,ocho_codigo,diesei_camion,diesei_direccion,diesiet_rolcontri,dieoch_placacamion,dienue_marca,dienue_numero,veint_capacidad,veinuno_anio,treintres_remitente,treintres_direccion,treintres_pais,treincua_destinatario,treincua_direccion,treincua_pais,treincin_consignatario,treincin_direccion,treincin_pais,treinsei_documento,treinsei_fecha,treinsei_factura,treinsei_codigo,cuaren_nrodata,idcliente,idconductor,idtracto,idrampla,idpais,cinc_hoja,nueve_direccion,doce_marca,doce_num,trece_cap,cator_anio,veintres_crt,nueve_codigo,diesei_codigo,veindos_rampla,quince_re,quince_se,veindos_re,veindos_se,treinsei_texto) VALUES (49,'GRUPO LINARES S.A.','JR.AYACUCHO','nada','nada','10465321122','12345678','CHILE','279','US$','PERU','279','900','200','200','bultos','12','300','300','200','UNA CIERTA CANTIDAD DE NADA','2012-02-10','X','','001','2012-02-10','CHILE-ARICA','279','PERU-AREQUIPA','279','OXIQUIM','CHILENOS','1046537040','HG-3453','SAC','293487234','56','3423','DISTRIBUIDORA GARCIA S.A.','Av. San Jeronimo Nro 119 Umacollo Arequipa','AREQUIPA-PERU','GRUPO LINARES S.A.','PJE LEGUI 345','TACNA-PERU','JOSE MANUEL LIMACHI','CPM LEGUIA MZ Y 24','TACNA-PERU','001-009-TF','2012-02-21','001 0023','PO9233-001','NADA','1','5','2','1',NULL,'1/1','CHILENOS','SAC','293487234','56','','1','002','0067','RGT-3454','X','','X','','001'),(50,'GRUPO LINARES S.A.','JR.AYACUCHO','nada de nada','00934HG432','10465321122','44012468','CHILE','567','E','CHILE','567','534','3','5345','BOBINA','345','455','345','4234','NADA DE BULTOS','2012-02-14','','X','1','2012-02-20','PERU-TACNA','279','PERU-AREQUIPA','279','OXIQUIM','CHILENOS','1046537040','HG-3453','SAC','293487234','56','3423','GRUPO LINARES S.A.','PJE LEGUI 345','TACNA-PERU','LOS PROCABLES S.A','CALLE ARICA 123','ARICA-CHILE','DDP DEL PERU S.A.C.','Apliacion Bolognesi Mz. G LT. 5 TACNA','TACNA-PERU','345GE24','2012-02-08','423423-8676','4142342','PERU\r\nCHILE','6','3','5','9',NULL,'1/1','CN. CT-2 MZ-6 LT-1','VOLVO','347987','459','','null','009','008','RGT-3454','','X','','X','42342'),(51,'GRUPO LINARES S.A.','JR.AYACUCHO','PO 0003-2011 VCTO. 07-07-2011\r\nPOLIZA No. 300002419 07-07-2012','0578','10465321122','34979878','CHILE','997','US$','PERU','219','120263.993','2900.00','6380.000','OTROS','92','2','6380.00','','OIL ROOM REEL\r\nPARTES DE DRAGA\r\nPARA TRABAJOS DE DRAGADO','2012-02-15','','X','','2012-02-15','PERU-TACNA','251219','CHILE-ARICA','997',' ','','','','','','','','DDP DEL PERU S.A.C.','Apliacion Bolognesi Mz. G LT. 5 TACNA','TACNA-PERU','FAMESA EXPLOSIVOS S.A.C.','Car. Autopista Ancon KM 28 - Puente Piedra - Lima','LIMA-PERU','LOS PROCABLES S.A','CALLE ARICA 123','ARICA-CHILE','172-2011-6000034-01-0-00','2012-02-16','EX0845_SEA_VI_0002','6252','C.F. Santa Rosa(Tacna-Peru)\r\nC.F. Chacalluta(Arica-Chile)','5','2','4','5',NULL,'1/1','PJE LEGUI 345','NISAN','678768','87','','035/2011-PE','8133','',' ','X','','','',''),(52,'GRUPO LINARES S.A.','JR.AYACUCHO','PERM.N.128 VCTO 13.03.2011\r\nPOLIZA N-03-45-101263.VCTO.18.02.2012\r\n','0578','10465321122','44012468','CHILE','997','','PERU','219','4323','176','','CAJA DE CARTON','22','56','790','','SON 56 BULTOS CONTENIENDO: OG GOURMET BLACK, OG GOURMET LATTE, OG GOURMET MOCHA,\r\nOG GOURMET HOT CHOCOLATE, OG ORGANIC GREEN TEA, MALETIN DE PROMO\r\n\r\nTARA: 3800 KG.','2011-12-07','X','','','2012-02-15','PERU-TACNA','251219','CHILE-ARICA','997',' ','','','','','','','','OXIQUIN','CHILENOS','TACNA-PERU','DISTRIBUIDORA GARCIA S.A.','Av. San Jeronimo Nro. 119 Umacollo Arequipa','AREQUIPA-PERU','FAMESA EXPLOSIVOS S.A.C.','Car. Autopista Ancon KM 28 - Puente Piedra - Lima','LIMA-PERU','172-2011-40-000075-01-4-00','2012-01-30','001-00011701','6216','ADUANA\r\nC.F. SANTA ROSA(TACNA-PERU)\r\nCHACALLUTA(ARICA CHILE)','6','7','5','9',NULL,'1/1','CN. CT-2 MZ-6 LT-1','VOLVO','347987','459','','014/2011-PE','7721','',' ','','X','X','','');

/*Table structure for table pais */

DROP TABLE IF EXISTS pais;

CREATE TABLE pais (
  idpais BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  pais VARCHAR(50),
  ciudad VARCHAR(50),
  puerto VARCHAR(50),
  PRIMARY KEY (idpais)
) ENGINE=MYISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1;

/*Data for the table pais */

INSERT  INTO pais(idpais,pais,ciudad,puerto) VALUES (0,'','',''),(1,'PERU','TACNA','TACNA'),(2,'PERU','AREQUIPA','MATARANI'),(3,'PERU','ILO','-'),(4,'PERU','LIMA','-'),(5,'PERU','MOQUEGUA','-'),(6,'CHILE','ARICA','ARICA'),(7,'CHILE','SANTIAGO','-'),(8,'CHILE','ANTOFAGASTA','-'),(9,'BRASIL','SAO PAULO','-'),(10,'PERU','TOQUEPALA','-'),(11,'PERU','CALLAO','CALLAO'),(12,'PERU','PUNO','-'),(14,'ESTADOS UNIDOS','CALIFORNIA','DESCONOCIDO'),(15,'PERU','JULIACA','TITICACA');

/*Table structure for table ramplas */

DROP TABLE IF EXISTS ramplas;

CREATE TABLE ramplas (
  idrampla BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  idcliente VARCHAR(20)  NOT NULL,
  tipo VARCHAR(100),
  ejes VARCHAR(10),
  placa VARCHAR(100),
  nroconstancia VARCHAR(100),
  configuracion VARCHAR(100),
  clase VARCHAR(100),
  descripcion VARCHAR(100),
  estado VARCHAR(2),
  PRIMARY KEY (idrampla,idcliente),
  UNIQUE KEY idrampla (idrampla),
  KEY idcliente (idcliente)
) ENGINE=MYISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table ramplas */

INSERT  INTO ramplas(idrampla,idcliente,tipo,ejes,placa,nroconstancia,configuracion,clase,descripcion,estado) VALUES (5,'5','CAMA BAJA','765','GL','88767986','876876','J','--','1'),(4,'2','1','2','CANO3','345','345','E','--','1'),(3,'2','1','2','CANO2','23324','234','W','--','1'),(2,'2','1','2','CANO','3453','3453','D','--','1'),(1,'1','1','4','RGT-3454','2348768','203980','A','--','1'),(6,'5','CAMA BAJA','4','FK-234','89798','876987','87','--','1'),(7,'12','1','12','123456','1','1','1','1','1'),(0,'','','','','','','','',''),(9,'','','','XXXX','','','','','');

/*Table structure for table tipo_carga */

DROP TABLE IF EXISTS tipo_carga;

CREATE TABLE tipo_carga (
  idcarga BIGINT(20) NOT NULL,
  codigo INT(11) DEFAULT NULL,
  glosa VARCHAR(50),
  PRIMARY KEY (idcarga)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table tipo_carga */

INSERT  INTO tipo_carga(idcarga,codigo,glosa) VALUES (1,26,'ARMAZON'),(2,90,'ATADOS'),(3,85,'AUTOMOTOR'),(4,65,'BALA'),(5,27,'BANDEJA'),(6,16,'BARRAS'),(7,44,'BRASIL'),(8,37,'BARRILETES'),(9,24,'BAUL'),(10,34,'BIDON'),(11,91,'BOBINA'),(12,64,'BOLSA'),(13,32,'BOTELLA'),(14,31,'BOTELLA DE GAS'),(15,22,'CAJA DE CARTON'),(16,29,'CAJAS DE LATA'),(17,28,'CAJAS DE MADERA'),(18,30,'CAJAS NO DE MADERA'),(19,21,'CAJON'),(20,83,'CARRETE'),(21,36,'CESTAS'),(22,12,'CILINDROS'),(23,78,'CONTENEDOR NO REFRIGERADO'),(24,75,'CONTENEDOR REFRIGERADO'),(25,46,'CUPETES'),(26,52,'CUBO'),(27,43,'DAMAJUANA'),(28,77,'ESTANQUE'),(29,23,'FARDO'),(30,42,'FRASCO'),(31,5,'GRANEL GASEOSA (GAS)'),(32,4,'GRANEL LIQUIDO'),(33,2,'GRANEL SOLIDO, GRANOS'),(34,3,'GRANEL SOLIDO, NODULO'),(35,35,'JABAS'),(36,41,'JARRO'),(37,33,'JAULAS'),(38,82,'LAMINAS'),(39,17,'LINGOTE'),(40,63,'MALETA'),(41,88,'MAQUINARIAS'),(42,92,'OTROS'),(43,80,'PALLETS'),(44,61,'PAQUETE'),(45,39,'PIPAS'),(46,89,'PLANCHAS'),(47,1,'POLVO'),(48,66,'RED'),(49,13,'ROLLOS'),(50,62,'SACOS'),(51,99,'SIN EMBALAR'),(52,81,'TABLEROS'),(53,45,'TAMBOR'),(54,47,'TARROS'),(55,38,'TONEL'),(56,18,'TRONCOS'),(57,11,'TUBOS');

/*Table structure for table tracto */

DROP TABLE IF EXISTS tracto;

CREATE TABLE tracto (
  idtracto BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  idcliente VARCHAR(20)  NOT NULL,
  placa VARCHAR(10),
  marca VARCHAR(100),
  ejes VARCHAR(10),
  modelo VARCHAR(100),
  capacidad VARCHAR(100),
  anio VARCHAR(10),
  nroconstancia VARCHAR(100),
  configuracion VARCHAR(100),
  color VARCHAR(100),
  chasis VARCHAR(50),
  estado VARCHAR(2),
  PRIMARY KEY (idtracto,idcliente),
  UNIQUE KEY idtracto (idtracto),
  KEY idcliente (idcliente)
) ENGINE=MYISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table tracto */

INSERT  INTO tracto(idtracto,idcliente,placa,marca,ejes,modelo,capacidad,anio,nroconstancia,configuracion,color,chasis,estado) VALUES (4,'5','NAVARA','NISAN','4','ASKL','87','877','678768','87688689','KJH','876','1'),(2,'1','HG-3453','SAC','6','OTROS','56','3423','293487234','756757667','ROJO','2354','1'),(1,'1','WG-2345','MIT','4','MODELO','3','1298','234234234','234234234','AZUL','34456','1'),(5,'6','FF8234','VOLVO','3','NOSE','459','1900','347987','98798','NEGRO','34','1'),(6,'12','123456','nisan','12','1','1','1990','1','1','rojo','12','1'),(0,'','','','','','','','','','','','');

/*Table structure for table usuario */

DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario (
  idusuario BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  dni VARCHAR(10),
  nombre VARCHAR(100),
  apellidop VARCHAR(100),
  apellidom VARCHAR(100),
  direccion VARCHAR(100),
  email VARCHAR(100),
  celular VARCHAR(10),
  cargo VARCHAR(50),
  nivel VARCHAR(2),
  login VARCHAR(50),
  password VARCHAR(50),
  estado VARCHAR(2),
  fechaingreso DATE DEFAULT NULL,
  fechasalida DATE DEFAULT NULL,
  PRIMARY KEY (idusuario),
  UNIQUE KEY idusuario (idusuario)
) ENGINE=MYISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table usuario */

INSERT  INTO usuario(idusuario,dni,nombre,apellidop,apellidom,direccion,email,celular,cargo,nivel,login,password,estado,fechaingreso,fechasalida) VALUES (1,NULL,'william',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'magwi','123','1',NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jose','123456',NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'guest','',NULL,NULL,NULL);




DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spI_boleta`(
   INOUT _idboleta  INT,
   _idCliente  VARCHAR(100),
   _fechaelaboleta DATE,
   _total  DECIMAL(18,2),
   _numboleta INT,
   _serieboleta VARCHAR(10),
   _son VARCHAR(300),
   _fechaLetras VARCHAR(300),
   _estado VARCHAR(30),
   _fechaCancelLetras VARCHAR(300),
   _descripcionboleta varchar(300),
   _descripcionigv varchar(300)
)
BEGIN
SELECT IFNULL(MAX(idboleta),0)+1 INTO _idboleta FROM `boleta`;
INSERT INTO `boleta`(
   `idboleta`,
   `idCliente`,
   `fechaelaboleta`,
   `total`,
   `numboleta`,
   `serieboleta`,
   `son`,
   `fechaLetras`,
   `estado` ,
   `fechaCancelLetras`,
   `descripcionboleta`,
   `descripcionigv`
)
VALUES (
   _idboleta,
   _idCliente,
   _fechaelaboleta,
   _total,
   _numboleta,
   _serieboleta,
   _son,
   _fechaLetras,
   _estado,
   _fechaCancelLetras,
   _descripcionboleta,
   _descripcionigv

   );
END */$$
DELIMITER ;



DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spI_detalleboleta`(
   _idboleta  INT ,
   _descripcion  VARCHAR(300) ,
   _cantidad  varchar(30) ,
   _precioUnit  DECIMAL(18, 2) ,
   _importe  DECIMAL(18, 2)
)
BEGIN
INSERT INTO `detalleboleta`(
   `idboleta`,
   `descripcion`,
   `cantidad`,
   `precioUnit`,
   `importe`
)
VALUES (
   _idboleta,
   _descripcion,
   _cantidad,
   _precioUnit,
   _importe
);
END */$$
DELIMITER ;



DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spI_detallefactura`(
   _idFactura  INT ,
   _descripcion  varchar(300) ,
   _cantidad  varchar(30) ,
   _precioUnit  DECIMAL(18, 2) ,
   _importe  DECIMAL(18, 2)
)
BEGIN
INSERT INTO `detallefactura`(
   `idFactura`,
   `descripcion`,
   `cantidad`,
   `precioUnit`,
   `importe`
)
VALUES (
   _idFactura,
   _descripcion,
   _cantidad,
   _precioUnit,
   _importe
);
END */$$
DELIMITER ;



DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spI_detalleguia`(
   _idGuia INT ,
   _codigo VARCHAR(30) ,
   _descripcion varchar(250),
   _cantidad decimal(18,2),
   _unidMedida varchar(30),
   _pesoTotal decimal(18,2)
)
BEGIN
INSERT INTO `detalleguiaremision`(
   `idGuia`,
   `codigo`,
   `descripcion`,
   `cantidad`,
   `unidMedida`,
   `pesoTotal`
)
VALUES (
   _idGuia,
   _codigo,
   _descripcion,
   _cantidad,
   _unidMedida,
   _pesoTotal
);
END */$$
DELIMITER ;



DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spI_factura`(
   INOUT _idFactura  INT,
   _idCliente  VARCHAR(100),
   _fechaFactura DATE,
   _subTotal  DECIMAL(18,2),
   _igv  DECIMAL(18,2),
   _total  DECIMAL(18,2),
   _numFactura int,
   _serieFactura varchar(10),
   _son varchar(300),
   _fechaLetras varchar(300),
   _estado varchar(30),
   _fechaCancelLetras varchar(300),
   _descFactura varchar(300),
   _descripcionigv varchar(300)
)
BEGIN
SELECT IFNULL(MAX(idFactura),0)+1 INTO _idFactura FROM `factura`;
INSERT INTO `factura`(
   `idFactura`,
   `idCliente`,
   `fechaFactura`,
   `subTotal`,
   `igv`,
   `total`,
   `numFactura`,
   `serieFactura`,
   `son`,
   `fechaLetras`,
   `estado` ,
   `fechaCancelLetras`,
   `descFactura`,
   `descripcionigv`
)
VALUES (
   _idFactura,
   _idCliente,
   _fechaFactura,
   _subTotal,
   _igv,
   _total,
   _numFactura,
   _serieFactura,
   _son,
   _fechaLetras,
   _estado,
   _fechaCancelLetras,
   _descFactura,
   _descripcionigv

   );
END */$$
DELIMITER ;



DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spI_guia`(
   INOUT _idGuia  INT,
   _serie VARCHAR(10),
   _nroGuia int,
   _puntoPartida varchar(200),
   _idpais varchar(10),
   _puntoLlegada varchar(200),
   _ciudadA varchar(30),
   _idcliente varchar(30),
   _fechaTraslado date,
   _rSocialDestinatario varchar(100),
   _costoMinimo decimal(18,2),
   _totCantidad decimal(18,2),
   _totBulto varchar(50),
   _totPesoTot decimal(18,2),
   _idconductor varchar(30),
   _idtracto varchar(30),
   _idrampla varchar(30),
   _datosTransportista varchar(200),
   _estado varchar(30)

)
BEGIN
SELECT IFNULL(MAX(idGuia),0)+1 INTO _idGuia FROM `guia_remision`;
INSERT INTO `guia_remision`(
   `idGuia`,
   `serie`,
   `nroGuia`,
   `puntoPartida`,
   `idpais`,
   `puntoLlegada`,
   `ciudadA`,
   `idcliente`,
   `fechaTraslado`,
   `rSocialDestinatario`,
   `costoMinimo`,
   `totCantidad`,
   `totBulto`,
   `totPesoTot`,
   `idconductor`,
   `idtracto`,
   `idrampla`,
   `datosTransportista`,
   `estado`

)
VALUES (
   _idGuia,
   _serie,
   _nroGuia,
   _puntoPartida,
   _idpais,
   _puntoLlegada,
   _ciudadA,
   _idcliente,
   _fechaTraslado,
   _rSocialDestinatario,
   _costoMinimo,
   _totCantidad,
   _totBulto,
   _totPesoTot,
   _idconductor,
   _idtracto,
   _idrampla,
   _datosTransportista,
   _estado

   );
END */$$
DELIMITER ;

