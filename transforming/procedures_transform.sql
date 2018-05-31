CREATE TABLE procedures_transform AS
SELECT provider_id, measure_name, measure_id, score from deaths where score not like "%not available%"
UNION ALL
SELECT provider_id, measure_name, measure_id, score from effective_care where score not like "%not available%"
UNION ALL
SELECT provider_id, measure_name, measure_id, score from readmissions where score not like "%not available%";
