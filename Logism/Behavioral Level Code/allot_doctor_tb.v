`timescale 1ns/10ps
module testbench;
    reg start,clk;
    reg [1:0] query;
    wire [1:0] message;
    allot_doctor doctor(query,A,B,clk,start,message);             //Create an object of allot_doctor
    initial 
    begin
    	$monitor("                       15 seconds is equivalent to 300 time units\n                        message = 1 indicates doctor 1 allotted and message = 2 indicates doctor 2 allotted. Message = 3 indicates wait signal ");        
        clk = 1'b0;
        repeat (100);
        #10 clk = ~clk;                                     //Create clock 
    end 
    initial
    begin
        $dumpfile("behavioural.vcd");                            
        $dumpvars(0,doctor);
        #10                           
	start = 1'b1;                                          
        query = 2'b00;
        start = 1'b0;                                          
        $monitor("TIME : %d || INCOMING QUERY: %d || MESSAGE: %d",$time, query, message);    

        #100
        start = 1'b1;                                          
        query = 2'b11;
        start = 1'b0;                                          
        $monitor("TIME : %d || INCOMING QUERY: %d || MESSAGE: %d",$time, query, message);    

        #20
        start = 1'b1;                                          
        query = 2'b01;
        start = 1'b0;                                           
        $monitor("TIME : %d || INCOMING QUERY: %d || MESSAGE: %d",$time, query, message);    

        #20
        start = 1'b1;                                          
        query = 2'b00;
        start = 1'b0;                                          
        $monitor("TIME : %d || INCOMING QUERY: %d || MESSAGE: %d",$time, query, message);    
        
        #20
        start = 1'b1;                                          
        query = 2'b11;
        start = 1'b0;                                          
        $monitor("TIME : %d || INCOMING QUERY: %d || MESSAGE: %d",$time, query, message);    
        
        #500
        start = 1'b1;                                          
        query = 2'b11;
        start = 1'b0;                                          
        $monitor("TIME : %d || INCOMING QUERY: %d || MESSAGE: %d",$time, query, message);    
  
    end
endmodule 


