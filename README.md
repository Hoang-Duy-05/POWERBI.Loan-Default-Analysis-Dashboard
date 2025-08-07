Loan Default Analysis Dashboard: https://app.powerbi.com/view?r=eyJrIjoiZGY2M2M1MTUtNWM4MS00MmI1LTk0Y2MtZjk5MTJjMDk1NzA0IiwidCI6ImJlODMyOWE3LTcyMTgtNDlhMy05YWMxLWQ3Yjk1NDU2M2YzOSIsImMiOjEwfQ%3D%3D 
________________________________________
Project Overview:
Dataset này chứa thông tin chi tiết về các khoản vay từ một FinTech lending platform trong giai đoạn 2007-2014. Dữ liệu bao gồm thông tin về đặc điểm của người vay, điều khoản khoản vay, lịch sử trả nợ, và tình trạng khoản vay. Dataset này cung cấp cái nhìn toàn diện về hành vi vay nợ, hiệu suất trả nợ, và các yếu tố ảnh hưởng đến rủi ro tín dụng. Dữ liệu được thu thập trong khoảng thời gian bao gồm cả cuộc khủng hoảng tài chính 2008 và giai đoạn phục hồi sau đó, cho phép phân tích tác động của các biến động thị trường đến hành vi vay nợ và khả năng trả nợ.
________________________________________
Mục tiêu:
Nhận diện những nhóm khách hàng nào có nguy cơ dẫn đến nợ xấu từ đó đưa ra bộ nguyên tắc để hạn chế nợ xấu
________________________________________
Dictionary Dataset
-	id → Mã khoản vay độc nhất
-	customer_id → Mã khách hàng độc nhất
-	loan_amount → Số tiền khoản vay được yêu cầu
-	funded_amount → Số tiền thực tế được cấp vốn
-	investor_funds → Số tiền đóng góp từ nhà đầu tư
-	term → Thời hạn khoản vay (tháng)
-	interest_rate → Lãi suất khoản vay (%)
-	installment → Khoản thanh toán hàng tháng
-	grade → Xếp hạng khoản vay (A-G, với A là tốt nhất)
-	sub_grade → Xếp hạng chi tiết hơn (A1, A2, B1, B2, v.v.)
-	home_ownership → Tình trạng sở hữu nhà (OWN, MORTGAGE, RENT, OTHER)
-	annual_income → Thu nhập hàng năm của người vay
-	income_verification_status → Trạng thái xác minh thu nhập (Verified, Source Verified, Not Verified)
-	loan_issue_date → Ngày cấp khoản vay (năm-tháng)
-	loan_status → Trạng thái khoản vay (Fully Paid, Current, Default, Charged Off, Late)
-	purpose → Mục đích vay (mua xe, sửa nhà, trả nợ thẻ tín dụng, v.v.)
-	state → Mã bang nơi người vay cư trú
-	debt_to_income_ratio → Tỷ lệ nợ trên thu nhập (%)
-	delinquencies_2yrs → Số lần trễ hạn thanh toán trong 2 năm qua
-	earliest_credit_line → Thời điểm mở dòng tín dụng đầu tiên (năm-tháng)
-	public_record → Số lượng hồ sơ công khai tiêu cực (phá sản, tịch thu tài sản, v.v.)
-	outstanding_principal → Số tiền gốc còn lại
-	total_pymnt → Tổng số tiền đã thanh toán
-	last_credit_pull_d → Ngày kiểm tra tín dụng gần nhất
-	last_pymnt_d → Ngày thanh toán gần nhất
________________________________________
Loan Default Analysis Dashboard được thiết kế trực quan nhằm giúp nhà quản lý theo dõi xu hướng vay vốn, đánh giá rủi ro tín dụng và đưa ra các chiến lược phù hợp để giảm thiểu tỷ lệ vỡ nợ. Báo cáo bao gồm các trang chính sau:

-	Overview: Trang tổng quan hiển thị các chỉ số cốt lõi như tổng số khoản vay (140K), tổng số vốn đã giải ngân (2 tỷ), khoản vay trung bình (14.3K), và tỷ lệ vỡ nợ (12%). Trang này cũng cung cấp biểu đồ tăng trưởng khoản vay qua từng năm (2007–2014), phân bổ theo mức độ xác minh thu nhập và trạng thái khoản vay. Tỷ lệ vỡ nợ theo nhóm thu nhập và số lần thanh toán trễ cũng được thể hiện rõ.

-	Grade: Trang này phân tích hiệu suất các khoản vay theo xếp hạng tín dụng (Grade A–G). Nội dung gồm: số lượng khoản vay theo trạng thái (đã thanh toán, quá hạn, vỡ nợ, v.v.), tỷ lệ khoản vay theo kỳ hạn (36 tháng vs. 60 tháng), và so sánh tỷ lệ thu nhập dưới/trên trung bình theo từng nhóm xếp hạng tín dụng. Trang này giúp nhận diện rõ rủi ro tín dụng phân theo chất lượng hồ sơ vay.


-	Customer: Tập trung vào đặc điểm khách hàng, trang này trình bày các yếu tố ảnh hưởng đến rủi ro vỡ nợ như tình trạng sở hữu nhà (thuê, sở hữu, thế chấp), mục đích vay (consolidation, credit card, vacation…), và thu nhập bình quân theo thời gian. Ngoài ra, trang còn hiển thị tỷ lệ nợ trên thu nhập (DTI) và số lần trễ hạn theo nhóm sở hữu nhà, từ đó giúp đánh giá mức độ rủi ro theo đặc điểm nhân khẩu học.

-	Detail: Cung cấp bảng dữ liệu chi tiết theo từng tháng trong giai đoạn 2007–2014, bao gồm số lượng khoản vay, số lượng vỡ nợ, tỷ lệ vỡ nợ, thu nhập bình quân, khoản vay trung bình, tỷ lệ nợ trên thu nhập và khoản trả góp trung bình. Trang này hỗ trợ việc theo dõi chi tiết hiệu suất hoạt động và phân tích theo thời gian thực tế.


