module allot_doctor(query,A,B,clk,start,message);
	input [1:0] query; 
	input A,B,clk,start;
	output reg [1:0] message;
	reg a = 1'b0;
	reg b = 1'b0;
	integer c_a = 0;
	integer c_b = 0;
	always@(negedge start)
	begin
		if(query == 2'b00)				
			if(a == 0)				
			begin
				message = 2'b01;	
				a = 1'b1;			
			end
			else
				message = 2'b11;	
		if(query == 2'b01)				
            		if(a == 0)				
			begin
                		message = 2'b01;	
				a = 1'b1;			
			end
            		else if(b == 0)			
			begin
                		message = 2'b10;	
				b = 1'b1;			
			end
			else 
				message = 2'b11;
		if(query == 2'b10)				
            		if(a == 0)				
			begin
                		message = 2'b01;	
				a = 1'b1;			
			end
            		else if(b == 0)			
			begin
                		message = 2'b10;	
				b = 1'b1;			
			end
			else 
				message = 2'b11;
		if(query == 2'b11)				
            		if(b == 0)			
			begin
                		message = 2'b10;	
				b = 1'b1;			
			end
			else 
				message = 2'b11;
	end
	always@(posedge clk)
	begin
	if(a == 1)
            c_a = c_a + 1;
        if(b == 1)
            c_b = c_b + 1;
        if(c_a == 15)
            a = 0;
        if(c_b == 15)
            b = 0;
	end
endmodule
