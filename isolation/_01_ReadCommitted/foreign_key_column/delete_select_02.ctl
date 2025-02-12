/*
Test Case: delete & select
Priority: 2
Reference case: cc_basic/_01_ReadCommitted/foreign_key_column/delete_select_01.ctl
Author: Lily

Test Point:
B reference A, when there is overlap, test the behavior
there is committed

NUM_CLIENTS = 2
C1: delete from referenced table; 
C2: select from reference table;
C1: commit;
C2: commit;

*/
MC: setup NUM_CLIENTS = 2;
C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level read committed;
C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level read committed;

/* preparation */
C1: DROP TABLE IF EXISTS t_foreign;
C1: DROP TABLE IF EXISTS t_primary;
C1: CREATE TABLE t_primary(id INT PRIMARY KEY,col VARCHAR(10));
C1: CREATE TABLE t_foreign(id INT,col VARCHAR(10),FOREIGN KEY(id) REFERENCES t_primary(id) ON DELETE CASCADE);
C1: INSERT INTO t_primary VALUES(1,'a'),(2,'b');
C1: INSERT INTO t_foreign VALUES(1,'test'),(2,'dev');
C1: commit work;
MC: wait until C1 ready;

/* test case */
C1: DELETE FROM t_primary WHERE id=1;
MC: wait until C1 ready;

C2: SELECT * FROM t_foreign WHERE id=1 order by 1,2;
C2: DELETE FROM t_primary WHERE id=2;
MC: wait until C2 ready;

C1: SELECT * FROM t_foreign order by 1,2;
MC: wait until C1 ready;

C2: SELECT * FROM t_foreign order by 1,2;
MC: wait until C2 ready;

C1: commit;
MC: wait until C1 ready;

C2: SELECT * FROM t_foreign order by 1,2;
C2: commit;
MC: wait until C2 ready;

C1: SELECT * FROM t_foreign ORDER BY 1,2;
MC: wait until C1 ready;

C2: SELECT * FROM t_foreign ORDER BY 1,2;
MC: wait until C2 ready;

C2: quit;
C1: quit;

