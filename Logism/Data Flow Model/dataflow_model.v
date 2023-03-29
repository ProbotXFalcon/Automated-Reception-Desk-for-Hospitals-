
module dataflow_model(query,A,B,clk,start,msg);
	reg a,b;
	integer c_a = 0;
	integer c_b = 0;
	input [1:0]query;
	input clk,start;	
	output reg [1:0]msg;
	output reg A,B;
	always@(negedge start)
	begin
		a=A; 										
		b=B;												
		msg[1]= ((~query[1])|(~query[0]))&(~a);
		msg[0]= (~b)&((a&query[0])|(a&query[1])|(query[0]&query[1]));
	end
	always@(posedge clk)
	begin	
		c_b=(msg==2'b01)?c_b+1:c_b+1;		
		B=(c_b>5)?1:0;								
		c_b=(c_b==15)?0:c_b;					
	end	
	always@(posedge clk)
	begin
		c_a=(msg==2'b10)?c_a+1:c_a+1;		
		A=(c_a<10)?1:0;								
		c_a=(c_a==15)?0:c_a;					
	end
endmodule
