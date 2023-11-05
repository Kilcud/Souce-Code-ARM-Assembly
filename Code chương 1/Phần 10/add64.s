; 	Chương trình con cộng 64-bit

 		TTL 	Ch10Ex6
 		AREA 	Program, CODE, READONLY
 		ENTRY

Main
 		BL 	    Add64 		        ; nhánh liên kết
 		DCD 	Value1 		        ; địa chỉ tham số 1
 		DCD 	Value2 		        ; địa chỉ tham số 2

		SWI 	&11 			    ; hoàn thành


;	=========================
; 	Chương trình con Add64
; 	=========================

; 	Mục đích
; 	Cộng hai giá trị 64-bit
;
; 	Điều kiện ban đầu
; 	Hai tham số giá trị được truyền ngay tức thì
; 	sau lệnh gọi chương trình con
;
; 	Điều kiện cuối cùng
; 	Tổng hai tham số được trả lại R0 và R1
;
; 	Chỉ thay đổi các thanh ghi
; 	R0 và R1 
;
; 	Trường hợp mẫu
; 	Điều kiện ban đầu
; 	Tham số thứ nhất: para 1 = = &0420147AEB529CB8
; 	Tham số thứ hai: para 2 = = &3020EB8520473118
;
; 	Điều kiện cuối cùng
; 	R0 = &34410000
; 	R1 = &0B99CDD0

Add64
 		STMIA   R12, {R2, R3, R14}  ; lưu các thanh ghi vào ngăn xếp
 		MOV     R7, R12 			; sao chép con trỏ ngăn xếp
 		SUB 	R7, R7, #4 	        ; điều chỉnh để trỏ đến LSB của giá trị thứ hai
 		LDR 	R3, [R7], #-4 		; tải các byte liên tiếp
 		LDR 	R2, [R7], #-4
 		LDR 	R1, [R7], #-4
 		LDR 	R0, [R7], #-4

 		ADDS    R1, R1, R3 		    ; cộng các bytes LS và bật cờ C 
 		BCC 	Next 			    ; phân nhánh nếu cờ C chưa được bật
 		ADD 	R0, R0, #1 			; hoặc cộng thêm cờ C
NEXT
 		ADD 	R0, R0, R2 		    ; cộng các bytes MS
 		LDMIA 	R12, {R2, R3, R14} 	; lấy ra từ ngăn xếp
 		MOV 	PC, LR 			    ; và trở về

 		AREA 	Data1, DATA
Value1 	DCD     &0420147A, &EB529CB8 	; số thứ nhất
Value2 	DCD     &3020EB85, &20473118 	; số thứ hai
		END
