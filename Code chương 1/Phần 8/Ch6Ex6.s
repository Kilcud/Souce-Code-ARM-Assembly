;	So sánh hai chuỗi được đếm

		TTL		Ch6Ex6

		AREA	Program, CODE, READONLY		
		ENTRY

Main
		LDR		R0, =Data1		    ; tải địa chỉ bảng tra cứu
    	LDR		R1, =Data2		
		LDR		R2, Match	        ; giả sử các chuỗi khác nhau, đặt -1
		LDR		R3, [R0], #4	    ; lưu chiều dài chuỗi đầu tiên vào R3
		LDR		R4, [R1], #4	    ; lưu chiều dài chuỗi thứ hai vào R4
		CMP		R3, R4
		BNE		Done			    ; nếu độ dài khác nhau
								    ; chúng không thể bằng nhau
		CMP		R3, #0		        ; kiểm tra độ dài 2 chuỗi = 0?
		BEQ		Same			    ; nếu có, kết thúc

;	kiểm tra từng kí tự
Loop		
		LDRB	R5, [R0], #1		; kí tự chuỗi đầu tiên
		LDRB	R6, [R1], #1		; kí tự chuỗi thứ hai
		CMP		R5, R6		        ; giống nhau?
		BNE		Done		        ; nếu không, hai chuỗi khác nhau
		SUBS	R3, R3, #1	        ; sử dụng độ dài chuỗi như bộ đếm
		BEQ		Same			    ; nếu đến phần cuối bộ đếm
							        ; hai chuỗi giống nhau
		B		Loop		    	; chưa xong, thực hiện lặp

Same	MOV		R2, #0		        ; xoá -1 
Done 	STR		R2, Match		    ; lưu kết quả
		SWI		&11

		AREA	Data1, DATA
Table1	DCD		3	                ; bảng dữ liệu khởi đầu với byte chiều dài
		DCB		“CAT”		        ; chuỗi

		AREA	Data2, DATA
Table2	DCD		3	                ; bảng dữ liệu khởi đầu với byte chiều dài 
		DCB		“CAT”		        ; chuỗi

		AREA	Result, DATA
		ALIGN
Match	DCD		&FFFF		        ; lưu kí tự chẵn lẻ

		END
