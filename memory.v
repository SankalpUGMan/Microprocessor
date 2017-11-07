`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:34 11/07/2017 
// Design Name: 
// Module Name:    memory 
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
module memory(data_in, data_out, read_write, address);

 input [7:0] data_in;
 input read_write;
 input [4:0] address;
 output reg [7:0] data_out;
 reg [7:0] reg_array[31:0];
 wire index;
 
 always @(read_write)
 begin
 if (read_write == 1)
 begin
 reg_array[address] = data_in ;
 end
 if(read_write == 0)
 begin 
 data_out = reg_array[address];
 end
 end	
 
endmodule
