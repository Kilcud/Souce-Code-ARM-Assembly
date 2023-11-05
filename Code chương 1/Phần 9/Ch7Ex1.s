;	Chuyển từ số hex sang kí tự ASCII tương đương của nó
	
		TTL		Ch7Ex1
			
		AREA	Program, CODE, READONLY	
		ENTRY

Main
		LDR		R0, Digit		; tải số
		LDR		R1, =Result		; tải địa chỉ cho kết quả
		CMP		R0, #0xA		; nếu số < 10?
		BLT		Add_0		    ; phân nhánh

		ADD		R0, R0, #“A”-“0”-0xA	; thêm phần bù từ ‘A’ đến ‘F’
Add_0
		ADD		R0, R0, #“0”	; chuyển qua ASCII
		STR		R0, [R1]		; lưu kết quả
		SWI		&11

		AREA	Data1, DATA
		Digit
		DCD		&0C		    	; số hex

	    AREA	Data2, DATA	
Result	DCD		0			    ; lưu trữu kết quả

		END
