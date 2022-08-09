-- public.disaster_type definition

-- Drop table

-- DROP TABLE public.disaster_type;

CREATE TABLE public.disaster_type_raghu (
	disaster_type_id int4 NOT NULL,
	disaster_type varchar(100) NULL,
	CONSTRAINT disaster_type_pkey PRIMARY KEY (disaster_type_id)
);