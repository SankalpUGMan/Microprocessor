`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:00 11/07/2017 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(address, load_number, opcode, addr1, addr2, addr3, flag, out, condition, program_counter_jump);

 input  [32:0] address;
 output [3:0] opcode;
 output [4:0] addr1;
 output [4:0] addr2; 
 output [4:0] addr3; 
 output [7:0] load_number;
 output [7:0] out;
 output [3:0] flag;
 output [1:0] condition;
 output [2:0] program_counter_jump;
 
 assign opcode[3:0] = address[31:28];
 assign cond[1:0] = address[27:26];
 assign program_counter_jump[2:0] = address[25:23];
 assign load_number[7:0] = address[22:15];
 assign addr3[4:0] = address[14:10];
 assign addr2[4:0] = address[9:5];
 assign addr1[4:0] = address[4:0];
 
 execution_unit eu(.opcode(opcode),.addr1(addr1),.addr2(addr2),.addr3(addr3),.load_number(load_number),.flag(flag),.out(out));

endmodule
