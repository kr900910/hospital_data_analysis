--Make Hive output header
set hive.cli.print.header = true;

-- Below query performs below tasks:
--      1) joins hosptials table and procedures table
--      2) groups them by hospital ID
--      3) calculates average procedure score divided by standard deviation of scores
--         (variability adjusted hospital score)
--      4) filters hospitals with procedure count >= 25
--      5) outputs hospital ID, state, and variability adjusted average quality score
--	6) groups the table from (5) by state
--	7) calculates average hospital score divided by standard deviation of scores
--	   (variability adjusted state score)
--	8) filters states with hospital count >= 10
--	9) ouputs 10 states with highest variability adjusted state score
select a.state, avg(adjusted_avg_score)/stddev_pop(adjusted_avg_score) as avg_state_score
from (select h.provider_id as provider_id,
max(h.state) as state,
avg(p.score)/stddev_pop(p.score) as adjusted_avg_score
from hospitals_transform h join procedures_transform p on h.provider_id = p.provider_id
group by h.provider_id
having count(*) >= 25) a
group by a.state
having count(*) >= 10
order by avg_state_score desc
limit 10;

