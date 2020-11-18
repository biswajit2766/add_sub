// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module adder_sub_tb;
  reg[1:0] a;
  reg[1:0] b;
  reg add_sub;
  wire[1:0] o;
  wire c;
  
  adder_sub UUT(
    .a(a),
    .b(b),
    .add_sub(add_sub),
    .o(o),
    .c(c));
  
  initial begin
    a = 2'b0;
    b = 2'b1;
    add_sub = 1'b0;
    
    fork
      forever begin
        #50;
        a = a + 1'd1;
      end
      
      forever begin
        #200;
        b = b + 1'd1;
      end
      
      forever begin
        #800;
        add_sub = add_sub + 1'd1;
      end
    join
  end
  
  time runtime = 1600;
  
  initial begin
    #runtime;
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, adder_sub_tb);
  end
  
endmodule