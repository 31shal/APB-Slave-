`timescale 1ns/1ps
`include "apb_intf.v";
module apb_test();
  logic clk, reset;
  apb_intf intf(clk,reset);
  apb_slave slave(.paddr(inff.paddr),.psel(psel),.penable(penable),.pwrite(pwrite),.pready(pready),.pwdata(pwdata),.prdata(prdata));
 initial begin
   reset = 1;
   clk =0;
   forever #5 clk = ~clk;
   reset = 0;
 end
  initial begin
    forever begin
    @posedge(clk)
    intf.addr<= $urandom();
    intf.wdata<=$urandom(); 
    intf.psel<=1;
    intf.penable<=0;
    intf.pwrite.addr<=32'b12;
     @posedge(clk);
     intf.penable <=1;
     #5;
      pwrite =1;
      #2;
      pwrite=0;
    end
  end
 /////// Second approach
  always@posedge(clk) begin
    intf.addr<= $urandom();
    intf.wdata<=$urandom(); 
    intf.psel<=1;
    intf.penable<=0;
    intf.pwrite.addr<=32'b12;
    repeat(1)@posedge(clk)
     intf.penable <=1;
     #5;
      pwrite =1;
      #2;
      pwrite=0;
    end
  
    
