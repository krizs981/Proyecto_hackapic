DROP DATABASE IF EXISTS  hackapic;
CREATE DATABASE IF NOT EXISTS hackapic CHARACTER SET="utf8mb4" COLLATE="utf8mb4_unicode_ci";

USE hackapic;
CREATE TABLE IF NOT EXISTS usuario (
	id_usuario INTEGER AUTO_INCREMENT PRIMARY KEY, 
	username VARCHAR(50) NOT NULL, 
	email VARCHAR(50) NOT NULL, 
	foto_perfil VARCHAR (250) NOT NULL, 
	contrasena VARCHAR(50) NOT NULL, 
	descripcion_usuario VARCHAR(150) NOT NULL,
    CONSTRAINT UC_user UNIQUE (username, email) 

) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS imagen (
    id_imagen INTEGER AUTO_INCREMENT PRIMARY KEY,
    foto_imagen VARCHAR (250) NOT NULL,
    descripcion_imagen VARCHAR(250) NOT NULL,
    fecha_publicacion TIMESTAMP (6) NOT NULL,
    id_usuario INTEGER NOT NULL,
    CONSTRAINT imagen_id_usuario_fk1
    FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS da_like (
	id_usuario INTEGER AUTO_INCREMENT,
	id_imagen INTEGER NOT NULL,
    PRIMARY KEY(id_usuario, id_imagen),
	CONSTRAINT da_like_id_usuario_fk1
	FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    CONSTRAINT da_like_id_imagen_fk2
    FOREIGN KEY(id_imagen) REFERENCES imagen(id_imagen) ON DELETE CASCADE
) ENGINE=INNODB;



CREATE TABLE IF NOT EXISTS comenta (
	id_usuario_comenta INTEGER AUTO_INCREMENT PRIMARY KEY,
	id_usuario INTEGER NOT NULL,
	id_imagen INTEGER NOT NULL,
	comentario_imagen VARCHAR(250) NOT NULL,
    fecha_comentario TIMESTAMP (6) NOT NULL,
    CONSTRAINT comenta_id_usuario_fk1
	FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    CONSTRAINT comenta_id_imagen_fk2
    FOREIGN KEY(id_imagen) REFERENCES imagen(id_imagen) ON DELETE CASCADE
) ENGINE=INNODB;