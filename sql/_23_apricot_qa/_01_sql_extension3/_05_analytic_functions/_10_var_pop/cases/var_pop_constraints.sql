--TEST: test with columns with constraints 


create table var_pop_constraints(
	col1 int not null,
	col2 short auto_increment, 
	col3 bigint default 10000000,
	col4 numeric(10, 5) not null,
	col5 float unique,
	col6 double primary key,
	col7 monetary shared 500
);


insert into var_pop_constraints values(10000, 100, 10000000, 12345.06789, 111.11, 11111.130, 1000);
insert into var_pop_constraints values(10000, 200, 20000000, 12345.06789, 111.12, 11111.129, 1000);
insert into var_pop_constraints values(10000, 100, 30000000, 12345.16789, 111.13, 11111.128, 1000);
insert into var_pop_constraints values(10000, 200, 40000000, 12345.06789, 111.14, 11111.127, 1000);
insert into var_pop_constraints values(10000, 100, 50000000, 12345.16789, 111.15, 11111.126, null);
insert into var_pop_constraints values(20000, 200, 70000000, 12345.06789, 111.16, 11111.125, 1000);
insert into var_pop_constraints values(20000, 100, 80000000, 12345.06789, 111.17, 11111.124, 1000);
insert into var_pop_constraints values(20000, 100, 10000000, 12345.26789, 111.18, 11111.123, 1000);
insert into var_pop_constraints values(20000, 300, 20000000, 12345.06789, 111.19, 11111.122, 2000);
insert into var_pop_constraints values(30000, 100, 30000000, 12345.06789, 111.20, 11111.121, 1000);
insert into var_pop_constraints values(30000, 100, 40000000, 12345.16789, 111.21, 11111.120, 1000);
insert into var_pop_constraints values(30000, 300, 50000000, 12345.06789, 111.23, 11111.119, 1000);
insert into var_pop_constraints values(40000, 100, 10000000, 12345.06789, 111.24, 11111.118, 3000);
insert into var_pop_constraints values(50000, 100, 20000000, 12345.06789, 111.25, 11111.117, 1000);
insert into var_pop_constraints values(50000, 200, 30000000, 12345.06789, 111.26, 11111.116, 4000);
insert into var_pop_constraints values(50000, 100, 40000000, 12345.56789, 111.27, 11111.115, 1000);
insert into var_pop_constraints values(50000, 100, 50000000, 12345.06789, 111.28, 11111.114, 1000);
insert into var_pop_constraints values(50000, 300, 60000000, 12345.56789, 111.29, 11111.113, 5000);
insert into var_pop_constraints values(50000, 100, 70000000, 12345.06789, 111.30, 11111.112, 1000);
insert into var_pop_constraints values(50000, 100, 80000000, 12345.56789, 111.31, 11111.111, 8000);


--TEST: OVER() clause
--TEST: int 
select trunc(var_pop, 2) from (select col1, col2, var_pop(distinctrow col1) over() var_pop from var_pop_constraints) order by 1;
--TEST: short, with alias
select trunc(var_pop, 2) from (select col2, col3, var_pop(col2) over() var_pop from var_pop_constraints) order by 1;
--TEST: bigint, with where clause
select trunc(var_pop, 2) from (select col3, col4, var_pop(unique col3) over() var_pop from var_pop_constraints where col1 > 10000) order by 1;
--TEST: numeric, distinct
select trunc(var_pop, 2) from (select col4, col5, var_pop(distinct col4) over() var_pop from var_pop_constraints) order by 1;
--TEST: float, all
select trunc(var_pop, 2) from (select col5, col6, col7, var_pop(all col5) over() var_pop from var_pop_constraints) order by 1;
--TEST: double, all
select trunc(var_pop, 2) from (select col6, col1, col2, col5, var_pop(all col6) over() var_pop from var_pop_constraints where length(col3)=8 and round(col5)=111) order by 1;
--TEST: monetary, distinct
select trunc(var_pop, 2) from (select col7, col3, col5, var_pop(distinct col7) over() var_pop from var_pop_constraints) order by 1;
--TEST: no matched rows
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(unique col7) over() var_pop from var_pop_constraints where trunc(col6)=111) order by 1;
--TEST: syntax error
select trunc(var_pop, 2) from (select *, var_pop(col1) over() var_pop from var_pop_constraints);
select col1, col3, col5, var_pop(col2) over var_pop from var_pop_constraints;
select col1, col3, col5, var_pop(col3) over(1) var_pop from var_pop_constraints;



