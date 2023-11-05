;	Sắp xếp danh sách giá trị - dùng thuật toán bong bóng đơn giản
	
		TTL		Ch9Ex5
		AREA	Program, CODE, READONLY
		ENTRY

MAIN
		LDR		R6, List		    ; trỏ đến phần đầu danh sách
		MOV		R0, #0		        ; xoá thanh ghi
		LDRB	R0, [R6]	    	; lấy độ dài danh sách
		MOV		R8, R6		        ; sao chép phần đầu danh sách
SORT		
		ADD		R7, R6, R0		    ; lấy địa chỉ của phần tử cuối cùng
		MOV		R1, #0		        ; bật cờ Zero
		ADD		R8, R8, #1		    ; dịch mỗi byte lên danh sách 1 byte
NEXT					            ; lặp lại
		LDRB	R2, [R7], #-1	    ; tải byte đầu tiên
		LDRB	R3, [R7]		    ; và byte thứ hai
		CMP		R2, R3		        ; so sánh hai byte này
		BCC		NoSwitch		    ; rẽ nhánh nếu r2 nhỏ hơn r3

		STRB	R2, [R7], #1		; nếu không, hoán đổi hai byte
		STRB	R3, [R7]		
		ADD		R1, R1, #1		    ; thay đổi thiết lập cờ
		SUB		R7, R7, #1		    ; giảm địa chỉ để kiểm tra
NoSwitch	
		CMP		R7, R8	        	; kiểm tra số lượng byte được kiểm
		BHI		Next		       	; nếu chưa đủ, thực hiện vòng lặp
		CMP		R1, #0		        ; nếu chúng ta đã thực hiện thay đổi
		BNE		Sort			    ; nếu vậy, kiểm tra lại, thoát lặp

Done	SWI		&11			        ; hoàn thành

		AREA	Data1, DATA
START	DCB	    6
		DCB		&2A, &5B, &60, &3F, &D1, &19

		AREA	Data2, DATA
List	DCD		Start

		END		
