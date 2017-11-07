`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:05:22 11/07/2017 
// Design Name: 
// Module Name:    arithmetic_and_logic_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module arithmetic_and_logic_unit(opcode, a, b, flag, out, load_number);

 input[7:0] load_number;
 input [7:0] a;
 input [7:0] b;
 input [3:0] opcode;
 output reg [3:0] flag;
 output reg [7:0] out;
 reg [8:0] temp;
 
// 0000 no flag
// 0010 zero flag
//	0100 negative 
//	1000 carry

 always @(opcode)
	begin
		case(opcode)
			4'b0000 : begin
						 temp=a+b;
						 out=temp[7:0];
						 if(temp[8]==1) 
						 begin flag=4'b1000;end
						 else 
						 begin flag=4'b0000 ;end
						 $display("Addition operation");
			          end
						 
			4'b0001 : begin
						 temp=a-b;
						 out=temp[7:0];
						 if(a<b) 
						 begin flag=4'b0100; end
						 else if(a==b) 
						 flag=4'b0010; 
						 else 
						 flag=4'b0000;
					    $display("Subtraction operation");
			          end
						 
			4'b0010 : begin
						 out=a&b;
						 if(out==0) 
						 begin flag=4'b0010; end
						 $display("AND operation");
						 end
						 
			4'b0011 : begin
						 out=a|b;
						 if(out==0)
						 begin flag=4'b0010; end
						 $display("OR operation");
						 end
						
			4'b0100 : begin
						 out=a^b;
						 if(out==0) 
						 begin flag=4'b0010; end
						 $display("XOR operation");
						 end
							
			4'b0101 : begin
						 out=a<<1;
						 if(out==0) 
						 begin flag=4'b0010; end
						 $display("Left Shift operation");
						 end
					 	
			4'b0110 : begin
						 out=a>>1;
						 if(out==0) 
						 begin flag=4'b0010; end
						 $display("Right Shift operation");
						 end
				
	     4'b1110 : begin
						out = number;
						end			
		            endcase
	end			
						
endmodule

