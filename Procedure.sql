--admin procedure
create or replace procedure admin_procedure(adminid IN admin.adminid%TYPE,admin_username IN admin.admin_username%TYPE,admin_password IN admin.admin_password%TYPE,admin_contactno IN admin.admin_contactno%TYPE)
as
begin
    insert into admin values(adminid,admin_username,admin_password,admin_contactno);
end;
/

declare
    adminid number:=&adminid;
    admin_username varchar2(25):=&admin_username;
    admin_password varchar2(40):=&admin_password;
    admin_contactno number(10,0):=&admin_contactno;
begin
    admin_procedure(adminid,admin_username,admin_password,admin_contactno);
end;
/
--customer procedure
create or replace procedure customer_procedure(customerid IN customer.customerid%type,customer_username IN customer.customer_username%type,customer_password IN customer.customer_password%type,customer_contactno IN customer.customer_contactno%type)
as
begin
    insert into customer values(customerid,customer_username,customer_password,customer_contactno);
end;
/

declare
    customerid number:=&customerid;
    customer_username varchar2(25):=&customer_username;
    customer_password varchar2(40):=&customer_password;
    customer_contactno number(10,0):=&customer_contactno;
begin
    customer_procedure(customerid,customer_username,customer_password,customer_contactno);
end;
/

--add movie procedure
create or replace procedure add_movie_procedure(movieid IN movie.movieid%type,movie_name IN movie.movie_name%type,dateofrelease IN movie.dateofrelease%type,duration IN movie.duration%type,about IN movie.about%type,showtiming_id IN movie.showtiming_id%type,certification_id IN movie.certification_id%type)
as
status:=1;
begin
    insert into movie values(movieid,movie_name,dateofrelease,duration,about,showtiming_id,certification_id,status);
end;
/

declare 
movieid number:=&movieid;
movie_name varchar2(25):=&movie_name;
dateofrelease date:=&dateofrelease;
duration varchar2(10):=&duration;
about varchar2(200):=&about;
showtiming_id number:=&showtiming_id;
certification_id number:=&certification_id;
status number:=&status;
begin
    add_movie_procedure(movieid,movie_name,dateofrelease,duration,about,showtiming_id,certification_id,status);
    exception WHEN too_many_rows THEN
    dbms_output.put_line('Errors fetching are more than one');
end;
/

--update movie procedure
create or replace procedure movie_procedure(m_name IN movie.movie_name%type,m_dateofrelease IN movie.dateofrelease%type,m_duration IN movie.duration%type,m_about IN movie.about%type,m_showtiming_id IN movie.showtiming_id%type,m_certification_id IN movie.certification_id%type)
as
u_count int:=0;
begin
select count(*) into u_count from movie where movie_name=m_name and status=1;
if u_count!=0 then
update movie set dateofrelease=m_dateofrelease,duration=m_duration,about=m_about ,showtiming_id=m_showtiming_id,certification_id=m_certification_id where movie_name=m_name and status=1;
dbms_output.put_line('Movie update successfully');
else
dbms_output.put_line('Movie not found');
end if;
end;
/

declare 
movie_name varchar2(25):=&movie_name;
dateofrelease date:=&dateofrelease;
duration varchar2(10):=&duration;
about varchar2(200):=&about;
showtiming_id number:=&showtiming_id;
certification_id number:=&certification_id;
begin
    movie_procedure(movie_name,dateofrelease,duration,about,showtiming_id,certification_id);
end;
/

--search movie procedure
create or replace procedure search_movie_proc
(m_name IN movie.movie_name%type)
is
name varchar2(25);
begin
select movie_name into name from movie where movie_name=m_name and status=1;
if name=m_name then
dbms_output.put_line('Found movie');
else
dbms_output.put_line('Not Found movie');
end if;
end;
/

declare
name varchar2(25):=&name;
begin
    search_movie_proc(name);
end;
/

--delete movie procedure
create or replace procedure delete_movie_proc(movie_id in movie.movieid%type)
as
d_count int:=0;
begin
select count(*) into d_count from movie where movieid=movie_id;
if d_count!=0 then
update movie set status=0 where movieid=movie_id;
dbms_output.put_line('Movie deleted successfully');
else
dbms_output.put_line('Movie not found');
end if;
end;
/

declare
	movie_id int:=&movie_id;
begin
	delete_movie_proc(movie_id);
end;
/

--add moviebooking
create or replace procedure add_moviebooking
(moviebookingid IN moviebooking.moviebookingid%type,
dateofbooking IN moviebooking.dateofbooking%type,
datetowatch IN moviebooking.datetowatch%type,
movie_id IN moviebooking.movie_id%type,
seatcategory_id IN moviebooking.seatcategory_id%type,
customer_id IN moviebooking.customer_id%type,
formatid IN moviebooking.formatid%type,
languageid IN moviebooking.languageid%type,
screenid IN moviebooking.screenid%type,
showtimingid IN moviebooking.showtimingid%type,
theatreid IN moviebooking.theatreid%type,
quantity IN int)
IS
m_total_amount int:=0;
m_total_ticket int:=quantity;
CURSOR booking_cur IS
	select 	seatcategory_price from v_seats_seatcategory where seatcategoryid=seatcategory_id;
m_price int;
begin
OPEN booking_cur;
LOOP
FETCH booking_cur INTO m_price;
EXIT when booking_cur%NOTFOUND;
m_total_amount:=(m_price * quantity) ;
END LOOP;
insert into moviebooking values(moviebookingid,dateofbooking,datetowatch,movie_id,seatcategory_id,customer_id,m_total_amount,m_total_ticket,formatid,languageid,screenid,showtimingid,theatreid);
CLOSE booking_cur;
END;	
/

declare 
moviebookingid int:=&moviebookingid;
dateofbooking date:=&dateofbooking;
datetowatch date:=&datetowatch;
movie_id int:=&movie_id;
seatcategory_id int:=&seatcategory_id;
customer_id int:=&customer_id;
formatid int:=&formatid;
languageid int:=&languageid;
screenid int:=&screenid;
showtimingid int:=&showtimingid;
theatreid int:=&theatreid;
quantity int:=&quantity;
begin
    add_moviebooking(moviebookingid,dateofbooking,datetowatch,movie_id,seatcategory_id,customer_id,formatid,languageid,screenid,showtimingid,theatreid,quantity);
end;
/
