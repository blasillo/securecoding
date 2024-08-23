--DROP TABLE users;
CREATE TABLE injection.users
(
    id NUMBER(10) NOT NULL,
    username VARCHAR2(100) NOT NULL,
    password VARCHAR2(100) NOT NULL,
    name VARCHAR2(255),
    surname VARCHAR2(255)
);

ALTER TABLE injection.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

--DROP TABLE user_roles;
CREATE TABLE injection.user_roles
(
    id NUMBER(10) NOT NULL,
    user_id NUMBER(10) NOT NULL,
    role VARCHAR2(100)
);
ALTER TABLE injection.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);

ALTER TABLE injection.user_roles
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id)
        REFERENCES injection.users (id);

--DROP TABLE flags;
CREATE TABLE injection.flags
(
    id NUMBER(10) NOT NULL,
    flag VARCHAR2(100),
    CONSTRAINT flags_pkey PRIMARY KEY (id)
);
