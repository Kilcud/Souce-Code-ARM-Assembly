;	Thêm dãy các số 16-bit sử dụng bảng tra cứu địa chỉ
;	Ví dụ này có bảng tra cứu trống
		
		TTL		Ch5Ex2			
		AREA	Program, CODE, READONLY			
		ENTRY			
	
MAIN    
		LDR		R0, =Data1		    ; tải địa chỉ bảng tra cứu
		EOR		R1, R1, R1		    ; xoá R1 để lưu trữ tổng
		LDR		R2, Length		    ; khởi tạo biến đếm
		CMP		R2, #0	
		BEQ		Done
LOOP
		LDR		R3, [R0]		    ; lấy dữ liệu mà R0 trỏ tới
		ADD		R1, R1, R3			; thêm nó vào R1
		ADD		R0, R0, #+4			; tăng con trỏ
		SUBS	R2, R2, #0x1	    ; giảm biến đếm với cờ Z	
		BNE		Loop		        ; nếu cờ Z chưa bật, thực hiện lặp
DONE
		STR		R1, Result	        ; nếu không, kết thúc và lưu kết quả	
		SWI		&11	
		
		AREA	Data1, DATA
		
Table								; Bảng trống
TableEnd	DCD		0	

		AREA	Data2, DATA
Length	DCW		(TablEnd - Table) / 4	; căn chỉnh
		ALIGN					        ; đếm số lần lặp
Result	DCW		0				        ; lưu trữ kết quả

		END
