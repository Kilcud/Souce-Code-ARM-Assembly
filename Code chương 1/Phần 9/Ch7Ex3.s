	Chuyển đổi một ký tự số ASCII thành số thập phân

		TTL		Ch7Ex3
			
		AREA	Program, CODE, READONLY	
		ENTRY

Main
		MOV		R1, #-1		        ; đặt cờ lỗi là -1
		LDRB 	R0, char		    ; lấy kí tự
		SUBS 	R0, R0, #“0”	    ; chuyển đổi và kiểm tra xem ký tự < 0? 
		BCC		Done			    ; nếu có, bỏ qua
		CMP		R0, #9		        ; kiếm tra xem > 9?
		BHI		Done			    ; nếu có, bỏ qua
		MOV		R1, R0		        ; nếu không thì
Done
		STR		R1, Result		    ; lưu số thập phân
		SWI		&11			        ; hoàn thành

		AREA	Data1, DATA
Char	DCB		&37			        ; mã ASCII của 7
		ALIGN

		AREA	Data2, DATA
Result 	DCD		0			        ; lưu trữ kết quả

		END
