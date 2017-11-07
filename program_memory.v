`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:24 11/07/2017 
// Design Name: 
// Module Name:    program_memory 
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
module program_memory(program_address_array, i0, i1, i2, i3, i4, i5, i6, i7, flag, out);

 input [255:0] program_address_array;
 output out;
 output flag;
 output i0;
 output i1 ;
 output i2 ;
 output i3 ;
 output i4;
 output i5  ;
 output i6;
 output i7;
 reg [31:0] temporary;
 integer program_counter;

 assign i0 = program_address_array[31:0];
 assign i1 = program_address_array[63:32];
 assign i2 = program_address_array[95:64];
 assign i3  = program_address_array[127:96];
 assign i4  = program_address_array[159:128];
 assign i5  = program_address_array[191:160];
 assign i6  = program_address_array[223:192];
 assign i7 = program_address_array[255:224];

 control_unit cu (.address(temporary),.flag(flag),.out(out));
 
 always @ (program_address_array[0])
 begin
 if(program_counter == 0)
 begin
 temporary = i0;
 program_counter = 1;
 end	
 if(temporary == 0)
 begin
 program_counter = 7;
 end
 
 if(program_counter == 1)
 begin
 temporary = i1;
 program_counter = 2;
 end	
 if(temporary == 0)
 begin
 program_counter = 7;
 end
 
 if(program_counter == 2)
 begin
 temporary = i2;
 program_counter = 3;
 end	
 if(temporary == 0)
 begin
 program_counter = 7;
 end
 
 if(program_counter == 3)
 begin
 temporary = i3;
 program_counter = 4;
 end	
 if(temporary == 0)
 begin
 program_counter = 7;
 end
 
 if(program_counter == 4)
 begin
 temporary = i4;
 program_counter = 5;
 end	
 if(temporary == 0)
 begin
 program_counter = 7;
 end
 
 if(program_counter == 5)
 begin
 temporary = i5;
 program_counter = 6;
 end	
 if(temporary == 0)
 begin
 program_counter = 7;
 end
 
 if(program_counter == 6)
 begin
 temporary = i6;
 program_counter = 7;
 end	
 if(temporary == 0)
 begin
 program_counter = 7;
 end
 
 if(program_counter == 7)
 begin
 temporary = i7;
 end	
 if(temporary == 0)
 begin
 program_counter = 7;
 end
 end 
 
endmodule
 