CREATE TABLE j_dbcp(
    name VARCHAR2(20),
    email VARCHAR2(30)
);

INSERT INTO j_dbcp VALUES('김대호', 'mrkim9427@naver.com');

COMMIT;

SELECT * FROM j_dbcp;

DESC j_dbcp;