;	 Chương trình con tìm giai thừa của một số

 		TTL 	Ch10Ex6
 		AREA 	Program, CODE, READONLY
 		ENTRY

MAIN
 		LDR 	R0, Number 	        ; lấy số
 		BL 		Factor 		        ; nhánh liên kết
 		STR 	R0, FNum 		    ; lưu trữ giai thừa

 		SWI 	&11 			    ; hoàn thành


;	=========================
;   Chương trình con Factor
; 	=========================

; 	Mục đích
; 	Tìm giai thừa của một số bằng cách đệ quy
;
; 	Điều kiện ban đầu
; 	R0 chứa số cần tìm giai thừa
;
; 	Điều kiện ban đầu
; 	R0 = giai thừa của số đó
;
; 	Chỉ thay đổi các thanh ghi 
; 	R0 và R1 
;
; 	Trường hợp mẫu
; 	Điều kiện ban đầu
;	Number = 5
;
; 	Điều kiện cuối cùng
; 	FNum = 120 = 0x78

Factor
		STR 	R0, [R12], #4 	    ; đẩy vào ngăn xếp
 		STR 	R14, [R12], #4 	    ; đẩy địa chỉ quay lại
 		SUBS 	R0, R0, #1 		    ; lấy Number trừ đi 1
 		BNE 	F_Cont 		        ; chưa hoàn thành

 		MOV 	R0, #1 		        ; Factorial == 1
 		SUB 	R12, R12, #4 	    ; điều chỉnh con trỏ ngăn xếp
 		B 		Return 		        ; hoàn thành

F_Cont
 		BL 		Factor 		        ; nếu chưa hoàn thành, gọi lần nữa

Return
 		LDR 	R14, [R12], #-4 	; trở lại địa chỉ
     	LDR 	R1, [R12], #-4      ; tải lên R1 (không thể thực hiện MUL R0, R0, xxx)
 		MUL 	R0, R1, R0 		    ; nhân kết quả
 		MOV 	PC, LR 		        ;trở lại

 		AREA 	Data1, DATA
 		Number 	DCD 5 		        ; nhập số
 		FNum 	DCD 0 		        ; giai thừa
 		END
