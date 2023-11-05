;	Tìm số lớn hơn

		TTL		    comparenum
		AREA	    Program, CODE, READONLY
		ENTRY

Main		
		LDR		    R1, Value1		    ; Tải giá trị đầu tiên để so sánh
		LDR		    R2, Value2		    ; Tải giá trị thứ hai để so sánh
		CMP		    R1, R2		        ; So sánh hai giá trị
		BHI		    Done			    ; Nếu R1 chứa giá trị lớn nhất
		MOV		    R1, R2		        ; Nếu không thì ghi đè lên R1
Done
		STR		    R1, Result		    ; Lưu kết quả
		SWI		    &11				

Value1	DCD		    &FEDCA987	        ; Giá trị được so sánh	
Value2	DCD		    &12345678		    ; Giá trị được so sánh
Result	DCD		    0			        ; Không gian lưu trữ kết quả
		END
