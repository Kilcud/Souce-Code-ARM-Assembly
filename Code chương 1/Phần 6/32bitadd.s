;   Thêm hai số 32 bit

		TTL		32bitadd
		AREA	Program, CODE, READONLY
		ENTRY

Main		
		LDR		R1, Value1		    ; Tải số đầu tiên
		LDR		R2, Value 2		    ; Tải số thứ hai
		ADD		, R1, R2	        ; Gán chúng vào R1 (x= x + y)
		STR		R1, Result		    ; Lưu kết quả
		SWI		&11

Value1	DCW		&37E3C123		    ; Thêm giá trị thứ nhất
				
Value2	DCW		&367402AA	        ; Thêm giá trị thứ hai

Result	DCW		0			        ; Lưu kết quả
		END
