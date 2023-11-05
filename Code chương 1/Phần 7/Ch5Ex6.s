;	Chuẩn hoá một số nhị phân

		TTL		Ch5Ex6
		AREA	Program, CODE, READONLY		
		ENTRY
		
Main
		LDR		R0, =Data1		    ; tải địa chỉ bảng tra cứu
		EOR		R1, R1, R1		    ; xoá R1 để lưu thay đổi
		LDR		R3, [R0]			; lấy dữ liệu
		CMP		R3, R1			    ; bit là 1		
		BEQ		Done				; bảng trống
Loop				
		ADD		R1, R1, #1			; tăng con trỏ
		MOVS	R3, R3, LSL#0x1	    ; giảm biến đếm với cờ Z	
		BPL		Loop		        ; nếu cờ N không bật, thực hiện lặp
Done
		STR		R1, Shifted		    ; nếu không, lưu kết quả
		STR		R3, Normal	
		SWI		&11	

		AREA	Data1, DATA

Table							    ; giá trị trong bảng để kiểm tra
;		DCD		&30001000
;		DCD		&00000001
;		DCD		&00000000
		DCD		&C1234567

		AREA 	Result, DATA

Number	DCD		Table 
Shift	DCB		0				    ; lưu trữ thay đổi
		ALIGN	
Normal	DCD		0				    ; lưu trữ thay đổi

3		END
