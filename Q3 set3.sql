DELIMITER //
CREATE TRIGGER delete_cascade
  AFTER DELETE on movies
    FOR EACH ROW 
    BEGIN
      UPDATE rentals
        SET movieid = NULL
          WHERE movieid
                       NOT IN
            ( SELECT distinct id
              from movies );
    END //
DELIMITER ;

drop trigger if exists delete_cascade;
select *
  from movies;

INSERT INTO movies ( id,             title,          category )
      Values ( 11, 'The Dark Knight', 'Action/Adventure');

INSERT INTO rentals ( memid, first_name, last_name, movieid ) 
           Values (     9,     'Moin',   'Dalvi',      11 );

delete from movies
  where id = 11;

SELECT id
  from movies;

SELECT *
  from rentals;

DELIMITER //
CREATE TRIGGER update_cascade
  AFTER UPDATE on movies
    FOR EACH ROW 
    BEGIN
      UPDATE rentals
        SET movieid = new.id
          WHERE movieid = old.id;
    END //
DELIMITER ;
DROP trigger if exists update_cascade;

INSERT INTO movies ( id,             title,          category )
      Values ( 12, 'The Dark Knight', 'Action/Adventure'); 

UPDATE rentals
  SET movieid = 12
    WHERE memid = 9;

UPDATE movies
  SET id = 11
    WHERE title regexp 'Dark Knight';

select *
  from movies;

select *
  from rentals;
