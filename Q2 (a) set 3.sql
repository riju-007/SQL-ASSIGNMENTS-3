use assignment;
select *,
     CASE
      WHEN amount < 25000 THEN 'Silver'
      WHEN amount BETWEEN 25000 AND 50000 THEN 'Gold'
            ELSE 'Platinum'
            END AS Status
  from payments;