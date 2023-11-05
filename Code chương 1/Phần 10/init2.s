;	Khởi tạo ngăn xếp đơn giản

		TTL		Ch10Ex2
		AREA	Program, CODE, READONLY
		ENTRY

MAIN
		LDR		R1, Value1		    ; đưa giá trị vào các thanh ghi
		LDR		R2, Value2
		LDR		R3, Value3
		LDR		R4, Value4

		LDR		R7, =Data2		
		STMDB	R7, {R1 – R4}	

		SWI		&11			        ; hoàn thành

		AREA	Stack1, DATA
Value1	DCD	    0xFFFF
Value2	DCD	    0xDDDD
Value3	DCD	    0xAAAA
Value4	DCD	    0x3333

		AREA	Data2, DATA
Stack	%	    40			        ; đảo ngược 40 bytes bộ nhớ cho ngăn xếp
StackEnd
		DCD		0

		END
