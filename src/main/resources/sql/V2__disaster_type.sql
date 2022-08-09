-- public.disaster_type definition

-- Drop table

-- DROP TABLE public.disaster_type;

CREATE TABLE public.disaster_type (
	disaster_type_id int4 NOT NULL,
	disaster_type varchar(100) NULL,
	CONSTRAINT disaster_type_key PRIMARY KEY (disaster_type_id)
);


-- public.patient_admit_out definition

-- Drop table

-- DROP TABLE public.patient_admit_out;

CREATE TABLE public.patient_admit_out (
	pat_id int4 NOT NULL,
	prvdr_nbr int4 NOT NULL,
	admit_date int4 NOT NULL,
	CONSTRAINT patient_admit_out_pkey PRIMARY KEY (pat_id, prvdr_nbr)
);


-- public.patient_out definition

-- Drop table

-- DROP TABLE public.patient_out;

CREATE TABLE public.patient_out (
	pat_id int4 NOT NULL,
	age_range varchar(12) NULL,
	dod varchar(255) NULL,
	first_name varchar(100) NULL,
	last_name varchar(100) NULL,
	pat_state varchar(25) NULL,
	CONSTRAINT patient_out_pkey PRIMARY KEY (pat_id)
);


-- public.patient_status_update definition

-- Drop table

-- DROP TABLE public.patient_status_update;

CREATE TABLE public.patient_status_update (
	update_pk serial4 NOT NULL,
	disaster_type_id int4 NULL,
	disaster_type varchar(100) NULL,
	prvdr_nbr int4 NULL,
	prvdr_name varchar(200) NULL,
	pat_id int4 NULL,
	pat_state varchar(25) NULL,
	first_name varchar(100) NULL,
	last_name varchar(100) NULL,
	"date" date NULL,
	status varchar(100) NULL,
	message_status varchar(2000) NULL,
	CONSTRAINT patient_status_update_pkey PRIMARY KEY (update_pk)
);


-- public.prvdr_out definition

-- Drop table

-- DROP TABLE public.prvdr_out;

CREATE TABLE public.prvdr_out (
	prvdr_nbr int4 NOT NULL,
	cms_region varchar(2) NULL,
	prvdr_addr varchar(500) NULL,
	prvdr_cert_date varchar(10) NULL,
	prvdr_city varchar(100) NULL,
	prvdr_future varchar(100) NULL,
	prvdr_name varchar(200) NULL,
	prvdr_ph varchar(20) NULL,
	prvdr_profit_type varchar(20) NULL,
	prvdr_state_cd varchar(2) NULL,
	prvdr_type_num int4 NULL,
	prvdr_zip varchar(10) NULL,
	CONSTRAINT prvdr_out_pkey PRIMARY KEY (prvdr_nbr)
);


-- public.user_roles definition

-- Drop table

-- DROP TABLE public.user_roles;

CREATE TABLE public.user_roles (
	role_group_id int4 NOT NULL,
	role_group_desc varchar(200) NULL,
	"role" varchar(100) NULL,
	role_desc varchar(100) NULL,
	CONSTRAINT user_roles_pkey PRIMARY KEY (role_group_id)
);


-- public.acme_user_to_user_role definition

-- Drop table

-- DROP TABLE public.acme_user_to_user_role;

CREATE TABLE public.acme_user_to_user_role (
	prvdr_user_pk serial4 NOT NULL,
	prvdr_nbr int4 NULL,
	role_group_id int4 NULL,
	CONSTRAINT acme_user_to_user_role_pkey PRIMARY KEY (prvdr_user_pk),
	CONSTRAINT acme_user_to_user_role_role_group_id_fkey FOREIGN KEY (role_group_id) REFERENCES public.user_roles(role_group_id)
);


-- public.admit_user definition

-- Drop table

-- DROP TABLE public.admit_user;

CREATE TABLE public.admit_user (
	user_pk serial4 NOT NULL,
	user_id varchar(20) NULL,
	user_name varchar(200) NULL,
	user_pwd varchar(20) NULL,
	user_last_name varchar(200) NULL,
	role_group_id int4 NULL,
	CONSTRAINT admit_user_pkey PRIMARY KEY (user_pk),
	CONSTRAINT admit_user_role_group_id_fkey FOREIGN KEY (role_group_id) REFERENCES public.user_roles(role_group_id)
);


-- public.disaster_out definition

-- Drop table

-- DROP TABLE public.disaster_out;

CREATE TABLE public.disaster_out (
	disaster_occr_id serial4 NOT NULL,
	end_date timestamp NULL,
	start_date timestamp NOT NULL,
	zip_code varchar(10) NOT NULL,
	disaster_type_id int4 NOT NULL,
	CONSTRAINT disaster_out_pkey PRIMARY KEY (disaster_occr_id),
	CONSTRAINT disaster_out_disaster_type_id_fkey FOREIGN KEY (disaster_type_id) REFERENCES public.disaster_type(disaster_type_id)
);
