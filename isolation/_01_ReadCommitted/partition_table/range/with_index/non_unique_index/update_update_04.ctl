/*
Test Case: update & update
Priority: 1
Reference case:
Author: Mandy

Test Point:
C1 update, C2 update, the affected rows are not overlapped.
In this case, the first transaction's update result will affect the second transaction's search key value. In this case, the tran
sation is not blocked. Check the second update is executed correctly.

NUM_CLIENTS = 3
C1: update on table t1  
C2: update on table t1  
C3: select on table t1; C3 is used to check the update result
*/


MC: setup NUM_CLIENTS = 3;

C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level read committed;

C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level read committed;

C3: set transaction lock timeout INFINITE;
C3: set transaction isolation level read committed;

/* preparation */
C1: drop table if exists t1;
C1: create table t1(id int, col varchar(10)) partition by range (id) (partition p1 values less than (10), partition p2 values less than (20));
C1: insert into t1 values(1,'abc'),(8,'def'),(9,'abc'),(10,'gh'),(15,'def');
C1: create index idx on t1(id);
C1: commit work;
MC: wait until C1 ready;

/* C1 update, C2 update*/
C1: update t1 set id=12 where id<8;
MC: wait until C1 ready;
C2: update t1 set id=id-1 where id>8;
MC: wait until C2 ready;
C1: select * from t1 where id>0 order by 1,2;
MC: wait until C1 ready;
C2: select * from t1 where id>0 order by 1,2;
MC: wait until C2 ready;
C1: commit;
C2: commit;
MC: wait until C1 ready;
MC: wait until C2 ready;
C3: select * from t1 where id>0 order by 1,2;

C1: quit;
C2: quit;
C3: quit;
