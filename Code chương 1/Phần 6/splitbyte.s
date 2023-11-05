;	Phân tách một byte thành các phần nhỏ bậc cao và bậc thấp của nó

		TTL		    16bitadd-2
		AREA	    Program, CODE, READONLY
		ENTRY

Main		
		LDR		    R1, Value		    ; Tải giá trị được phân tách
		LDR		    R2, Mask		    ; Tải bit mặt nạ
        MOV		    R3, R1, LSR#0x4	    ; Chỉ sao chép nibble bậc cao vào R3
		MOV		    R3, R3, LSR#0x8	    ; Dịch trái một bit
		AND		    R1, R1, R2		    ; Thực hiện phép AND số gốc với bit mask
		ADD		    R1, R1, R3		    ; Thêm kết quả đó vào giá trị được dịch chuyển vào R3
		STR		    R1, Result		    ; Lưu kết quả	
		SWI		    &11

Value	DCB		    &FB			        ; Giá trị được dịch
		ALIGN				            ; Giữ ranh giới bộ nhớ
Mask	DCW		    &000F		        ; Bit mask = %0000000000001111
		ALIGN
Result	DCD		    0			        ; Không gian lưu trữ kết quả
		END
