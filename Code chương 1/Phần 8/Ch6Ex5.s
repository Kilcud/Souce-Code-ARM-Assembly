;	thiết lập bit chẵn lẻ trên một chuỗi kí tự
;	lưu trữ chuỗi đã sửa đổi trong Result

		TTL		Ch6Ex5

		AREA	Program, CODE, READONLY		
		ENTRY
		
Main
		ADR		R0, Data1		    ; tải địa chỉ bảng tra cứu
		ADR		R5, Pointer
		LDRB	R1, [R0], #1		; lưu độ dài chuỗi trong R1
		CMP		R1, #0		
		BEQ		Done			    ; bỏ qua nếu chiều dài là 0
MainLoop
		LDRB	R2, [R0], #1		; tải byte đầu tiên vào R2
		MOV		R6, R2		        ; sao chép kí tự ban đầu
		MOV		R2, R2, LSL #24	    ; thay đổi để làm việc với msb
		MOV		R3, #0		        ; bit đếm = 0
		MOV		R4, #7		        ; khởi tạo bộ đếm thay đổi

ParLoop	
		MOVS	R2, R2, LSL #1	    ; dịch chuyển trái
		BPL		DontAdd	            ; nếu msb không là 1 bit, phân nhánh
		ADD		R3, R3, #1		    ; nếu không, thêm vào bit đếm
DonAdd	
		SUBS	R4, R4, #1		    ; cập nhật biến đếm thay đổi
		BNE		ParLoop	            ; lặp nếu vẫn còn bit để kiểm tra
		TST		R3, #1		        ; biến chẵn?
		BEQ		Even			    ; nếu vậy, phân nhánh
		ORR		R6, R6, #0x80	    ; mặt khác lập biến chẵn lẻ
		STRB	R6, [R5], #1		; và lưu chuỗi được thay đổi
		B		Check	
Even	STRB	R6, [R5], #1	    ; lưu biến chưa thay đổi nếu là chẵn
Check	SUBS	R1, R1, #1		    ; giảm biến đếm kí tự
    	BNE		MainLoop		 

Done	SWI		&11
		
		AREA	Data1, DATA

Table	DCB		6                   ; bảng dữ liệu bắt đầu với byte chiều dài chuỗi
    	DCB		0x31			    ; chuỗi	
		DCB		0x32	
		DCB		0x33	
		DCB		0x34	
		DCB		0x35	
		DCB		0x36	

		AREA	Result, DATA
		ALIGN
Pointer	DCD		0			        ; lưu trữ cho kí tự chẵn lẻ

		END
