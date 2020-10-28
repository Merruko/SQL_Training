-- employee 테이블 생성하기
CREATE TABLE employee (
    companyID     number(4) primary key,
    name            varchar2(20)
);

DESC employee;

SELECT *
FROM employee;

-- 사원 추가
INSERT INTO employee (companyID, name) values ('1001', 'Steve');

-- 가입일 칼럼 추가
ALTER TABLE employee ADD (joinDate DATE);
