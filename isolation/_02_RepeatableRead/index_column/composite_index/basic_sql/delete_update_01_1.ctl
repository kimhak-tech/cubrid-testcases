/*
Test Case: delete & update
Priority: 2
Reference case: cc_basic/_02_RepeatableRead/index_column/composite_index/basic_sql/delete_update_01.ctl
Isolation Level: Repeatable Read
Author: Ray

Test Plan: 
Test concurrent DELETE/UPDATE transactions in MVCC (with composite index schema)

Test Scenario:
C1 delete, C2 update, the affected rows are not overlapped (based on where clause)
C1, C2 where clause are on composite index (i.e. index scan)
C2 contains a read query before update
C1 commit, C2 commit
Metrics: schema = single table, index = composite index, data size = small, where clause = simple

Test Point:
1) C1 and C2 will not be waiting (Locking Test)
2) C1 and C2 can only see the its own delete/update but not other transactions changes (Visibility Test) 
3) C1 instances should be deleted, C2 instances should be updated

NUM_CLIENTS = 3
C1: delete from table t1;
C2: update table t1;  
C3: select on table t1; C3 is used to check the updated result
*/

MC: setup NUM_CLIENTS = 3;

C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level repeatable read;

C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level repeatable read;

C3: set transaction lock timeout INFINITE;
C3: set transaction isolation level repeatable read;

/* preparation */
C1: DROP TABLE IF EXISTS t1;
C1: CREATE TABLE t1(id INT, col VARCHAR(10), tag VARCHAR(2));
C1: CREATE INDEX idx_col_id on t1(col,id);
C1: INSERT INTO t1 VALUES(1,'abc','A');INSERT INTO t1 VALUES(2,'def','B');INSERT INTO t1 VALUES(3,'ghi','C');INSERT INTO t1 VALUES(4,'jkl','D');INSERT INTO t1 VALUES(5,'mno','E');INSERT INTO t1 VALUES(6,'pqr','F');INSERT INTO t1 VALUES(7,'abc','G');
C1: COMMIT WORK;
MC: wait until C1 ready;

/* test case */
C1: DELETE FROM t1 WHERE col = 'jkl' OR col = 'pqr' AND id < 6;
MC: wait until C1 ready;

/* expect: C2 select - all the data are selected */
C2: SELECT * FROM t1 order by 1,2,3;
MC: wait until C2 ready;

C2: UPDATE t1 set col = 'abcd' WHERE col = 'abc';
/* expect: no transactions need to wait */
MC: wait until C2 ready;

/* expect: C1 select - id = 4 is deleted */
C1: SELECT * FROM t1 ORDER BY 1,2,3;
C1: commit;
MC: wait until C1 ready;

/* expect: C2 select - id = 1,7 are updated, but id = 4 is still visible */
C2: SELECT * FROM t1 ORDER BY 1,2,3;
C2: commit;
MC: wait until C2 ready;

/* expect: the instances of id = 4 is deleted, id = 1,7 are updated */
C3: select * from t1 ORDER BY 1,2,3;
C3: commit;
MC: wait until C3 ready;

C1: quit;
C2: quit;
C3: quit;
