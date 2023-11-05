;	Xoá phần tử thứ nhất của hàng chờ

		TTL		Ch9Ex4
		AREA	Program, CODE, READONLY
		ENTRY

MAIN	
		LDR		R0, Queue		    ; tải phần đầu hàng chờ
		STR		R1, Pointer		    ; và lưu nó vào con trỏ
		CMP		R0, #0		        ; kiểm tra NULL?
		BEQ		Done			    ; nếu đúng, không cần thao tác
		
		LDR		R1, [R0]		    ; nếu không, lấy phần tử tiếp theo
		STR		R1, Queue		    ; và biến nó thành phần tử đầu tiên
	
Done	SWI		&11

		AREA	Data1, DATA
Queue	DCD	    Item1			    ; trỏ đến vị trí đầu của hàng chờ
Pointer	DCD	    0			        ; không gian để lưu con trỏ

DArea	%	    20			        ; không gian để lưu các mục

; 	mỗi phần tử chứa con trỏ trỏ đến phần tử tiếp theo và vài số liệu
Item1	DCD		Item2			    ; con trỏ
		DCB		30, 20			    ; dữ liệu

Item2	DCD		Item3			    ; con trỏ
		DCB		30, 0xFF		    ; dữ liệu

Item3	DCD		0			        ; con trỏ (NULL)
		DCB		30, &87, &65	    ; dữ liệu

		END
