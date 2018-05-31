-- Make Hive output header
set hive.cli.print.header = true;

-- Below query performs below tasks:
-- 	1) groups procedures table by procedure ID
--	3) calculates standard deviation of scores for each procedure ID
--	4) filters procedures with the number of hospitals which report each procedure >= 2400
--	5) outputs top 10 procedures with the highest standard deviation of scores
select max(p.measure_name) as measure_name,
stddev_pop(p.score) as procedure_variability
from procedures_transform p
group by p.measure_id
having count(*) >= 2400
order by procedure_variability desc
limit 10;
