-- 테이블 삭제
DROP TABLE member;

-- 테이블 추가
CREATE TABLE t_employee (
    companyId     number(4) PRIMARY KEY,
    passwd        VARCHAR(20),
    name          VARCHAR2(20)
);

-- 테이블 속성 보기
DESC t_employee;

-- 데이터 추가
INSERT INTO t_employee VALUES (1001, 'abc123', '장그래');
INSERT INTO t_employee VALUES (1002, 'abc456', '안영이');

-- 테이블 조회
SELECT * FROM t_employee;

-- 변경내역 반영
COMMIT;

-- 가입일 컬럼 추가
ALTER TABLE t_employee ADD (joinDate DATE);

-- 내용 수정
UPDATE t_employee
SET NAME = '장그래'
WHERE COMPANYID = 1001;

-- 모든 자료 삭제
DELETE FROM t_employee;
