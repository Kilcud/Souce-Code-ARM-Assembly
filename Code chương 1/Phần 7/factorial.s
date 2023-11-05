;	Tra cứu giai thừa từ bảng 
;	sử dụng địa chỉ vị trí bộ nhớ

		TTL		    factorial
		AREA	    Program, CODE, READONLY
		ENTRY

Main		
		LDR		    R1, =DataTable	                    ; Tải địa chỉ của bảng tra cứu
		LDR		    R2, Value		                    ; Phần bù của giá trị cần tra cứu
		MOV		    R1, R1, LSL#0x2	                    ; Dữ liệu được khai báo là 32 bit - cần
							                            ; Tăng gấp bốn lần phần bù để trỏ vào
							                            ; Địa chỉ bộ nhớ chính xác
		ADD		    R0, R0, R1		                    ; R0 chứa địa chỉ bộ nhớ để lưu trữ
		LDR		    R2, [R0]		
		LDR		    R3, =Result		                    ; Địa chỉ muốn lưu kết quả
		STR		    R2, [R3]		                    ; Lưu kết quả	

		SWI		    &11			 
						
		AREA	    DataTable, DATA
		
		DCD		    1		        ; 0! = 1	         ; Bảng dữ liệu chứa giai thừa
		DCD		    1		        ; 1! = 1
		DCD		    2		        ; 2! = 2
		DCD		    6		        ; 3! = 6
		DCD		    24		        ; 4! = 24
		DCD		    120		        ; 5! = 120
		DCD		    720		        ; 6! = 720
		DCD		    5040	        ; 7! = 5040
Value	DCB		    5
		ALIGN
Result	DCW		    0 

		END
