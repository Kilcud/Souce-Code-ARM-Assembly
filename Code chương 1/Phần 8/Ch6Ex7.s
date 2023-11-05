;	So sánh hai chuỗi được đếm
;	giả định rằng chúng ta không có kiến thức về cấu trúc dữ liệu
;	vì vậy chúng ta phải đánh giá từng chuỗi riêng lẻ

		TTL		Ch6Ex7

		AREA	Program, CODE, READONLY		
		ENTRY

Main
		LDR		R0, =Data1		    ; tải địa chỉ bảng tra cứu
		LDR		R1, =Data2		
		LDR		R2, Match	        ; giả sử các chuỗi khác nhau, đặt -1
		MOV		R3, #0		        ; khởi tạo thanh ghi
		MOV		R4, #0
Count1
		LDRB	R5, [R0], #1		; tải byte đầu tiên vào R5
		CMP		R5, #0		        ; có phải kí tự cuối cùng?
		BEQ		Count2		        ; nếu không, thực hiện lặp
		ADD		R3, R3, #1		    ; tăng biến đếm
		B		Count1
Count2
		LDRB	R5, [R0], #1		; tải byte đầu tiên vào R5
		CMP		R5, #0		        ; có phải kí tự cuối cùng?
		BEQ		Next			    ; nếu không, thực hiện lặp
		ADD		R4, R4, #1		    ; tăng biến đếm
		B		Count2

Next	CMP		R3, R4
		BNE		Done			    ; nếu độ dài khác nhau,
							        ; chúng không thể bằng nhau
		CMP		R3, #0		        ; kiểm tra nếu độ dài là 0
		BEQ		Same			    ; nếu độ dài là 0, kết thúc
		LDR		R0, =Data1		    ; khởi động lại bảng tra cứu
		LDR		R1, =Data2

;	kiểm tra từng kí tự
Loop
		LDRB	R5, [R0], #1		; kí tự của chuỗi thứ nhất
		LDRB	R6, [R1], #1		; kí tự của chuỗi thứ hai
		CMP		R5, R6		        ; giống nhau?
		BNE		Done		        ; nếu không, hai chuỗi khác nhau
		SUBS		R3, R3, #1	    ; dùng chiều dài chuỗi như bộ đếm
		BEQ		Same			    ; nếu đến phần cuối bộ đếm
							        ; các chuỗi giống nhau
		B		Loop			    ; chưa hoàn thành, tiếp tục lặp

Same
		MOV		R2, #0		        ; xoá -1
Done	
		STR		R2, Match		    ; lưu kết quả
		SWI		&11

		AREA	Data1, DATA
Table1	DCB		“Hello, world”, 0	; chuỗi
		ALIGN

		AREA	Data2, DATA
Table2	DCB		“Hello, world”, 0	; chuỗi
		
		AREA	Result, DATA
		ALIGN
Match	DCD		&FFFF		        ; cờ ghép

		END
