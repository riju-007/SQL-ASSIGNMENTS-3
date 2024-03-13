use assignment;
select fname, salary, rank() over(order by salary desc) as emp_rank
from employee;