CREATE TABLE survey_results_transform AS
SELECT provider_id, overall_perf
FROM surveys_responses;
