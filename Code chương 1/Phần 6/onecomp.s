;   Tìm phần bù của một số

		TTL 	onescomp
		AREA	Program, CODE, READONLY
		ENTRY

Main
		LDR		R1, Value	        ; tải số cần tìm phần bù
		MVN		R1, R1		        ; không phải nội dung R1
		STR		R1, Result			; lưu kết quả
		SWI		&11

Value	DCD		&C123		        ; giá trị là phần bù
Result	DCD		0					; lưu kết quả
		END	
