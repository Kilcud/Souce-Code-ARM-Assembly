;	Tìm độ dài của chuỗi 

		TTL		Ch6Ex3

Blank	EQU		“   ”				
		AREA	Program, CODE, READONLY	
		ENTRY
		
Main
		ADR		R0, =Data1		    ; tải địa chỉ bảng tra cứu
		MOV		R1, #Blank		    ; lưu kí tự trống trong R1
Loop		
		LDRB	R2, [R0], #1		; tải byte đầu tiên vào R2
		CMP		R2, #0		        ; có phải byte trống không?
		BEQ		Loop		    	; nếu có, thực hiện lặp

		SUB		R0, R0, #1	        ; nếu không, điều chỉnh con trỏ
		STR		R0, Pointer		    ; và lưu trữ nó
		SWI		&11
		
		AREA	Data1, DATA

Table		
		DCB		“	7	”
		ALIGN

		AREA	Result, DATA
Pointer	DCD		0			        ; lưu trữ để đếm
		ALIGN	    

		END
