
-- Tách bảng chính thành bảng phụ theo nguyên tắc 2NF

-- 1/ Tách sang bảng dim_customer
SELECT
    customer_id,
    home_ownership,
    annual_income,
    income_verification_status,
    state,
    debt_to_income_ratio,
    delinquencies_2yrs,
    earliest_credit_line,
    public_record
INTO
    dim_customer 
FROM
    fact_loan;

-- 1.1/ Loại bỏ các cột có trong bảng dim_customer trừ customer_id
ALTER TABLE dbo.Fact_loan
DROP COLUMN 
    home_ownership,
    annual_income,
    income_verification_status,
    state,
    debt_to_income_ratio,
    delinquencies_2yrs,
    earliest_credit_line,
    public_record;

-- 2/ Tách sang bảng Dim_grade
SELECT 
    DISTINCT grade,
    sub_grade
INTO dim_Grade
FROM fact_loan;

-- 3/ Thêm cột grade_id để làm khóa chính cho bảng dim_grade
ALTER TABLE dbo.dim_Grade
ADD Grade_id FLOAT(10);

-- 4/ Thêm giá trị số đếm cho cột Grade_id
UPDATE dim_grade
SET dim_grade.grade_id = T2.ranked_id
FROM dim_grade
JOIN (
    SELECT
        grade,
        sub_grade,
        DENSE_RANK() OVER (ORDER BY grade, sub_grade) AS ranked_id
    FROM
        dim_grade 
) AS T2
ON dim_grade.grade = T2.grade AND dim_grade.sub_grade = T2.sub_grade;

-- 5/ Thêm cột grade_id vào fact_loan và loại bỏ các cột grade, sub_grade
ALTER TABLE dbo.Fact_loan
ADD grade_id FLOAT(10);

UPDATE dbo.Fact_loan
SET dbo.Fact_loan.Grade_id = dbo.Dim_grade.Grade_id
FROM dbo.Fact_loan
JOIN dbo.Dim_grade
ON dbo.Fact_loan.grade = dbo.Dim_grade.grade AND dbo.Fact_loan.sub_grade = dbo.Dim_grade.sub_grade;

ALTER TABLE dbo.Fact_loan
DROP COLUMN grade, sub_grade;

-- 6/ Tách sang bảng dim_loan_status
SELECT DISTINCT loan_status 
INTO dim_loan_status
FROM dbo.Fact_loan;

-- 7/ Thêm khóa chính status_id vào bảng dim_loan_status
ALTER TABLE dbo.dim_loan_status
ADD status_id FLOAT(10);

UPDATE dbo.dim_loan_status
SET	status_id = RN
FROM dbo.dim_loan_status
JOIN (
    SELECT loan_status, ROW_NUMBER() OVER(ORDER BY loan_status) AS RN 
    FROM dim_loan_status
) AS S
ON dbo.dim_loan_status.loan_status = S.loan_status;

-- 8/ Thêm cột status_id vào fact_loan và loại bỏ loan_status
ALTER TABLE dbo.Fact_loan
ADD status_id FLOAT(10);

UPDATE dbo.Fact_loan
SET dbo.Fact_loan.status_id = dbo.dim_loan_status.status_id
FROM dbo.Fact_loan
JOIN dbo.dim_loan_status
ON dbo.Fact_loan.loan_status = dbo.dim_loan_status.loan_status;

ALTER TABLE dbo.Fact_loan
DROP COLUMN loan_status;
