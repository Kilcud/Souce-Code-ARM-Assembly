;	Tìm độ dài của chuỗi kết thúc NULL

		TTL		Ch6Ex2
		AREA	Program, CODE, READONLY		
		ENTRY
		
Main
		ADR		R0, =Data1		    ; tải địa chỉ bảng tra cứu
		MOV		R1, #-1		        ; bắt đầu đếm từ -1
Loop		
		AND		R1, R1, #1		    ; tăng biến đếm
		LDRB	R2, [R0], #1		; tải byte đầu tiên vào R2
		CMP		R2, #0		        ; có phải kí tự kết thúc không?
		BNE		Loop

		STR		R1, Result		    ; nếu không, lưu kết quả
		SWI		&11	

		AREA	Data1, DATA

Table
		DCB		“Hello, World’, 0
		ALIGN	

		AREA	Result, DATA
CharCount
		DCB		0			        ; lưu trữ để đếm
		ALIGN

		END