--TEST: OVER(PARTITION BY) clause
--TEST: partition by int
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(col2) over(partition by col1) var_pop from var_pop_constraints) order by 1;
--TEST: partition by smallint
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(distinctrow col4) over(partition by col2) var_pop from var_pop_constraints) order by 1;
--TEST: partition by bigint
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(unique col6) over(partition by col3) var_pop from var_pop_constraints) order by 1;
--TEST: partition by numeric
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(all col2) over(partition by col4) var_pop from var_pop_constraints) order by 1;
--TEST: partition by float
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(col3) over(partition by col5) var_pop from var_pop_constraints) order by 1;
--TEST: partition by double
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(all col4) over(partition by col6) var_pop from var_pop_constraints) order by 1;
--TEST: partition by monetary
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(distinct col7) over(partition by col7) var_pop from var_pop_constraints) order by 1;



--TEST: OVER(ORDER BY) clause
--TEST: order by 1 column name
select trunc(var_pop, 2) from (select col1, var_pop(col2) over(order by col1) var_pop from var_pop_constraints) order by 1;
--TEST: order by 2 column names
select trunc(var_pop, 2) from (select col2, col3, var_pop(all col4) over(order by col2, col3 asc) var_pop from var_pop_constraints) order by 1;
--TEST: order by more than 2 column names
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(unique col3) over(order by col1, col2 desc, col3, col4 asc, col5, col6 desc) var_pop from var_pop_constraints) order by 1;
--TEST: order by columns not select trunc(var_pop, 2) from (selected
select trunc(var_pop, 2) from (select col3, var_pop(distinct col2) over(order by col4, col6 desc, col2, col1 asc) var_pop from var_pop_constraints) order by 1;
--TEST: order by 1 position
select trunc(var_pop, 2) from (select col5, var_pop(all col2) over(order by 1) var_pop from var_pop_constraints) order by 1;
--TEST: order by 3 positions
select trunc(var_pop, 2) from (select col3, col5, var_pop(col1) over(order by 1, 2 desc, 3 asc) var_pop from var_pop_constraints) order by 1;
--TEST: order by more than 3 positions
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(col2) over(order by 5, 3, 7, 2 asc, 1 desc, 6 desc, 4) var_pop from var_pop_constraints) order by 1;
--TEST: order by positions not existed
select trunc(var_pop, 2) from (select col5, var_pop(distinct col1) over(order by 2) var_pop from var_pop_constraints) order by 1;
select trunc(var_pop, 2) from (select col1, var_pop(all col3) over(order by 3, 4, 1 desc) var_pop, col5, col7 from var_pop_constraints) order by 1;
select trunc(var_pop, 2) from (select col3, col5, var_pop(col5) over(order by 5) var_pop from var_pop_constraints) order by 1;
select trunc(var_pop, 2) from (select col3, col5, var_pop(col7) over(order by 100) var_pop from var_pop_constraints) order by 1;
--TEST: order by column names and positions
select trunc(var_pop, 2) from (select col1, col2, col3, col4, col5, col6, col7, var_pop(col3) over(order by 1, col2 desc, 3, col4 asc, 5, col6 desc, 7) var_pop from var_pop_constraints) order by 1;




--TEST: OVER(PARTITION BY ORDER BY) clause
--TEST: partition by int
select trunc(var_pop, 2) from (select col1, col2, col3, var_pop(distinct col4) over(partition by col1 order by 1, 2, 3) var_pop from var_pop_constraints) order by 1;
--TEST: partition by smallint
select trunc(var_pop, 2) from (select col2, col4, col5, var_pop(col5) over(partition by col2 order by col2, col4, col5 desc) var_pop from var_pop_constraints) order by 1;
--TEST: partition by bigint
select trunc(var_pop, 2) from (select col3, var_pop(all col7) over(partition by col3 order by 1, 3) var_pop, col5 from var_pop_constraints) order by 1;
--TEST: partition by numeric
select trunc(var_pop, 2) from (select col4, col1, var_pop(unique col6) over(partition by col4 order by 1, 2 desc) var_pop from var_pop_constraints) order by 1;
--TEST: partition by float
select trunc(var_pop, 2) from (select col5, col6, var_pop(distinct col2) over(partition by col5 order by col5 desc, col6 asc) var_pop from var_pop_constraints) order by 1;
--TEST: partition by double
select trunc(var_pop, 2) from (select col6, col1, col2, col3, var_pop(all col7) over(partition by col6 order by 5,4,3 desc,2,1) var_pop from var_pop_constraints) order by 1;
--TEST: partition by monetary
select trunc(var_pop, 2) from (select col7, col1, col2, col3, col4, col5, col6, col7, var_pop(col4) over(partition by col7 order by 1 desc, col1, col2, col3 asc, 5, 6, col7 desc) var_pop from var_pop_constraints) order by 1;
--TEST: syntax error
select trunc(var_pop, 2) from (select col1, col2, var_pop(distinct col3) over(order by col1, col2 partition by col2) var_pop from var_pop_constraints;



drop table var_pop_constraints; 















