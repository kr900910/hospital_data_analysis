-- The below query performs the below operations:
-- 	1) joins hospitals, procedures, and survey tables on hospital ID
--	2) groups by hospital ID
--	3) calculates average score and standard deviation of scores for each hospital
--	4) calculates correlation between average score and survey score, correlation
-- 	   between standard deviation of scores and survey score, and correlation between
--         variability adjusted average score and survey score.
select corr(avg_score, survey_score),
corr(std_score, survey_score),
corr(avg_score/std_score, survey_score)
from (select cast(avg(p.score) as float) as avg_score,
cast(stddev_pop(p.score) as float) as std_score,
cast(max(s.overall_perf) as float) as survey_score
from hospitals_transform h
join procedures_transform p on h.provider_id = p.provider_id
join survey_results_transform s on h.provider_id = s.provider_id
group by h.provider_id
having count(*) >= 20) a;
