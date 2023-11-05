;	Chuyển đổi số thập lục phân 32-bit thành chuỗi ASCII
;	xuất ra thiết bị đầu cuối
	
		TTL		Ch7Ex2
			
		AREA	Program, CODE, READONLY	
		ENTRY
Mask	EQU		0x0000000F

start
		LDR		R1, Digit		; tải số
		MOV		R4, #8		    ; khởi tạo máy tính
		MOV		R5, #28		    ; điều khiển dịch chuyển phải
MainLoop    
		MOV		R3, R1		    ; sao chép từ gốc
		MOV 	R3, R3, LSR R5	; dịch chuyển sang phải số bit chính xác
		SUB		R5, R5, #4		; giảm sự dịch chuyển bit
		AND		R3, R3, #Mask	; che tất cả từ nibble thứ nhất
		CMP		R3, #0xA		; nếu số < 10?
		BLT		Add_0		    ; phân nhánh

		AND		R3, R3, #“A”-“0”-0xA	; thêm phần bù từ ‘A’ đến ‘F’

Add_0	ADD		R0, R0, #“0”	; chuyển qua ASCII
		MOV		R0, R3		    ; chuẩn bị xuất
		SWI		&0			    ; xuất ra bàn điều khiển
		SUBS		R4, R4, #1	; giảm bộ đếm
		BNE		MainLoop	

		MOV		R0, #&0D		; thêm kí tự CR
		SWI		&0			    ; xuất nó ra
		SWI		&11			    ; hoàn thành

		AREA	Data1, DATA
Digit	DCD		&DEADBEEF	    ; từ hex

		END
