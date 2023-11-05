;		Thêm 64-bit

		TTL		    64bitadd
		AREA	    Program, CODE, READONLY
		ENTRY

Main		
		ADR		    R0, Value1		                ; Trỏ đến giá trị đầu tiên
		LDMIA	    R0, {R1,R2}	                    ; Tải giá trị được thêm
		ADR		    R0, Value2		                ; Trỏ đến giá trị thứ hai
		LDMIA	    R0, {R3,R4}	                    ; Tải giá trị được thêm
		ADDS	    R6, R2, R4		                ; Thêm 4 bytes thấp và đặt cờ C
		ADC		    R5, R1, R3		                ; Thêm 4 bytes cao bao gồm cờ C
		ADR		    R0, Result		                ; Trỏ đến kết quả
		STMIA	    R0, {R5,R6}	                    ; Lưu kết quả		
		SWI		    &5
		SWI		    &11

Value1	DCD		    &12A2E640, &F21000123	        ; Giá trị được thêm	
Value2	DCD		    &12345678, &40023F5             ; Giá trị được thêm
Result	DCD		    0			                    ; Không gian lưu trữ kết quả
		END
