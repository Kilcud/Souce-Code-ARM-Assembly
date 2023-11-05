;	Quét một dãy số 32 bit để tìm xem có bao nhiêu số âm

		TTL		Ch5Ex3
		AREA	Program, CODE, READONLY		
		ENTRY
		
MAIN
		LDR		R0, =Data1		    ; tải địa chỉ bảng tra cứu
		EOR		R1, R1, R1		    ; xoá R1 để lưu trữ tổng
		LDR		R2, Length		    ; khởi tạo biến đếm
		CMP		R2, #0		
		BEQ		Done			    ; bảng trống
LOOP
		LDR		R3, [R0]	    	; lấy dữ liệu
		CMP		R3, #0		
		BPL		Looptest	        ; bỏ qua nếu số dương hoặc bằng 0
		ADD		R1, R1, #1		    ; tăng biến đếm số âm	
LOOPTEST	
		ADD		R0, R0, #+4			; tăng con trỏ
		SUBS	R2, R2, #0x1	    ; giảm biến đếm với cờ Z	
    	BNE		Loop		        ; nếu cờ Z chưa bật, thực hiện lặp
DONE
		STR		R1, Result      	; nếu đã bật, hoàn thành, lưu kết quả
		SWI		&11	

		AREA	Data1, DATA

Table	DCD		&F1522040			; thêm vào bảng giá trị
		DCD		&7F611C22
		DCD		&80000242
TableEnd	DCD		0

		AREA	Data2, DATA
Length	DCW		(TablEnd - Table) / 4	; căn chỉnh
		ALIGN
Result	DCW		0

		END
