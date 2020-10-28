-- [퀴즈05]

-- [1] 이메일(예 tester@naver.com) 에서 아이디 추출
-- substr()와 instr()를 이용
select
    substr('tester@naver.com', 1, instr('tester@naver.com', '@', 1, 1)-1)
from dual;

select instr('tester@naver.com', '@', 1, 1)   -- 7
from dual;

-- [2] 이메일(예 tester@naver.com) 에서 naver 추출
-- @ 시작위치 +1 = 7+1 = 8번째 
-- . 시작위치 - @ 시작위치 -1 = 5개 
select
    substr('tester@naver.com',
        instr('tester@naver.com', '@')+1,
        instr('tester@naver.com', '.') - instr('tester@naver.com', '@') -1)
from dual;

select instr('tester@naver.com', '@') from dual;      -- 7
select instr('tester@naver.com', '.',1,1) from dual;  -- 13

-- [3] 문자열 '   https://www.naver.com/   '의 양쪽공백제거 
select 
    trim('   https://www.naver.com/   ')
from dual;

-- '' 공백문자를 '' 빈문자 변경
select 
    replace('   A Bc/   ', ' ', '')
from dual;

select
    replace('   https://www.naver.com/   ', ' ', '')
from dual;

--          https://www.naver.com/    이상치 공백 제거 정제
select
    replace(trim(:site), ' ','')
from dual;
