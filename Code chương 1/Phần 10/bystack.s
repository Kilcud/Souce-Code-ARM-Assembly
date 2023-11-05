; Chương trình con phức tạp hơn
; truyền các biến vào chương trình sử dụng ngăn xếp

 	TTL 		Ch10Ex5
 	AREA 	Program, CODE, READONLY
 	ENTRY

StackStart 	EQU 	0x9000          ; khai báo vị trí đầu ngăn xếp ở đâu
Mask 	EQU 	0x0000000F 	        ; bit mặt nạ che đi nibble thấp hơn

Main
 	LDR 	R7, =StackStart 	; đỉnh ngăn xếp = 9000
 	LDR     R0, Number 		; tải số vào thanh ghi
 	LDR     R1, =String 		; tải địa chỉ vào chuỗi
 	STR     R1, [R7], #-4 		; và lưu trữ nó
 	STR     R0, [R7], #-4 		; lưu số vào ngăn xếp
 	BL      Binhex 			; nhánh liên kết
 	SWI     &11 			; hoàn thành

; =========================
; Chương trình con Binhex
; =========================

; 		Mục đích
; 		Binhex chuyển giá trị 16-bit sang kí tự ASCII
;
; 		Điều kiện ban đầu
; 		Tham số đầu tiên trong ngăn xếp là giá trị
; 		Tham số thứ hai là địa chỉ của chuỗi
;
; 		Điều kiện cuối cùng
; 		Chuỗi HEX chiếm 4 bytes mở đầu với
; 		địa chỉ được truyền như tham số thứ hai
;
; 		Thay đổi thanh ghi
; 		Không thanh ghi nào bị ảnh hưởng
;
; 		Trường hợp mẫu
; 		Điều kiện ban đầu		đỉnh ngăn xếp:	4CD0
; 						địa chỉ của chuỗi
; 		Điều kiện cuối:		Chuỗi ‘4’’C’’D’’0’ trong ASCII
; 						Chiếm bộ nhớ

Binhex
 	MOV     R8, R7		        ; lưu con trỏ ngăn xếp
 	STMDA   R7, {R0-R6,R14}         ; đẩy nội dung R0 đến R6 và LR trên ngăn xếp
 	MOV     R1, #4 		        ; khởi tạo bộ đếm
 	ADD     R7, R7, #4 		; điều chỉnh con trỏ
 	LDR     R2, [R7], #4 		; lấy số
 	LDR     R4, [R7] 		; lấy địa chỉ của chuỗi
 	ADD     R4, R4, #4		; di chuyển qua điểm cuối nơi chuỗi được lưu trữ
LOOP
 	MOV     R0, R2 		        ; sao chép số
 	AND     R0, R0, #Mask 	        ; lấy nibble nhỏ hơn
 	BL      Hexdigit 		; chuyển qua ASCII
 	STRB    R0, [R4], #-1 	        ; lưu trữ nó
 	MOV     R2, R2, LSR #4 	        ; chuyển sang nibble tiếp theo
	SUBS    R1, R1, #1 		; giảm bộ đếm
 	BNE     Loop 			; lặp trong khi vẫn còn các phần tử

 	LDMDA   R8, {R0-R6,R14}         ; lưu trữ cácthanh ghi
	MOV     PC, LR 		        ; trở về từ chương trình con

; =========================
; Chương trình con Hexdigit
; =========================

; 		Mục đích
; 		Hexdigit chuyển chữ số hex sang kí tự ASCII
;
; 		Điều kiện ban đầu
; 		R0 chứa giá trị trong khoảng 00 … 0F
;
; 		Điều kiện cuối cùng
; 		R0 chứa kí tự ASCII trong khoảng ‘0’ … ’9’ hoặc ‘A’ … ’F’
;
; 		Chỉ thay đổi thanh ghi
; 		R0
;
; 		Trường hợp mẫu
; 		Điều kiện ban đầu		R0 = 6
; 		Điều kiện cuối cùng	R0 = 36 (’6’)

Hexdigit
	CMP     R0, #0xA 		; kiểm tra số có trong đoạn [0; 9]?
 	BLE     Addz 			; nếu có, thực hiện rẽ nhánh
 	ADD     R0, R0, #"A" - "0" - 0xA        ; thay đổi cho A … F

ADDZ
 	ADD 	R0, R0, #"0" 	        ; chuyển qua ASCII
 	MOV     PC, LR 		        ; trở về từ chương trình con

 	AREA    Data1, DATA
NUMBER 	DCD 	&4CD0 	                ; số để chuyển đổi
STRING 	DCB 	4, 0 		        ; đếm chuỗi để đưa ra kết quả

		END
