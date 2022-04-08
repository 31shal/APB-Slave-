typedef enum{IDLE,SETUP,ACCESS) state;
module apb slave();
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 8;
input psel;
input penable;
input pwrite;
input preset;
input pclk;
  input[DATA_WIDTH-1:0] pwdata;
input [ADDR_width-1:0] Paddr;
output reg pready;
output reg prdata;
logic[DATA_WIDTH-1:0] mem[ADDR_WIDTH-1:0];
  always@(posedge clk) begin
    if(preset)begin
      pready <=1;
      psel<= 0;
      penable<= 0;
    for(i=0;i<ADDR_WIDTH;i++)
      mem[i]=i;
    end
    case(state)begin
      IDLE:begin
        if(psel && !penable)
        state<=SETUP;
  else
    state<=IDLE;
      end
      SETUP: begin
        if(psel && penable)
          state<= ACCESS;
         else
           state<= SETUP;
      end
      ACCESS: begin
        if(!pready)
          state<= ACCESS;
        if(pready && pwrite)begin
          mem[paddr] =pwdata;
          state<=SETUP;
        end
        if(pready && !pwrite)begin
          prdata =mem[paddr];
        end
      end
      default: state= IDLE;
      endcase
      endmodule   
          
