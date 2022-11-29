module projectvga(
clk, 
rst, 
color, 
x, 
y, 
plot, 
VGA_R, 
VGA_G,
VGA_B,
VGA_HS,
VGA_VS,
VGA_BLANK,
VGA_SYNC,
VGA_CLK
);
input clk, rst;
input color;
input [9:0]x;
input [9:0]y;
input plot;
output [9:0]VGA_R;
output [9:0]VGA_G;
output [9:0]VGA_B;
output VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK;


	
vga_adapter my_vga_adapter(1'b1, clk, 3'b011, 9'd200, 8'd200, 1'b1, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK);
 
endmodule
