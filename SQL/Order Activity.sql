select 
o.order_id,
i.item_price,
o.quantity,
i.item_category,
i.item_name,
o.created_at,
a.delivery_address1,
a.delivery_address2,
a.delivery_city,
a.delivery_zipcode,
o.delivery
from 
orders o
left join items i on o.item_id = i.item_id
left join address a on o.add_id = a.add_id 