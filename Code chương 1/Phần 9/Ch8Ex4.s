; 	Nhân hai số 16 bit để có kết quả 32 bit
2	

		TTL 		Ch8Ex4
		AREA 	Program, CODE, READONLY
		ENTRY

Main
		LDR 	R0, Number1 		    ; tải số đầu tiên
		LDR 	R1, Number2 		    ; tải số thứ hai
		LDR 	R6, =Result 		    ; tải địa chỉ kết quả
		MOV 	R5, R0, LSR #16 	    ; nửa trên R0
		MOV		R3, R1, LSR #16 	    ; nửa trên R1
		BIC 	R0, R0, R5, LSL #16     ; nửa dưới R0
		BIC 	R1, R1, R3, LSL #16     ; nửa dưới R1
		MUL 	R2, R0, R1 			    ; một phần kết quả
		MUL 	R0, R3, R0 			    ; một phần kết quả
		MUL 	R1, R5, R1 			    ; một phần kết quả
		MUL 	R3, R5, R3 			    ; một phần kết quả
		ADDS 	R0, R1, R0 			    ; cộng các phần giữa
		ADDCS 	R3, R3, #&10000 		; thêm vào bất kì phần nhớ ở trên
		ADDS 	R2, R2, R0, LSL #16 	; LSB 32 bits
		ADC 	R3, R3, R0, LSR #16 	; MSB 32 bits

		STR 	R2, [R6] 		    	; lưu LSB
		ADD 	R6, R6, #4 		    	; tăng con trỏ
		STR 	R3, [R6] 		    	; lưu MSB
		SWI 	&11 				    ; hoàn thành

		AREA 	Data1, DATA
Number1 DCD 	&12345678 			    ; số nhị phân 16-bit
Number2 DCD 	&ABCDEF01 		        ; số nhị phân 16-bit 
 		ALIGN

 		AREA 	Data2, DATA
Result 	DCD     0 					    ; lưu trữ cho kết quả
		ALIGN

		END
