typedef enum{IDLE,SETUP,ACCESS) state;
module apb slave();
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 8;
input psel;
input penable;
input pwrite;
input preset;
input pclk;
input[DATA_WIDTH-1:0] Pwdata;
input [ADDR_width-1:0] Paddr;
output reg pready;
output reg prdata;
l
