;	Chương trình con mẫu đơn giản
;   truyền biến vào chương trình đó trong thanh ghi

 		TTL 	Ch10Ex4
		AREA 	Program, CODE, READONLY
 		ENTRY

StackStart 		EQU 		0x9000
Main
 		LDRB 	R0, HDigit 		    ; lưu biến vào thanh ghi
 		BL 		Hexdigit		    ; liên kết nhánh
 		STRB	R0, AChar 		    ; lưu kết quả vào chương trình con
 		SWI 	&0 			        ; xuất ra bàn điều khiển
 		SWI 	&11 		    	; hoàn thành

;	=========================
; 	Chương trình con thập lục phân
;   =========================

;   Mục đích
; 	Chương trình con thập lục phân chuyển từ kí tự thập lục phân sang ký tự ASCII
;
;	Điều kiện ban đầu
; 	R0 chứa giá trị trong khoảng 00 … 0F

; 	Điều kiện cuối cùng
; 	R0 chứa các ký tự ASCII trong khoảng ‘0’…’9’ hoặc ‘A’…’F’
;
; 	Thanh đổi các thanh ghi
; 	Chỉ có R0
;
; 	Trường hợp mẫu
; 	Điều kiện ban đầu		R0 = 6
;	Điều kiện cuối cùng		R0 = 36 (‘

; 	Thập lục phân
		CMP 	R0, #0xA		    ; Kiểm tra xem có > 9 không
 		BLE 	Addz 			    ; nếu không chuyển đến tiếp theo
 		ADD 	R0, R0, #"A" - "0" - 0xA 	; thay đổi cho A…F

Addz
		ADD 	R0, R0, #"0" 	    ; chuyển qua ASCII
 		MOV 	PC, LR 		        ; quay lại từ chương trình con

 		AREA 	Data1, DATA
HDigit  DCB 	6 			        ; chữ số để chuyển đổi
AChar   DCB 	0 			        ; chứa ký tự ASCII

	    END
