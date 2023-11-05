;   Dịch trái 1 bit

		TTL 	shiftleft
		AREA	Program, CODE, READONLY
		ENTRY

Main
		LDR		R1, Value		    ; Tải giá trị được dịch trái
		MOV		R1, R1, LSL #0x1	; Dịch sang trái một bit
		STR		R1, Result		    ; Lưu kết quả
		SWI		&11

Value	DCD		&4242		        ; Giá trị được dịch
Result	DCD		0			        ; Không gian lưu trữ kết quả
		END	
