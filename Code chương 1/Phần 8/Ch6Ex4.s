;	Loại bỏ các số 0 đứng đầu trong chuỗi

		TTL		Ch6Ex4

Blank	EQU		“    ”
Zero	EQU		“ 0 ”
		AREA	Program, CODE, READONLY		
		ENTRY

Main
		ADR		R0, Data1		    ; tải địa chỉ bảng tra cứu
		MOV		R1, #Zero		    ; lưu biến Zero trong R1
		MOV		R3, #Blank		    ; và biến trống trong R3
Loop
		LDRB	R2, [R0], #1		; tải byte đầu tiên vào R2
		CMP		R2, R1		        ; có phải là số 0 không?
		BNE		Done		    	; nếu không, kết thúc

		SUB		R0, R0, #1		    ; nếu có, điều chỉnh con trỏ
		STRB	R3, [R0]	    	; và lưu kí tự trống vào đó
		ADD		R0, R0, #1		    ; hoặc điều chỉnh con trỏ
		B		Loop		    	; và lặp

Done
		SWI		&11			        ; hoàn thành

		AREA	Data1, DATA

Table
		DCB		“000007000”
		ALIGN

		AREA	Result, DATA
Pointer	DCD		0			        ; lưu trữ
		ALIGN	

		END
