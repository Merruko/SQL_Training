CREATE TABLE i_member( 
mNum NUMBER(20) NOT NULL, -- 회원 고유번호(시퀀스자리)
mId VARCHAR(20) NOT NULL PRIMARY KEY, -- 회원 아이디
mPwd VARCHAR(20), -- 회원 비밀번호
mName VARCHAR(15), -- 회원 이름 
mGender VARCHAR(10), -- 회원 성별 
mBirth VARCHAR(15), -- 회원 생년월일 
mEmail VARCHAR(30), -- 회원 이메일 
mPhone VARCHAR(20) -- 회원 전화번호 
);

//21.01.29금 수정 (로그인 권한 및 보안 기능 구현을 위해)
//주의! 기존 테이블에 해당 칼럼의 NULL 값이 있을 경우 오류가 있을 수 있음, 테이블 데이터 삭제바람.
ALTER TABLE i_member ADD(authority VARCHAR(50));
ALTER TABLE i_member MODIFY(authority NOT NULL);
ALTER TABLE i_member MODIFY(authority DEFAULT 'ROLE_USER');
ALTER TABLE i_member ADD(enabled NUMBER(5));
ALTER TABLE i_member MODIFY(enabled NOT NULL);
ALTER TABLE i_member MODIFY(enabled DEFAULT '1');


//관리자를 추가해주세요
INSERT INTO i_member (mNum, mId, mPwd, mName, mGender, mBirth, mEmail, mPhone, AUTHORITY, ENABLED)
VALUES ('210101001', 'admin', '12345', '관리자', '남성', '000000', 'admin@test.com', '01012341234', 'ROLE_ADMIN', 1);


SELECT * FROM I_MEMBER;

CREATE SEQUENCE SEQ_MEM
START WITH 1
MAXVALUE 999
MINVALUE 1
CYCLE
CACHE 10
NOORDER
;

CREATE OR REPLACE PROCEDURE SZP_MEM_RESET(SEQ_NAME IN VARCHAR2)
IS
    L_VAL NUMBER;
BEGIN
 
    EXECUTE IMMEDIATE 'SELECT '|| SEQ_NAME ||'.NEXTVAL FROM DUAL' INTO L_VAL;
    
    EXECUTE IMMEDIATE 'ALTER SEQUENCE '|| SEQ_NAME ||' INCREMENT BY -'|| L_VAL ||' MINVALUE 0';
    
    EXECUTE IMMEDIATE 'SELECT '|| SEQ_NAME ||'.NEXTVAL FROM DUAL' INTO L_VAL;
    
    EXECUTE IMMEDIATE 'ALTER SEQUENCE '|| SEQ_NAME ||' INCREMENT BY 1 MINVALUE 0';
 
END;

CREATE OR REPLACE FUNCTION ZBF_GET_MEM(
    p_type in varchar2
) RETURN VARCHAR2
AS
     v_returnValue VARCHAR2(180);
BEGIN
 
    BEGIN
 
        select TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(SEQ_MEM.nextval, 3, 0)
          into v_returnValue
          from dual;
 
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_returnValue := ' ';
      WHEN OTHERS THEN
        v_returnValue := ' ';
    END;
 
    RETURN v_returnValue;
END;


//위의 쿼리 실행완료 후 아래 쿼리 실행 정상작동확인바람
SELECT ZBF_GET_MEM('now') from DUAL;