;	Phép nhân nhị phân 16-bit 

		TTL 		Ch8Ex1
		AREA	Program, CODE, READONLY
			ENTRY

Main
		LDR 	R0, Number1 	    ; tải số đầu tiên
		LDR 	R1, Number2 	    ; tải số thứ hai
		MUL 	R0, R1, R0 		    ; x:= y * x
;		MUL 	R0, R0, R1 		    ; không hợp lệ
 		STR 	R0, Result

		SWI 		&11 			; hoàn thành

 		AREA 	Data1, DATA
Number1 DCD 	&706F 		        ; số nhị phân 16-bit
Number2 DCD 	&0161 		        ; số nhị phân 16-bit
		ALIGN

		AREA 	Data2, DATA
Result 			DCD 		0 		; lưu trữ cho kết quả
		ALIGN

 			END
