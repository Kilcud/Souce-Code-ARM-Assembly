; 	Truyền dữ liệu 16 bit

		TTL 			16bitdatarans
		AREA	        Program, CODE, READONLY
		ENTRY

Main
		LDRB	        R1, Value			; tải giá trị được chuyển
		STR				R1, Result			; lưu trữ vào địa chỉ khác
		SWI				&11		
			
Value	DCW				&C123		        ; giá trị được chuyển
		ALIGN				        		; làm việc với giá trị 16-bit
Result	DCW				0					; lưu không gian
		END	
