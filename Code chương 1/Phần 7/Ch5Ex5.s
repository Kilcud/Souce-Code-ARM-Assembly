;	Quét một dãy số 16-bit để tìm số lớn nhất

		TTL		Ch5Ex5
		AREA	Program, CODE, READONLY		
		ENTRY
		
Main
		LDR		R0, =Data1		    ; tải địa chỉ bảng tra cứu
		EOR		R1, R1, R1			; xoá R1 để lưu trữ tổng
		LDR		R2, Length			; khởi tạo biến đếm
		CMP		R2, #0		
		BEQ		Done				; bảng trống
Loop
		LDR		R3, [R0]			; lấy dữ liệu
		CMP		R3, R1			    ; bit là 1
		BCC		Looptest		    ; bỏ qua dòng kế tiếp nếu là 0
		MOV		R1, R3			    ; tăng biến đếm số âm
Looptest					
		ADD		R0, R0, #+4			; tăng con trỏ
		SUBS	R2, R2, #0x1	    ; giảm biến đếm với cờ Z	
		BNE		Loop	        	; nếu cờ Z chưa bật, thực hiện lặp
Done
		STR		R1, Result		    ; nếu không, lưu kết quả
		SWI		&11	

		AREA	Data1, DATA

Table	DCW		&A152		        ; giá trị trong bảng để kiếm tra
		ALIGN
		DCW		&7F61
		ALIGN			
		DCW		&F123
		ALIGN
		DCW		&80000
		ALIGN
TableEnd	DCD		0

		AREA	Data2, DATA

Length	DCW		(TablEnd - Table) / 4	; căn chỉnh
		ALIGN					        ; đếm vòng lặp
Result	DCW		0				        ; lưu trữ kết quả

4		END
