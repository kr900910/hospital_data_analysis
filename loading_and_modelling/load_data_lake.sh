tail -n +2 "Complications and Deaths - Hospital.csv" > deaths.csv
tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Measure Dates.csv" > measures.csv
tail -n +2 "hvbp_hcahps_11_10_2016.csv" > surveys_responses.csv
tail -n +2 "Hospital Returns - Hospital.csv" > readmissions.csv

hdfs dfs -put deaths.csv hospital_compare/deaths
hdfs dfs -put hospitals.csv hospital_compare/hospitals
hdfs dfs -put effective_care.csv hospital_compare/effective_care
hdfs dfs -put measures.csv hospital_compare/measures
hdfs dfs -put surveys_responses.csv hospital_compare/surveys_responses
hdfs dfs -put readmissions.csv hospital_compare/readmissions
