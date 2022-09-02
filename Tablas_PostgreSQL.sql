BEGIN;


CREATE TABLE IF NOT EXISTS public."Años"
(
    "Id_Años" bigint NOT NULL,
    "Anio" bigint,
    PRIMARY KEY ("Id_Años")
);

CREATE TABLE IF NOT EXISTS public."Emisiones_CO2"
(
    "ID_Emisiones_CO2" bigint NOT NULL,
    "Id_Pais" bigint,
    "Id_anio" bigint,
    "Emisiones_CO2" double precision,
    PRIMARY KEY ("ID_Emisiones_CO2")
);

CREATE TABLE IF NOT EXISTS public."Energia_Carbon"
(
    "Id_Energia_Carbon" bigint NOT NULL,
    "Id_Pais" bigint,
    "Id_Anio" bigint,
    "Consumo_Carbon" text COLLATE pg_catalog."default",
    "Produccion_Carbono" text COLLATE pg_catalog."default",
    PRIMARY KEY ("Id_Energia_Carbon")
);

CREATE TABLE IF NOT EXISTS public."Energia_Eolica"
(
    "Id_Energia_Eolica" bigint NOT NULL,
    "Id_Pais" bigint,
    "Id_anio" bigint,
    "Consumo_Eolica" text COLLATE pg_catalog."default",
    "Produccion_Eolica" text COLLATE pg_catalog."default",
    "Capacidad_instalada_Eolica" text COLLATE pg_catalog."default",
    PRIMARY KEY ("Id_Energia_Eolica")
);

CREATE TABLE IF NOT EXISTS public."Energia_Geotermica"
(
    "Id_Energia_Geotermica" bigint NOT NULL,
    "Id_Pais" bigint,
    "Id_Anio" double precision,
    "Produccion_Geotermica" text COLLATE pg_catalog."default",
    PRIMARY KEY ("Id_Energia_Geotermica")
);

CREATE TABLE IF NOT EXISTS public."Energia_nuclear"
(
    "Id_Energia_nuclear" bigint NOT NULL,
    "Id_Pais" bigint,
    "Id_anio" bigint,
    "Consumo_Nuclear" double precision,
    "Produccion_Nuclear" double precision,
    PRIMARY KEY ("Id_Energia_nuclear")
);

CREATE TABLE IF NOT EXISTS public."Energia_petroleo"
(
    "ID_Energia_petroleo" bigint NOT NULL,
    "Id_Pais" bigint,
    "Id_anio" bigint,
    "Consumo_Petroleo" bigint,
    "Produccion_Petroleo" bigint,
    "Reservas_Petroleo" double precision,
    PRIMARY KEY ("ID_Energia_petroleo")
);

CREATE TABLE IF NOT EXISTS public."Energia_solar"
(
    "Id_Energia_solar" bigint NOT NULL,
    "Id_Pais" bigint,
    "Id_anio" bigint,
    "Consumo_solar" double precision,
    "Produccion_solar" double precision,
    "Instalada_solar" bigint,
    PRIMARY KEY ("Id_Energia_solar")
);

CREATE TABLE IF NOT EXISTS public."Gas_Natural"
(
    "ID_Gas_Natural" bigint NOT NULL,
    "Id_Pais" bigint,
    "Id_anio" bigint,
    "Reserva_Gas" double precision,
    "Produccion_gas" double precision,
    "Consumo_gas" double precision,
    PRIMARY KEY ("ID_Gas_Natural")
);

CREATE TABLE IF NOT EXISTS public."Irradianza"
(
    "Id_Irradianza" bigint NOT NULL,
    "Id_Pais" bigint,
    "Id_Anio" double precision,
    "Irradianza" double precision,
    PRIMARY KEY ("Id_Irradianza")
);

CREATE TABLE IF NOT EXISTS public."Paises"
(
    "Id_pais" bigint NOT NULL,
    "Codigo_pais" text COLLATE pg_catalog."default",
    "Pais" text COLLATE pg_catalog."default",
    PRIMARY KEY ("Id_pais")
);

CREATE TABLE IF NOT EXISTS public."Poblacion_Mundo"
(
    "Id_Poblacion" bigint NOT NULL,
    "Id_Pais" bigint,
    "Id_Anio" bigint,
    "Poblacion" double precision,
    PRIMARY KEY ("Id_Poblacion")
);

ALTER TABLE IF EXISTS public."Emisiones_CO2"
    ADD FOREIGN KEY ("Id_Pais")
    REFERENCES public."Paises" ("Id_pais") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Emisiones_CO2"
    ADD FOREIGN KEY ("Id_anio")
    REFERENCES public."Años" ("Id_Años") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_Carbon"
    ADD FOREIGN KEY ("Id_Pais")
    REFERENCES public."Paises" ("Id_pais") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_Carbon"
    ADD FOREIGN KEY ("Id_Anio")
    REFERENCES public."Años" ("Id_Años") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_Eolica"
    ADD FOREIGN KEY ("Id_Pais")
    REFERENCES public."Paises" ("Id_pais") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_Eolica"
    ADD FOREIGN KEY ("Id_anio")
    REFERENCES public."Años" ("Id_Años") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_Geotermica"
    ADD FOREIGN KEY ("Id_Pais")
    REFERENCES public."Paises" ("Id_pais") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_Geotermica"
    ADD FOREIGN KEY ("Id_Anio")
    REFERENCES public."Años" ("Id_Años") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_nuclear"
    ADD FOREIGN KEY ("Id_Pais")
    REFERENCES public."Paises" ("Id_pais") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_nuclear"
    ADD FOREIGN KEY ("Id_anio")
    REFERENCES public."Años" ("Id_Años") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_petroleo"
    ADD FOREIGN KEY ("Id_Pais")
    REFERENCES public."Paises" ("Id_pais") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_petroleo"
    ADD FOREIGN KEY ("Id_anio")
    REFERENCES public."Años" ("Id_Años") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_solar"
    ADD FOREIGN KEY ("Id_Pais")
    REFERENCES public."Paises" ("Id_pais") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Energia_solar"
    ADD FOREIGN KEY ("Id_anio")
    REFERENCES public."Años" ("Id_Años") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Gas_Natural"
    ADD FOREIGN KEY ("Id_Pais")
    REFERENCES public."Paises" ("Id_pais") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Gas_Natural"
    ADD FOREIGN KEY ("Id_anio")
    REFERENCES public."Años" ("Id_Años") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Irradianza"
    ADD FOREIGN KEY ("Id_Pais")
    REFERENCES public."Paises" ("Id_pais") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Irradianza"
    ADD FOREIGN KEY ("Id_Anio")
    REFERENCES public."Años" ("Id_Años") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Poblacion_Mundo"
    ADD FOREIGN KEY ("Id_Pais")
    REFERENCES public."Paises" ("Id_pais") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Poblacion_Mundo"
    ADD FOREIGN KEY ("Id_Anio")
    REFERENCES public."Años" ("Id_Años") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;