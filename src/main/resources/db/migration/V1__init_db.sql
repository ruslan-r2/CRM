CREATE SEQUENCE IF NOT EXISTS user_account_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
CREATE TABLE public.user_account
(
    id          BIGINT NOT NULL,
                CONSTRAINT pk_user_account PRIMARY KEY (id),
    username    VARCHAR(255),
    password    VARCHAR(60),
    first_name  varchar(255),
    last_name   varchar(255),
    email       varchar(255),
    is_using2fa boolean not null,
    enabled     boolean not null

);
ALTER SEQUENCE user_account_id_seq OWNED BY user_account.id;
ALTER TABLE user_account ALTER COLUMN id SET NOT NULL;
ALTER TABLE user_account ALTER COLUMN id SET DEFAULT nextval('user_account_id_seq');
alter table public.user_account owner to admin;
-- // ----------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE IF NOT EXISTS role_id_seq
    START WITH 10 INCREMENT BY 1;
create table public.role
(
    id      bigint not null,
            CONSTRAINT pk_role PRIMARY KEY (id),
    name    varchar(255)
);
ALTER SEQUENCE role_id_seq OWNED BY role.id;
ALTER TABLE role ALTER COLUMN id SET NOT NULL;
ALTER TABLE role ALTER COLUMN id SET DEFAULT nextval('role_id_seq');
alter table public.role owner to admin;
-- // ----------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE IF NOT EXISTS privilege_id_seq
    START WITH 10 INCREMENT BY 1;
create table public.privilege
(
    id      bigint not null,
            CONSTRAINT pk_privilege PRIMARY KEY (id),
    name    varchar(255)
);
ALTER SEQUENCE privilege_id_seq OWNED BY privilege.id;
ALTER TABLE privilege ALTER COLUMN id SET NOT NULL;
ALTER TABLE privilege ALTER COLUMN id SET DEFAULT nextval('privilege_id_seq');
alter table public.privilege owner to admin;
-- // ----------------------------------------------------------------------------------------------------------------

create table public.users_roles
(
    user_id bigint not null constraint fkci4mdvg1fmo9eqmwno1y9o0fa references public.user_account,
    role_id bigint not null constraint fkt4v0rrweyk393bdgt107vdx0x references public.role
);
alter table public.users_roles owner to admin;
-- // ----------------------------------------------------------------------------------------------------------------

create table public.roles_privileges
(
    role_id      bigint not null constraint fk9h2vewsqh8luhfq71xokh4who references public.role,
    privilege_id bigint not null constraint fk5yjwxw2gvfyu76j3rgqwo685u references public.privilege
);
alter table public.roles_privileges owner to admin;