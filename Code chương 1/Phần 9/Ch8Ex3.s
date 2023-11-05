;	Cộng hai số BCD đóng gói để có kết quả BCD đóng gói

 		TTL 	Ch8Ex3
 		AREA 	Program, CODE, READONLY
 		ENTRY

 	Mask 		EQU 		0x0000000F

	Main
		LDR 	R0, =Result 		; địa chỉ để lưu trữ
		LDR 	R1, BCDNum1 	    ; tải số BCD đầu tiên
		LDR 	R2, BCDNum2 	    ; tải số BCD thứ hai
		LDRB 	R8, Length 		    ; khởi tạo bộ đếm
		ADD 	R0, R0, #3 		    ; điều chỉnh phần bù
		MOV 	R5, #0 		        ; carry

Loop
		MOV 	R3, R1 		        ; sao chép phần còn lại trong thanh ghi dữ liệu
		MOV 	R4, R2 		        ; và các số khác
		AND 	R3,R3, #Mask    	; che mọi thứ, ngoại trừ nibble thứ tự thấp
		AND		R4,R4, #Mask 	    ;che mọi thứ, ngoại trừ nibble thứ tự thấp
		MOV 	R1, R1, LSR #4 	    ; thay đổi vị trí số 1 ban đầu
		MOV 	R2, R2, LSR #4  	; thay đổi vị trí số 1 ban đầu 
		ADD 	R6, R3, R4 		    ; thêm các số
		ADD 	R6, R6, R5 		    ; và bộ nhớ
		CMP 	R6, #0xA 		    ; lớn hơn 10?
		BLT 	RCarry1 		    ; nếu không, reset bộ nhớ = 0
		MOV 	R5, #1 	            ; nếu không thì thiết lập cờ nhớ
		SUB 	R6, R6, #0xA    	; và trừ đi 10
		B 		Next
RCarry1
		MOV 	R5, #0 		        ; bộ nhớ khởi động lại về 0

Next
		MOV 	R3, R1 		        ; sao chép phần còn lại trong thanh ghi dữ liệu
		MOV 	R4, R2 		        ; và các số khác
		AND 	R3,R3, #Mask 	    ; che mọi thứ, ngoại trừ nibble thứ tự thấp
		AND 	R4,R4, #Mask 	    ; che mọi thứ, ngoại trừ nibble thứ tự thấp
		MOV 	R1, R1, LSR #4 	    ; thay đổi vị trí số 1 ban đầu
		MOV 	R2, R2, LSR #4 	    ; thay đổi vị trí số 1 ban đầu
		ADD 	R7, R3, R4 		    ; thêm các số
		ADD 	R7, R7, R5 		    ; và bộ nhớ
		CMP 	R7, #0xA 		    ; lớn hơn 10?
		BLT 	RCarry2 		    ; nếu không, reset bộ nhớ = 0
		MOV 	R5, #1 	            ; nếu không thì thiết lập cờ nhớ
		SUB 	R7, R7, #0xA 	    ; và trừ đi 10
		B 		Loopend

RCarry2
		MOV 	R5, #0 		        ; bộ nhớ khởi động lại về 0
Loopend
		MOV 	R7, R7, LSL #4      ; chuyển chữ số thứ hai được xử lý sang trái
		ORR 	R6, R6, R7		    ; và OR ở chữ số đầu tiên của nibble đầu tiên
		STRB 	R6, [R0], #-1 	    ; lưu trữ byte, giảm địa chỉ
		SUBS 	R8, R8, #1 		    ; giảm bộ đếm vòng lặp
		BNE 	Loop 			    ; lặp khi > 0
		SWI 	&11

		AREA 	Data1, DATA
Length 	DCB 	&04
		ALIGN
BCDNum1 DCB 	&36, &70, &19, &85 	; một số BCD đóng gói 8 chữ số

		AREA 	Data2, DATA
BCDNum2 DCB 	&12, &66, &34, &59  ; một số BCD đóng gói 8 chữ số

		AREA 	Data3, DATA
Result 	DCD 	0 				    ; lưu trữ kết quả

		END
