\COPY disaster_type(disaster_type_id, disaster_type) FROM '/Users/gkollengode/Downloads/DataSet_v2//disaster_type.csv' DELIMITER ',' CSV HEADER;
\COPY user_roles(role_group_id,role_group_desc,role,role_desc) FROM '/Users/gkollengode/Downloads/DataSet_v2/user_roles.csv' DELIMITER ',' CSV HEADER;
\COPY acme_user_to_user_role(prvdr_nbr,role_group_id) FROM '/Users/gkollengode/Downloads/DataSet_v2/acme_user_to_user_role.csv' DELIMITER ',' CSV HEADER;
\COPY admit_user(user_id,user_name,user_pwd,user_last_name,role_group_id) FROM '/Users/gkollengode/Downloads/DataSet_v2/admit_user.csv' DELIMITER ',' CSV HEADER;
\COPY patient_admit_out(pat_id,prvdr_nbr,admit_date) FROM '/Users/gkollengode/Downloads/DataSet_v2/patient_admit_out.csv' DELIMITER ',' CSV HEADER;
\COPY patient_out(pat_id,first_name,last_name,pat_state,age_range,dod) FROM '/Users/gkollengode/Downloads/DataSet_v2/patient_out.csv' DELIMITER ',' CSV HEADER;
