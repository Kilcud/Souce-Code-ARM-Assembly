;	Kiểm tra bảng được sắp xếp

		TTL		Ch9Ex3
		AREA	Program, CODE, READONLY
		ENTRY

Main
		LDR		R0, =NewItem	    ; tải địa chỉ qua danh sách
		SUB		R0, R0, #4		    ; điều khiển con trỏ đến phần tử cuối
		LDR		R1, NewItem 	    ; tải phần tử để kiểm tra
		LDR		R3, Start		    ; khỏi tạo bộ đếm bằng cách đọc chỉ 
							        ; mục từ danh sách
		CMP		R3, #0		        ; kiểm tra sự có mặt của phần tử 0
		BEQ		Missing		        ; có phần tử 0 – lỗi điều kiện
		LDR		R4, [R0], #-4	
Loop
		CMP		R1, R4		        ; phần tử trong danh sách chưa?
		BEQ		Done		    	; tìm thấy phần tử - hoàn thành
		BHI		Missing		        ; nếu phần tử kiểm tra lớn hơn thì nó 
							        ; không nằm trong danh sách 
		SUBS	R3, R3, #1		    ; không có – giảm bộ đếm
		LDR		R4, [R0], #-4	    ; lấy phần tử tiếp theo
		BNE		Loop			    ; và lặp

Missing MOV	    R3, #0xFFFFFFFF	    ; đánh dấu không tìm thấy

Done	STR		R3, Index		    ; lưu trữ chỉ mục (kể cả chỉ mục -1)
		SWI		&11			        ; hoàn thành

		AREA	Data1, DATA	
Start	DCD		&4			        ; chiều dài danh sách
		DCD		&0000138A		    ; các phần từ
		DCD		&000A21DC
		DCD		&001F5376
		DCD		&09018613

		AREA	Data2, DATA
NewItem	DCD	    &001F5376
Index	DCW		0
List	DCD		Start

		END
