`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:03:31 11/07/2017 
// Design Name: 
// Module Name:    execution_unit 
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
module execution_unit(a, b, opcode, load_number, flag, out, addr1, addr2, addr3);

 output  [7:0] a;
 output  [7:0] b;
 input   [3:0] opcode;
 input   [4:0] addr1;
 input   [4:0] addr2;
 input   [4:0] addr3;
 input   [7:0] load_number;
 output  [3:0] flag;
 output  [7:0] out; 
 reg c ;
 reg [4:0] address;
 reg [7:0] temp1;
 reg [7:0] temp2 ;

 memory m(.data_out(a),.read_write(c),.address(address),.data_in(out));
 
 always @(opcode)
 begin
 c = 0;
 address = addr1;
 temp1 = a;
 address = addr2;
 temp2 = a;
 c = 1;
 end		
 
 arithmetic_and_logic_unit alu(.opcode(opcode),.a(temp1),.b(temp2),.flag(flag),.out(out),.load_number(load_number));
		
endmodule		