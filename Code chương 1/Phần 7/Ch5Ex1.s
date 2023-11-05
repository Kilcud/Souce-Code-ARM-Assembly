;	Thêm dãy các số 16-bit sử dụng bảng tra cứu địa chỉ

		TTL		Ch5Ex1
		AREA	Program, CODE, READONLY		
		ENTRY
		
MAIN
		LDR		R0, =Data1		    ; tải địa chỉ bảng tra cứu
		EOR		R1, R1, R1		    ; xoá R1 để lưu trữ tổng
		LDR		R2, Length		    ; khởi tạo biến đếm
LOOP
		LDR		R3, [R0]		    ; lấy dữ liệu
		ADD		R1, R1, R3		    ; cộng nó vào r1
		ADD		R0, R0, #+4		    ; tăng con trỏ
		SUBS	R2, R2, #0x1	    ; giảm biến đếm với cờ Z	
		BNE		Loop		        ; nếu cờ Z chưa bật, thực hiện lặp
		STR		R1, Result	        ; nếu không, kết thúc – lưu kết qu
		SWI		&11			
		
		AREA	DataTable, DATA				
		
Table	DCW		&2040			    ; thêm bảng giá trị	
		ALIGN					    ; căn chỉnh 32-bit
		DCW		&1C22		
		ALIGN		
		DCW		&0242	
		ALIGN			
TableEnd	DCD		0		
		
		AREA	Data2, DATA		
Length	DCW		(TablEnd - Table) / 4	; định dạng
		ALIGN					        ; đếm vòng lặp
Result	DCW			     0 			    ; lưu trữ kết quả

		END
