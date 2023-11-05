;	Quét một dãy số 16-bit để tìm xem có bao nhiêu số âm
	
		TTL		Ch5Ex4
		AREA	Program, CODE, READONLY		
		ENTRY
		
Main
		LDR		R0, =Data1		    ; tải địa chỉ bảng tra cứu
		EOR		R1, R1, R1			; xoá R1 để lưu trữ tổng
		LDR		R2, Length			; khởi tạo biến đến
		CMP		R2, #0		
		BEQ		Done				; nếu bảng trống
Loop
		LDR		R3, [R0]			; lấy dữ liệu
		AND		R3, R3, #0x8000		; theo chiều bit AND 
		CMP		R3, #0x8000	        ; kiểm tra nếu bit thứ 16 là 1
		BMI		Looptest		    ; bỏ qua dòng kế tiếp nếu là 0
		ADD		R1, R1, #1			; tăng biến đếm số âm
Looptest	
		ADD		R0, R0, #+4			; tăng con trỏ
		SUBS	R2, R2, #0x1	    ; giảm biến đếm với cờ Z	
		BNE		Loop		        ; nếu chưa bật cờ Z, thực hiện lặp
Done
		STR		R1, Result		    ; nếu chưa xong, lưu kết quả
		SWI		&11	

		AREA	Data1, DATA

Table	DCW		&F152		        ; giá trị trong bảng để kiểm tra
		ALIGN   
		DCW		&7F61
		ALIGN			
		DCW		&80000
		ALIGN
TableEnd	DCD		0

		AREA	Data2, DATA
Length	DCW		(TablEnd - Table) / 4	; căn chỉnh
		ALIGN					        ; đếm vòng lặp
Result	DCW		0				        ; lưu trữ kết quả

    	END
