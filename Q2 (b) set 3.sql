use assignment;
select c.customernumber, c.customername, o.status
from customers c left join orders o
using (customernumber);