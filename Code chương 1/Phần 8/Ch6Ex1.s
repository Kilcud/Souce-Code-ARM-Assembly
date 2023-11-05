;	Tìm độ dài của chuỗi

	    TTL		Ch6Ex1
				
	    CR		EQU		0x0D
			
		AREA	Program, CODE, READONLY	
		ENTRY

Main
		ADR		R0, Data1		    ; tải địa chỉ bảng tra cứu
		EOR		R1, R1, R1		    ; xoá R1 để lưu biến đếm
Loop
		LDRB	R2, [R0], #1		; tải byte đầu tiên vào R2
		CMP		R2, #CR		        ; có phải kí tự kết thúc không?
		BEQ		Done			    ; nếu không, thực hiện lặp
		ADD		R1, R1, #1		    ; tăng biến đếm
		B		Loop
Done
		STR		R1, CharCount   	; nếu không, lưu kết quả
		SWI		&11

		AREA	Data1, DATA

Table		
		DCB		‘Hello, World”, CR
		ALIGN

		AREA	Data1, DATA
Charcount	
		DCB		0			        ; lưu trữ để đếm
		ALIGN

		END
