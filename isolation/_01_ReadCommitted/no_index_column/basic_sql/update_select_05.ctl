/*
Test Case: update & select 
Priority: 1
Reference case:
Author: Mandy

Test Point:
Test the visibility before commit and after commit
1. Reading queries can only have a look at data committed before the queries began
2. Uncommitted data are never seen
In this test, update results affect the where key in the select

NUM_CLIENTS = 2 
C1: update and select on table t1
C2: select on table t1 before C1 commit
*/


MC: setup NUM_CLIENTS = 2;

C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level read committed;

C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level read committed;

/* preparation */
C1: drop table if exists t1;
C1: create table t1(id int, col varchar(10));
C1: insert into t1 values(1,'abc'),(2,'def'),(3,'abc'),(1,'gh'),(1,'abc'),(4,'def'),(5,'ijk');
C1: commit;
MC: wait until C1 ready;

/* test case */
C1: update t1 set id=2 where id=1;
MC: wait until C1 ready;
C2: select * from t1 where id=1 order by col;
C2: select * from t1 where id=2 order by col;
MC: wait until C1 ready;
C1: rollback;
C2: select * from t1 where id=1 order by col;
C2: select * from t1 where id=2 order by col;
C2: rollback;
MC: wait until C1 ready;
MC: wait until C2 ready;

C1: update t1 set id=4 where id<4;
MC: wait until C1 ready;
C1: select * from t1 where id>1 order by col;
MC: wait until C1 ready;
C1: commit;
C1: select * from t1 where id>1 order by col;
C2: commit;
MC: wait until C1 ready;
MC: wait until C2 ready;


C1: quit;
C2: quit;
