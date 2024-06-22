select 
r.date,
s.first_name,
s.last_name,
s.hourly_rate,
sh.start_time,
sh.end_time,
datediff(hour,sh.start_time,sh.end_time) as shift_hours,
datediff(hour,sh.start_time,sh.end_time)* s.hourly_rate as staff_cost
from rota r 
left join staff s on r.staff_id = s.staff_id
left join shift sh on r.shift_id = sh.shift_id