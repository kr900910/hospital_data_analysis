DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip_code string,
  county string,
  phone_number string,
  hospital_type string,
  hospital_ownership string,
  emergency_services string,
  use_ehr string,
  hospital_rating string,
  hospital_rating_footnote string,
  mortality_national_comp string,
  mortality_national_comp_footnote string,
  safety_national_comp string,
  safety_national_comp_footnote string,
  readmission_national_comp string,
  readmission_national_comp_footnote string,
  patient_exp_national_comp string,
  patient_exp_national_comp_footnote string,
  effectiveness_national_comp string,
  effectiveness_national_comp_footnote string,
  timeliness_national_comp string,
  timeliness_national_comp_footnote string,
  effecient_imaging_national_comp string,
  effecient_imaging_national_comp_footnote string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

DROP TABLE measures;
CREATE EXTERNAL TABLE measures
(
  measure_name string,
  measure_id string,
  measure_start_quarter string,
  measure_start_date string,
  measure_end_quarter string,
  measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

DROP TABLE deaths;
CREATE EXTERNAL TABLE deaths
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip_code string,
  county string,
  phone string,
  measure_name string,
  measure_id string,
  comp_to_national string,
  denominator string,
  score string,
  lower_est string,
  higher_est string,
  footnote string,
  measure_start_date string,
  measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/deaths';

DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip_code string,
  county string,
  phone_number string,
  condition string,
  measure_id string,
  measure_name string,
  score string,
  sample string,
  footnote string,
  measure_start_date string,
  measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip_code string,
  county string,
  phone_number string,
  measure_name string,
  measure_id string,
  comp_to_national string,
  denominator string,
  score string,
  lower_est string,
  higher_est string,
  footnote string,
  measure_start_date string,
  measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE surveys_responses;
CREATE EXTERNAL TABLE surveys_responses
(
  provider_id string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip_code string,
  county string,
  comm_nurse_floor string,
  comm_nurse_achieve_threshold string,
  comm_nurse_benchmark string,
  comm_nurse_baseline string,
  comm_nurse_perf string,
  comm_nurse_achieve_points string,
  comm_nurse_improve_points string,
  comm_nurse_dim_score string,
  comm_doctor_floor string,
  comm_doctor_achieve_threshold string,
  comm_doctor_benchmark string,
  comm_doctor_baseline string,
  comm_doctor_perf string,
  comm_doctor_achieve_points string,
  comm_doctor_improve_points string,
  comm_doctor_dim_score string,
  response_staff_floor string,
  response_staff_achieve_threshold string,
  response_staff_benchmark string,
  response_staff_baseline string,
  response_staff_perf string,
  response_staff_achieve_points string,
  response_staff_improve_points string,
  response_staff_dim_score string,
  pain_manage_floor string,
  pain_manage_achieve_threshold string,
  pain_manage_benchmark string,
  pain_manage_baseline string,
  pain_manage_perf string,
  pain_manage_achieve_points string,
  pain_manage_improve_points string,
  pain_manage_dim_score string,
  comm_medicine_floor string,
  comm_medicine_achieve_threshold string,
  comm_medicine_benchmark string,
  comm_medicine_baseline string,
  comm_medicine_perf string,
  comm_medicine_achieve_points string,
  comm_medicine_improve_points string,
  comm_medicine_dim_score string,
  clean_quiet_floor string,
  clean_quiet_achieve_threshold string,
  clean_quiet_benchmark string,
  clean_quiet_baseline string,
  clean_quiet_perf string,
  clean_quiet_achieve_points string,
  clean_quiet_improve_points string,
  clean_quiet_dim_score string,
  discharge_info_floor string,
  discharge_info_achieve_threshold string,
  discharge_info_benchmark string,
  discharge_info_baseline string,
  discharge_info_perf string,
  discharge_info_achieve_points string,
  discharge_info_improve_points string,
  discharge_info_dim_score string,
  overall_floor string,
  overall_achieve_threshold string,
  overall_benchmark string,
  overall_baseline string,
  overall_perf string,
  overall_achieve_points string,
  overall_improve_points string,
  overall_dim_score string,
  hcahps_base_score string,
  hcahps_consistency_score string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';
