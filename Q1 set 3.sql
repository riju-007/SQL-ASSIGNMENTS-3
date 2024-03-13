CREATE DEFINER=`root`@`localhost` PROCEDURE `order_status`(t_year int, t_month int)
BEGIN
select orderNumber, orderDate, status
from orders
where year(orderDate)= t_year and month(orderDate)= t_month;
END