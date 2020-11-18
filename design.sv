// Code your design here
`timescale 1ns/1ps

module adder_sub(
  input wire[1:0] a,
  input wire[1:0] b,
  input wire add_sub,
  output reg[1:0] o,
  output reg c
);
  reg[1:0] b_to_add;
  
  always @ (b, add_sub, b_to_add) begin
    b_to_add = b ^ {2{add_sub}};
  end
  
  always @ (a, b_to_add, add_sub) begin
    {c, o} = a + b_to_add + add_sub;
  end
endmodule