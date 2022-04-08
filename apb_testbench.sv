`include "apb_intf.v";
module apb_test();
  logic clk, reset;
  apb_intf intf(clk,reset);
  apn_slave slave(.paddr(inff.paddr),
              
