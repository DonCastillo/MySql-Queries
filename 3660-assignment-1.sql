/* Find all information on workers. */

select * from WORKER;


/* Find the maintenance time of sheets that have a 2pm draw time. (Note: no nested
queries) */

select SHEET.maint_time
from SHEET, DRAW
where SHEET.SheetID = DRAW.SheetID and DRAW.time = '14:00:00';


/* Find the maintenance time of sheets that have a 2pm draw time. (Note: use a nested
query this time) */

select SHEET.maint_time
from SHEET
where SHEET.sheetID in
    (select DRAW.sheetID
    from DRAW
    where DRAW.time = '14:00:00');



/* Find the name and address of workers that work during draws on sheet 2. */

select name, address
from WORKER
where exists
    (select * 
     from WORKS, DRAW
     where WORKS.drawID = DRAW.drawID and
           WORKS.id = WORKER.id and
           DRAW.sheetID = 2);




/* Find the name and address of workers that have worked during every draw. */

select WORKER.name, WORKER.address
from WORKER
where not exists
    (select * from DRAW
    where not exists
        (select * from WORKS
        where WORKS.drawID = DRAW.drawID and
        WORKS.id = WORKER.id
        )
    )

/* Find the date and times of draws that are only assigned workers from Lethbridge. */

select DRAW.date, DRAW.time
from DRAW where drawID not in
    (select drawID
     from WORKS, WORKER
     where WORKS.id = WORKER.id and
           WORKER.city != 'Lethbridge' 
    );


/* Find the average pay of workers that work during draws on February 14th. */
select avg(pay)
from WORKS, DRAW 
where WORKS.drawID = DRAW.drawID and
      DRAW.date = 'February 14';



/* Find the total number of draws that each worker is assigned to work. */

select WORKER.name, count(WORKS.drawID)
from WORKER, WORKS
where WORKER.id = WORKS.id
group by WORKER.name;









/* select SHEET.sheetID, SHEET.maint_time, DRAW.drawID, DRAW.date, DRAW.time
from SHEET, DRAW
where SHEET.sheetID = DRAW.sheetID and DRAW.date = '2021-10-06'; */

/* select sheetID, count(*)
from DRAW
group by sheetID; */