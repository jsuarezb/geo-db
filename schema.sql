DROP TABLE localidades_sin_index;
DROP TABLE localidades_con_index;

CREATE TABLE localidades_sin_index (
	id 					 SERIAL,
	geom 				 GEOMETRY(Point, 4326),
	nombre 			 VARCHAR(256),
	tipo 				 VARCHAR(256),
	provincia 	 VARCHAR(256),
	departamento VARCHAR(256),
	signo 			 INTEGER,
	canthab 		 INTEGER,
	fuente 			 VARCHAR
);

CREATE TABLE localidades_con_index (
	id 					 SERIAL,
	geom 				 GEOMETRY(Point, 4326),
	nombre 			 VARCHAR(256),
	tipo 				 VARCHAR(256),
	provincia 	 VARCHAR(256),
	departamento VARCHAR(256),
	signo 			 INTEGER,
	canthab 		 INTEGER,
	fuente 			 VARCHAR
);

CREATE INDEX localidades_geog_idx
	ON localidades_con_index USING GIST (geography(geom));


DROP TABLE sube_sin_index;
DROP TABLE sube_con_index;

CREATE TABLE sube_sin_index (
	id 					 SERIAL,
	geom 				 GEOMETRY(Point, 4326),
	lat 				 REAL,
	lon 				 REAL,
	branchtype 	 VARCHAR,
	calification INTEGER,
	denunciable  VARCHAR,
	description  VARCHAR,
	empresaid 	 VARCHAR,
	localidad 	 VARCHAR,
	location 		 VARCHAR,
	provincia 	 VARCHAR,
	time 				 VARCHAR,
	type 				 INTEGER,
	types 			 VARCHAR
);

CREATE TABLE sube_con_index (
	id 					 SERIAL,
	geom 				 GEOMETRY(Point, 4326),
	lat 				 REAL,
	lon 				 REAL,
	branchtype 	 VARCHAR,
	calification INTEGER,
	denunciable  VARCHAR,
	description  VARCHAR,
	empresaid 	 VARCHAR,
	localidad 	 VARCHAR,
	location 		 VARCHAR,
	provincia 	 VARCHAR,
	time 				 VARCHAR,
	type 				 INTEGER,
	types 			 VARCHAR
);

CREATE INDEX sube_geog_idx
	ON sube_con_index USING GIST (geography(geom))
