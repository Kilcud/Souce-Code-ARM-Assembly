;   Kiểm tra bảng để tìm kết quả khớp - lưu trữ mục nhập mới ở cuối nếu không tìm thấy kết quả khớp
	
		TTL		CH9Ex1
		AREA	Program, CODE, READONLY
		ENTRY

Main
		LDR		R0, List		    ; Tải giá trị khởi đầu vào danh sách
		LDR		R1, NewItem	        ; Tải giá trị mới
    	LDR		R3, [R0]		    ; Sao chép bộ đếm danh sách
		LDR		R2, [R0], #4		; Khởi tạo bộ đếm và tăng con trỏ
		LDR		R4, [R0], #4		
Loop
		CMP		R1, R4		        ; Kiểm tra sự trùng khớp
        BEQ		Done			    ; Kết thúc
		SUBS	R2, R2, #1		    ; Không, kiểm tra phần tử tiếp theo
		LDR		R4, [R0], #4		; Lấy phần tử tiếp theo
		BNE		Loop			    ; và lặp
		
		SUB		R0, R0, #4		    ; Điều chỉnh con trỏ
		ADD		R3, R3, #1		    ; Tăng số phần tử
		STR 	R3, Start		    ; và lưu nó lại
		STR		R1, [R0]		    ; Lưu phần tử mới cuối danh sách

Done	SWI		&11

		AREA	Data1, DATA	
Start	DCD		&4			        ; Độ dài danh sách
		DCD		&5376		        ; Các phần tử
		DCD		&7615
		DCD		&138A
		DCD		&21DC
Store	%		&20			        ; đảo ngược 20 byte của lưu trữ

		AREA	Data2, DATA
NewItem	DCD	    &16FA
List	DCD		Start

		END
