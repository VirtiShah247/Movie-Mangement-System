desc movie;

insert into movie(movieid,name,dateofrelease,duration,about,theatre_id,showtiming_id,certification_id,language_id,genre_id,format_id) values (2,'RRR','19-07-22','3h 2m','RRR is a period drama set in India during the 1920s, revolving around the inspiring journey of two of India`s freedom fighters - Alluri Sitarama Raju and Komaram Bheem.',2,3,3,5,5,1);

insert into movie(movieid,name,dateofrelease,duration,about,theatre_id,showtiming_id,certification_id,language_id,genre_id,format_id) values (3,'Raksha Bandhan','11-08-22','1h 15m','Raksha Bandhan is a story that celebrates family values, togetherness, love, even sacrifice_but most importantly!',1,2,1,1,5,1);4
select * from genre;

insert into movie(movieid,name,dateofrelease,duration,about,theatre_id,showtiming_id,certification_id,language_id,genre_id,format_id) values (4,'Fakt Mahilao Maate','19-08-22','2h 17m','Surrounded and frustrated by all the women and their bickering, one day Chintan receives supernatural powers that enable him to listen to the inner voice of the women around him. ',3,4,3,2,2,1);
insert into movie(movieid,name,dateofrelease,duration,about,theatre_id,showtiming_id,certification_id,la
nguage_id,genre_id,format_id) values (5,'Dragon Ball Super','26-08-22','2h 3m','The Red Ribbon Army was once destroyed by Son Goku. Individuals, who carry on its spirit, have created the ultimate Androids, Gamma 1 and Gamma 2.',4,1,3,4,4,5);


desc seats;

select * from seats;

insert into moviebooking(moviebookingid,dateofbooking,datetowatch,movie_id,seats_id,customer_id) values(3,'','25-08-22',1,1,1);
desc moviebooking;
desc movie;
desc screen;
desc screen_seatcategory;
select * from theatre_showtiming;
desc moviebooking;
desc theatre;
desc movie;
SELECT e1.employee_id, e1.manager_id, e2.employee_id
   FROM employees e1, employees e2
   WHERE e1.manager_id(+) = e2.employee_id;
select * from showtiming;
select * from theatre;
select * from movie;
select * from screen;
   
select theatreid,m.movieid,st.showtimingid,t.theatre_name,t.theatre_address,m.movie_name,m.dateofrelease,m.duration,m.about,st.timings from theatre t,movie m,showtiming st where  m.showtiming_id=st.showtimingid and t.theatreid=m.theatre_id order by theatreid asc,movieid asc;
   
select theatreid,m.movieid,st.showtimingid,t.theatre_name,t.theatre_address,m.movie_name,m.dateofrelease,m.duration,m.about,st.timings from theatre t inner join movie m  ON t.theatreid=m.theatre_id inner join showtiming st ON m.showtiming_id=st.showtimingid order by theatreid asc,movieid asc;
create view v_theatre_movie_showtiming as select theatreid,m.movieid,st.showtimingid,t.theatre_name,t.theatre_address,m.movie_name,m.dateofrelease,m.duration,m.about,st.timings from theatre t inner join movie m  ON t.theatreid=m.theatre_id inner join showtiming st ON m.showtiming_id=st.showtimingid order by theatreid asc,movieid asc;
select * from v_theatre_movie_showtiming;
create view v_theatre_movies as select theatreid,m.movieid,t.theatre_name,t.theatre_address,m.movie_name,m.dateofrelease,m.duration,m.about from theatre t inner join movie m  ON t.theatreid=m.theatre_id order by theatreid asc;
create view v_movie_showtiming as select m.movieid,st.showtimingid,m.movie_name,m.dateofrelease,m.duration,m.about,st.timings from movie m inner join showtiming st ON m.showtiming_id=st.showtimingid order by movieid asc,showtimingid asc;
select * from v_movie_showtiming;
create view v_theatre_screen as select t.theatreid,s.screenid,t.theatre_name,t.theatre_address,s.screen_name from theatre t inner join screen s ON t.theatreid=s.theatre_id order by theatreid asc;
select * from v_theatre_screen;
SELECT * FROM CUSTOMER;

alter table movie drop column language_id;
alter table movie drop column theatre_id;
desc seatcategory;
select * from v_theatre_movie;
select * from v_theatre_movie_showtiming;
select * from movie;
select movieid,m.movie_name,m.dateofrelease,m.duration,m.about,c.certificationid,c.certification,ml.language_id,l.language 
   from movie m inner join certification c on m.certification_id=c.certificationid
   inner join language l on ml.language_id = l.languageid;
   inner join movie_language ml on m.movieid=ml.movie_id;
   
select movieid,m.movie_name,m.dateofrelease,m.duration,m.about,c.certificationid,c.certification,ml.language_id 
   from movie m,certification c,movie_language ml where m.certification_id=c.certificationid and m.movieid=ml.movie_id;
   
   select movieid,m.movie_name,m.dateofrelease,m.duration,m.about,c.certificationid,c.certification,ml.language_id,l.language 
   from language l inner join movie_language ml
   ON l.languageid = ml.language_id inner join movie m
   ON ml.movie_id = m.movieid inner join certification c on c.certificationid=m.certification_id ;

select * from seats;
select * from seatcategory;
create view v_seats_seatcategory as select seatsid,seatcategoryid,s.seatno,s.rowno,sc.seatcategory_name,sc.seatcategory_price,s.isbooked from seats s inner join seatcategory sc on s.seatcategory_id=sc.seatcategoryid;
   
select * from  theatre;
   select * from  screen;
   select * from seats;
   
   select screenid,screen_name from screen UNION ALL select seatsid,seatno,rowno,isbooked from seats;
   
   select * from theatre;
   select * from showtiming;
   select theatreid,st.showtimingid,t.theatre_name,t.theatre_address,st.timings from theatre t inner join showtiming st on t.theatreid=st.showtimingid;
   
   delete from moviebooking where moviebookingid=3;
   alter table moviebooking modify(total_amount int);