autocommit off;
call login ('joe', '') on class db_user;
revoke all on shipment_v from public;
revoke all on shipment_c from public;
revoke all on product_c from public;
grant all privileges on shipment_c, shipment_v to user1, user2;
call login ('user1', '') on class db_user;
revoke update on joe.shipment_v from user2;
call login ('dba', '') on class db_user;
rollback;
