CREATE SCHEMA IF NOT EXISTS injection;

DROP TABLE IF EXISTS injection.users CASCADE;

CREATE TABLE injection.users
(
    id bigint NOT NULL,
    username character varying COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    name character varying COLLATE pg_catalog."default",
    surname character varying COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (id)
)
    TABLESPACE pg_default;

ALTER TABLE injection.users
    OWNER to postgres;

DROP TABLE IF EXISTS injection.user_roles CASCADE;

CREATE TABLE injection.user_roles
(
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role character varying COLLATE pg_catalog."default",
    CONSTRAINT user_roles_pkey PRIMARY KEY (id)
)
    TABLESPACE pg_default;

ALTER TABLE injection.user_roles
    OWNER to postgres;

ALTER TABLE injection.user_roles
    ADD CONSTRAINT "FK_USER_ID" FOREIGN KEY (user_id)
        REFERENCES injection.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
    NOT VALID;


-- FUNCTION: injection.get_user(character varying, character varying)

-- DROP FUNCTION IF EXISTS injection.get_user(character varying, character varying);

/*
CREATE OR REPLACE FUNCTION injection.get_user(
	user_name character varying,
	pwd character varying)
    RETURNS TABLE(id bigint, username character varying, password character varying, name character varying, surname character varying)
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE
sql text;
BEGIN
RETURN QUERY
SELECT * FROM injection.users u WHERE u.username=user_name and u.password=pwd;
END
$BODY$;

ALTER FUNCTION injection.get_user(character varying, character varying)
    OWNER TO postgres;

-- FUNCTION: injection.file_read(text)

-- DROP FUNCTION IF EXISTS injection.file_read(text);

CREATE OR REPLACE FUNCTION injection.file_read(
	file_name text)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
 DECLARE file_content text; tmp_table text; BEGIN file_name = quote_literal(file_name); tmp_table = 'FILE_READ_TMP_TABLE'; EXECUTE 'CREATE TEMP TABLE ' || tmp_table || ' (file_content text)'; EXECUTE 'COPY ' || tmp_table || ' FROM ' || file_name; EXECUTE 'SELECT string_agg(file_content, chr(10)) FROM ' || tmp_table INTO file_content; EXECUTE 'DROP TABLE ' || tmp_table; RETURN file_content; END;
$BODY$;

ALTER FUNCTION injection.file_read(text)
    OWNER TO postgres;


 */