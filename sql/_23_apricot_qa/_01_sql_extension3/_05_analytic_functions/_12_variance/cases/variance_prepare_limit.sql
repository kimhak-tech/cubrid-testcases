--combination with limit clause and prepare statement


create table variance_limit(
	col1 smallint auto_increment primary key,
	col2 bigint not null,
	col3 varchar default 'abc',
	col4 timestamp default CURRENT_TIMESTAMP,
	col5 bit(20)
);


insert into variance_limit(col2, col3, col4, col5) values(500, 'cubrid', '1990-10-10', B'0001');
insert into variance_limit(col2, col3, col4, col5) values(500, 'cubrid', '1990-11-10', B'0010');
insert into variance_limit(col2, col3, col4, col5) values(500, 'mysql', '1990-10-11', B'0100');
insert into variance_limit(col2, col3, col4, col5) values(500, 'cubrid', '1990-10-10', B'1000');
insert into variance_limit(col2, col3, col4, col5) values(500, 'cubrid', '1991-10-10', B'0011');
insert into variance_limit(col2, col3, col4, col5) values(501, 'oracle', '1990-10-10', B'0101');
insert into variance_limit(col2, col3, col4, col5) values(501, 'cubrid', '1992-10-10', B'1001');
insert into variance_limit(col2, col3, col4, col5) values(501, 'oracle', '1990-11-10', B'0110');
insert into variance_limit(col2, col3, col4, col5) values(501, 'mysql', '1990-10-10', B'1010');
insert into variance_limit(col2, col3, col4, col5) values(501, 'cubrid', '1990-10-10', B'1100');
insert into variance_limit(col2, col3, col4, col5) values(501, 'mysql', '1991-11-10', B'0111');
insert into variance_limit(col2, col3, col4, col5) values(502, 'cubrid', '1990-10-10', B'1110');
insert into variance_limit(col2, col3, col4, col5) values(502, 'mysql', '1990-10-10', B'1111');
insert into variance_limit(col2, col3, col4, col5) values(502, 'mysql', '1992-10-10', B'1010');
insert into variance_limit(col2, col3, col4, col5) values(503, 'mysql', '1992-10-10', B'0101');
insert into variance_limit(col2, col3, col4, col5) values(503, 'cubrid', '1990-10-10', B'1110');
insert into variance_limit(col2, col3, col4, col5) values(503, 'cubrid', '1990-10-10', B'0111');
insert into variance_limit(col2, col3, col4, col5) values(503, 'oracle', '1993-11-10', B'1101');
insert into variance_limit(col2, col3, col4, col5) values(503, 'oracle', '1993-10-10', B'0011');
insert into variance_limit(col2, col3, col4, col5) values(503, 'cubrid', '1993-11-10', B'0001');
insert into variance_limit(col2, col3, col4, col5) values(503, 'cubrid', '1992-10-10', B'1100');
insert into variance_limit(col2, col3, col4, col5) values(504, 'mysql', '1994-10-10', B'1011');
insert into variance_limit(col2, col3, col4, col5) values(504, 'mysql', '1990-10-10', null);
insert into variance_limit(col2, col3, col4, col5) values(504, 'cubrid', '1995-11-10', B'0110');
insert into variance_limit(col2, col3, col4, col5) values(505, 'cubrid', '1991-10-10', '');
insert into variance_limit(col2, col3, col4, col5) values(505, 'cubrid', '1996-10-10', B'1111');
insert into variance_limit(col2, col3, col4, col5) values(505, 'mysql', '1990-10-10', B'0100');
insert into variance_limit(col2, col3, col4, col5) values(505, 'cubrid', '1995-10-10', null);
insert into variance_limit(col2, col3, col4, col5) values(505, 'cubrid', '1990-10-10', B'1111');




--TEST: over() clause + order by
select *, variance(col1) over() variance from variance_limit order by 1, 2, 3, 4, 5, 6limit 20;
select *, variance(col2) over() variance from variance_limit order by 6, col1 limit 10;
select col1, col2, col3, col4, variance(col2) over() variance from variance_limit order by 1, col2, col3, 4, 5 limit 1;


--TEST: over(partition by) clause + order by
select *, variance(unique col1) over(partition by col3) from variance_limit order by col2, col1 limit -1;
select *, variance(all col2) over(partition by col4) variance from variance_limit order by 1, 2, 3, 4, 5, 6 limit 100;
select col3, col4, variance(distinct col1) over(partition by col4) variance from variance_limit order by 1, 2, 3 limit 2;
select col3, col4, variance(distinctrow col2) over(partition by col3) from variance_limit order by 1, 2, 3 limit 3;


--TEST: over(order by) clause + order by
select col1, col2, col3, variance(col1) over(order by col1) variance from variance_limit order by 1, 2, 3, 4 limit 10;
select col2, variance(col2) over(order by col2) variance, col3 from variance_limit order by 1, 2, 3 limit 15;
select *, variance(col2) over(order by col3 asc, col5 desc) from variance_limit order by col5 asc, col3 desc limit -100;
select *, variance(all col1) over(order by col1, col2, col3 desc, col4, col5), col3 from variance_limit order by 6, 5 desc, 4, 3, 2, 1 limit 30;
select col1, col2, variance(col1) over(order by col2) from variance_limit order by 1, 2, 3 limit 20;


--TEST: over(partition by.. order by ..) clause + order by
prepare st from 'select *, variance(unique col2) over(partition by col3 order by col1) from variance_limit order by 1, 2, 3, 4, 5, 6 limit ?';
execute st using 10;
deallocate prepare st;
prepare st from 'select *, variance(col1) over(partition by col4 order by col4, col1 desc) variance from variance_limit order by 1, 2, 3, 4, 5, 6 limit ?';
execute st using 20;
deallocate prepare st;
prepare st from 'select col1, col3, col4, variance(distinct col2) over(partition by col4 order by col3, col2, col1 desc) variance from variance_limit order by 1, 2, 3, 4 limit ?';
execute st using 1;
deallocate prepare st;
prepare st from 'select col3, col4, col2, variance(all col1) over(partition by col3 order by col4) from variance_limit order by 1, 2, 3, 4 limit ?';
execute st using 5;
deallocate prepare st;
prepare st from 'select col3, col4, col5, variance(distinctrow col2) over(partition by col4 order by col3, col2) variance_limit order by 1, 2, 4 desc, 3 asc limit ?';
execute st using -1;
deallocate prepare st;


--TEST: over(partition by.. order by ..) clause + order by ... having ...
prepare st from 'select col1, col2, variance(col1) over(partition by col1 order by col2) from variance_limit group by col1 having col1 > 500 order by col2 desc, col1 limit ?';
execute st using 1;
deallocate prepare st;
prepare st from 'select col5, col2, col4, variance(all col2) over(partition by col4 order by col4, col2, col5) from variance_limit group by col4 having right(clob_to_char(col5), 4) =  '.com' order by 4, 3 desc, 2 asc, 1 limit ?';
execute st using 15;
deallocate prepare st;
prepare st from 'select col1, col2, col3, col4, col5, variance(col1) over(partition by col3 order by col2 desc, col4, col5) from variance_limit group by col1, col2, col3, col4 having col2 in ('cubrid', 'mysql') and right(clob_to_char(col5), 12) = '@domainname.com' order by col3 desc, col2 asc, 6, 1 limit ?';
execute st using 30;

deallocate prepare st;
 



drop table variance_limit;


