-- Make Hive output header
set hive.cli.print.header = true;

-- Below query performs below tasks:
-- 	1) joins hosptials table and procedures table
--	2) groups them by hospital ID
--	3) calculates average procedure score divided by standard deviation of scores
--	   (variability adjusted average hospital score)
--	4) filters hospitals with procedure count >= 25
--	5) outputs top 10 hospitals with highest variability adjusted hospital score
select h.provider_id as provider_id,
max(h.hospital_name) as hospital_name,
avg(p.score)/stddev_pop(p.score) as adjusted_avg_score
from hospitals_transform h join procedures_transform p on h.provider_id = p.provider_id 
group by h.provider_id
having count(*) >= 25
order by adjusted_avg_score desc
limit 10;
