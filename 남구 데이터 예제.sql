# namgu 테이블에서 전체 필드검색
SELECT * FROM hote.namgu;

# namgu 테이블에서 구분, 세대수, 면적 필드 검색
SELECT 구분, 세대수, 면적 FROM Namgu;

# namgu 테이블에서 구분, 세대수, 면적 필드 중 중복을 제거하여 검색
SELECT DISTINCT 면적, 구분, 세대수 FROM namgu;

# namgu 테이블에서
# 구분이 '문현2동'인
# 레코드 중 전체 필드 검색
SELECT * FROM namgu WHERE 구분 = '문현2동 ';

# namgu 테이블에서
# 구성비가 3인
# 레코드 중 전체 필드 검색
SELECT * FROM namgu WHERE 구성비 = '3';

# namgu 테이블에서
# 구분이 '문현'으로 시작하는
# 레코드 중 전체 필드 검색
SELECT * FROM namgu WHERE 구분 LIKE '문현%';

# namgu 테이블에서
# 구분에 '문현'을 포함하는
# 레코드 중 전체 필드 검색
SELECT * FROM namgu WHERE 구분 LIKE '%문현%';

# namug 테이블에서
# 세대수가 10000이상인
# 레코드 중 전체 필드 검색
SELECT * FROM namgu WHERE 세대수 >= 10000;

# namug 테이블에서
# 세대수가 5000이하인
# 레코드 중 전체 필드 검색
SELECT * FROM namgu WHERE 세대수 <= 5000;

# namug 테이블에서
# 세대수가 10000이하 이면서 세대수가 5000이상인
# 레코드 중 전체 필드 검색
SELECT * FROM namgu WHERE 세대수 <= 10000 AND 세대수 >= 5000;

# namgu 테이블에서
# 세대수가 5000과 10000 사이인
# 레코드 중 전체 필드 검색
SELECT * FROM namgu WHERE 세대수 BETWEEN 5000 AND 10000;

# namgu 테이블에서
# 통이 21, 22, 23 중 하나라도 해당하는
# 레코드 중 전체 필드 검색
SELECT * FROM namgu WHERE 통 IN(21, 22, 23);

# namgu 테이블에서
# 통이 21, 22, 23 중 하나라도 해당하지 않는
# 레코드 중 전체 필드 검색
SELECT * FROM namgu WHERE 통 NOT IN(21, 22, 23);

# namgu 테이블에서
# 인구수가 10000명 이상이면서 18세이상 인구수가 12000명 이하인 레코드(행)중
# 전체 필드 검색
SELECT * FROM namgu
WHERE 인구수 >= 10000 AND 18세이상인구수 <= 12000;

# namgu 테이블에서
# 통이 20이상 이거나 혹은 반이 100이하인 레코드(행)중에 
# 구분, 세대수, 인구수, 통, 반 필드 검색
SELECT 구분, 세대수, 인구수, 통, 반 FROM namgu
WHERE 통 >= 20 OR 반 <= 100;

# namgu 테이블에서
# 인구수가 10000명이상인 레코드(행)중 
# 18세이상인구수가 12000명이하 이거나  반이 100이상인
# 레코드(행)의 전체 필드 검색
SELECT * FROM namgu
WHERE 인구수 >= 10000
AND(18세이상인구수 <= 12000 OR 반 >= 100);

# namgu 테이블에서
# 인구수가 10000명 이상이면서 18세인구수가 12000명 이하이고
# 반이 100이상인
# 레코드의 전체 필드 검색
SELECT * FROM namgu
WHERE 인구수 >= 10000 AND 18세이상인구수 <= 12000 OR 반 >= 100;

SELECT count(*), max(세대수), min(세대수)
FROM Namgu
WHERE 면적 = 1;

SELECT 면적, count(*), max(세대수), min(세대수)
FROM Namgu
GROUP BY 면적;

SELECT 면적, count(*), max(세대수), min(세대수)
FROM Namgu
GROUP BY 면적
HAVING max(세대수) >= 5000
ORDER BY 면적;

# Group By 되지 않은 필드는 Having에 사용 불가능
SELECT 면적, count(*), max(세대수), min(세대수)
FROM Namgu
GROUP BY 면적,세대수
HAVING 세대수 >= 5000
ORDER BY 면적;