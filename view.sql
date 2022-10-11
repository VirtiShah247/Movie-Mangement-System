create view v_movie as select DISTINCT movieid,m.movie_name,m.dateofrelease,m.duration,m.about,c.certificationid,c.certification,ml.language_id,l.language,mg.genre_id,g.genre,mf.format_id,f.format 
   from movie m inner join certification c on c.certificationid=m.certification_id
   inner join movie_language ml on ml.movie_id = m.movieid 
   inner join language l on l.languageid = ml.language_id
   inner join movie_genre mg on mg.movie_id=m.movieid
   inner join genre g on g.genreid=mg.genre_id
   inner join movie_format mf on mf.movie_id=m.movieid
   inner join format f on f.formatid=mf.format_id
   order by movieid ASC,language_id ASC,genre_id ASC,format_id ASC;
   
   
   select * from theatre;
   select * from screen;
   select * from seats;
   
   create view v_theatre_screen_seats as select theatreid,theatre_name,theatre_address,screenid,screen_name,ss.seatsid,ss.seatno,ss.rowno,ss.isbooked
   from theatre t inner join screen s on t.theatreid=s.theatre_id
   inner join screen_seatcategory ssc on ssc.screen_id=s.screenid
   inner join seats ss on ss.seatcategory_id=ssc.seatcategory_id
   order by theatreid ASC,screenid ASC; 
   
   select * from theatre;
   select * from showtiming;
   
   create view v_theatre_showtiming as select t.theatreid,t.theatre_name,t.theatre_address,st.showtimingid,st.timings
   from theatre t inner join theatre_showtiming tst on t.theatreid=tst.theatre_id
   inner join showtiming st on st.showtimingid=tst.showtiming_id
   order by theatreid ASC,showtimingid ASC;
   
   select * from theatre;
   select * from movie;
   
create view v_theatre_movie as select t.theatreid,t.theatre_name,t.theatre_address,m.movieid,m.movie_name,m.dateofrelease,m.duration,m.about
   from theatre t inner join theatre_movie tm on t.theatreid=tm.theatre_id
   inner join movie m on m.movieid=tm.movie_id
   order by theatreid ASC,movieid ASC;
   
   select * from theatre;
   select * from movie;
   select * from showtiming;
   
   create view v_theatre_movie_showtiming as select t.theatreid,t.theatre_name,t.theatre_address,m.movieid,m.movie_name,m.dateofrelease,m.duration,m.about,st.showtimingid,st.timings
   from theatre t inner join theatre_movie tm on t.theatreid=tm.theatre_id
   inner join movie m on m.movieid=tm.movie_id
   inner join showtiming st on st.showtimingid=m.showtiming_id
   order by theatreid ASC,movieid ASC;
   
   
   select * from v_movie;
   select * from theatre;
   select * from seats;
   select theatreid,t.theatre_name,t.theatre_address,s.screenid,s.screen_name,m.movieid,m,movie_name,m.dateofrelease,m.duration,.m.about,m.showtiming_id
   
 