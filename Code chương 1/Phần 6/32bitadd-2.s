;   Cộng hai số 32-bit

	    TTL		32bitadd-2
		AREA	Program, CODE, READONLY
		ENTRY

Main		
		LDR		R0, =Value1		    ; Tải địa chỉ giá trị đầu tiên
		LDR		R1, [R0]		    ; Tải những gì tại địa chỉ đó
		ADD		R0, R0, #0x4	    ; Điều chỉnh con trỏ
		LDR		R2, [R0]		    ; Tải những gì tại địa chỉ mới
		ADD		R1, R1, R2		    ; Cộng
		LDR		R0, =Result		    ; Tải địa chỉ lưu trữ
		STR		R1, [R0]		    ; Lưu kết quả
		SWI		&11				

Value1	DCD		&37E3C123		    ; Giá trị đầu tiên	
Value2	DCD		&367402AA	        ; Giá trị thứ hai
Result	DCD		0			        ; Không gian lưu trữ kết quả
		END
