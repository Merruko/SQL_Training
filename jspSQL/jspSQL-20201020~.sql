-- 테이블 삭제
DROP TABLE t_employee;

-- 테이블 추가
CREATE TABLE t_member (
    memberId      number(4) PRIMARY KEY,
    passwd        VARCHAR2(20),
    name          VARCHAR2(20),
    gender        VARCHAR2(4),
    joinDate      DATE
);

-- 테이블 속성 보기
DESC t_member;

-- 데이터 추가
INSERT INTO t_member VALUES (9427, '0319', '김머호', '남', SYSDATE);

-- 테이블 조회
SELECT * FROM t_member;

-- 변경내역 반영
COMMIT;

-- 컬럼 추가
ALTER TABLE t_member ADD (joinDate DATE);
ALTER TABLE t_member ADD (gender VARCHAR2(4));

-- 컬럼 속성 변경
ALTER TABLE t_member MODIFY gender VARCHAR2(4);

-- 컬럼 삭제
ALTER TABLE t_member DROP COLUMN joinDate;

-- 내용 수정
UPDATE t_member
SET NAME = '김머호'
WHERE memberId = 9427;

-- 모든 자료 삭제
DELETE FROM t_member;