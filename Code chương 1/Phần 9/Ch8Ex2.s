; 	chia số nhị phân 32 bit cho số nhị phân 16 bit
; 	lưu trữ thương số và số dư
; 	không có lệnh DIV trong ARM

 		TTL 	Ch8Ex2
 		AREA 	Program, CODE, READONLY
 		ENTRY

Main
 		LDR 	R0, Number1 	    ; tải số đầu tiên
 		LDR 	R1, Number2 	    ; tải số thứ hai
 		MOV		R3, #0 		        ; xoá thanh ghi cho thương số
Loop
 		CMP 	R1, #0 		        ; kiểm tra chia cho 0
		BEQ 	Err
		CMP 	R0, R1              ; số chia có nhỏ hơn số bị chia không?
		BLT 	Done 			    ; nếu có, hoàn thành
		ADD 	R3, R3, #1 		    ; thêm 1 vào thương
		SUB 	R0, R0, R1 		    ; lấy đi số đầu tiên
		B 		Loop 			    ; và lặp
		Err
		MOV 	R3, #0xFFFFFFFF     ; lỗi cờ (-1)
Done
		STR 	R0, Remain 		    ; lưu trữ phần dư
		STR 	R3, Quotient 	    ; và thương số
		SWI 	&11 			    ; hoàn thành

		AREA 	Data1, DATA
Number1 DCD 	&0075CBB1       	; số nhị phân 16-bit
Number2 DCD 	&0141 		        ; số nhị phân 16-bit
		ALIGN

		AREA 	Data2, DATA
Quotient    DCD 		0 		    ; lưu kết quả
Remain 		DCD 		0 			; lưu phần dư
			ALIGN

		END
