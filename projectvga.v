module projectvga(
clk, 
rst,
plot, 
VGA_R, 
VGA_G,
VGA_B,
VGA_HS,
VGA_VS,
VGA_BLANK,
VGA_SYNC,
VGA_CLK,
p1pos1,p1pos2,p1pos3, p1pos4,p1pos5,p1pos6,p1pos7,p1pos8,p1pos9,
p2pos1,p2pos2,p2pos3, p2pos4,p2pos5,p2pos6,p2pos7,p2pos8,p2pos9,
auto,
automedium,
autoeasy
);
input clk, rst;
input plot;
output [9:0]VGA_R;
output [9:0]VGA_G;
output [9:0]VGA_B;
output VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK;
     input p1pos1,p1pos2,p1pos3, p1pos4,p1pos5,p1pos6,p1pos7,p1pos8,p1pos9;
	  input p2pos1,p2pos2,p2pos3, p2pos4,p2pos5,p2pos6,p2pos7,p2pos8,p2pos9;
	  input auto, automedium, autoeasy; //AI Difficulties

	
vga_adapter my_vga_adapter(1'b1, clk, color, x, y, 1'b1, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK);
 
reg[15:0]S;
reg[15:0]NS;
reg[8:0]xcount;
reg[8:0]ycount;
reg plotchange;
reg[9:0]x;
reg[9:0]y;
reg[2:0]color;
reg [8:0]xtable;
reg [8:0]ytable;
reg tablechange;
reg [8:0]xtable2;
reg [8:0]ytable2;
reg tablechange2;
reg [8:0]xtable3;
reg [8:0]ytable3;
reg tablechange3;
reg [8:0]xtable4;
reg [8:0]ytable4;
reg tablechange4;

reg [8:0]xhort;
reg [8:0]xvert;
reg xchange;
reg [8:0]xhort2;
reg [8:0]xvert2;
reg xchange2;

reg [8:0]xsquare;
reg [8:0]ysquare;
reg changesquare;

reg [8:0]xhort3;
reg [8:0]xvert3;
reg xchange3;
reg [8:0]xhort4;
reg [8:0]xvert4;
reg xchange4;

reg [8:0]xsquare2;
reg [8:0]ysquare2;
reg changesquare2;

reg [8:0]xhort5;
reg [8:0]xvert5;
reg xchange5;
reg [8:0]xhort6;
reg [8:0]xvert6;
reg xchange6;

reg [8:0]xsquare3;
reg [8:0]ysquare3;
reg changesquare3;


reg [8:0]xhort7;
reg [8:0]xvert7;
reg xchange7;
reg [8:0]xhort8;
reg [8:0]xvert8;
reg xchange8;

reg [8:0]xsquare4;
reg [8:0]ysquare4;
reg changesquare4;

reg [8:0]xhort9;
reg [8:0]xvert9;
reg xchange9;
reg [8:0]xhort10;
reg [8:0]xvert10;
reg xchange10;

reg [8:0]xsquare5;
reg [8:0]ysquare5;
reg changesquare5;

reg [8:0]xhort11;
reg [8:0]xvert11;
reg xchange11;
reg [8:0]xhort12;
reg [8:0]xvert12;
reg xchange12;


reg [8:0]xsquare6;
reg [8:0]ysquare6;
reg changesquare6;

reg [8:0]xhort13;
reg [8:0]xvert13;
reg xchange13;
reg [8:0]xhort14;
reg [8:0]xvert14;
reg xchange14;

reg [8:0]xsquare7;
reg [8:0]ysquare7;
reg changesquare7;

reg [8:0]xhort15;
reg [8:0]xvert15;
reg xchange15;
reg [8:0]xhort16;
reg [8:0]xvert16;
reg xchange16;

reg [8:0]xsquare8;
reg [8:0]ysquare8;
reg changesquare8;

reg [8:0]xhort17;
reg [8:0]xvert17;
reg xchange17;
reg [8:0]xhort18;
reg [8:0]xvert18;
reg xchange18;

reg [8:0]xsquare9;
reg [8:0]ysquare9;
reg changesquare9;
reg turn;
reg turn2;

reg [1:0]p1,p2,p3,p4,p5,p6,p7,p8,p9;


parameter initxtable=64'd110,
			 initxtable2=64'd210,
			 initytable3=64'd75,
			 initytable4=64'd155,
			 
			 initxhort = 64'd30,
			 initxvert = 64'd13,
			 initxhort2 = 64'd80, 
			 initxvert2 = 64'd13, //first x 
			 
			 initxsquare= 64'd30, 
			 initysquare= 64'd13,  //first square 
			 
			 initxhort3 = 64'd137,
			 initxvert3 = 64'd13,
			 initxhort4 = 64'd187,
			 initxvert4 = 64'd13, //2nd X
			 
			 initxsquare2= 64'd137,
			 initysquare2 = 64'd13, //2nd square
			 
			 initxhort5 = 64'd244,
			 initxvert5 = 64'd13,
			 initxhort6 = 64'd294,
			 initxvert6 = 64'd13, //3rd X 
			 
			 initxsquare3 = 64'd244,
			 initysquare3 = 64'd13 , //3rd square
			 
			 initxhort7 = 64'd30,
			 initxvert7 = 64'd93,
			 initxhort8 = 64'd80, 
			 initxvert8 = 64'd93, //4th x 
			 
			 initxsquare4= 64'd30, 
			 initysquare4= 64'd93,  //4th square 
			 
			 initxhort9 = 64'd137,
			 initxvert9 = 64'd93,
			 initxhort10 = 64'd187, 
			 initxvert10 = 64'd93, //5th x 
			 
			 	 
			 initxsquare5= 64'd137, 
			 initysquare5= 64'd93,  //5th square 
			 
			 initxhort11 = 64'd244,
			 initxvert11 = 64'd93,
			 initxhort12 = 64'd294, 
			 initxvert12 = 64'd93, //6th x 
			 
			 initxsquare6= 64'd244, 
			 initysquare6= 64'd93,  //6th square 
			 
			 initxhort13 = 64'd30,
			 initxvert13 = 64'd173,
			 initxhort14 = 64'd80, 
			 initxvert14 = 64'd173, //7th x 
			
			 initxsquare7= 64'd30, 
			 initysquare7= 64'd173,  //7th square 
			 
			 initxhort15 = 64'd137,
			 initxvert15 = 64'd173,
			 initxhort16 = 64'd187, 
			 initxvert16 = 64'd173, //8th x 
			 
			 initxsquare8= 64'd137, 
			 initysquare8= 64'd173,  //8th square 
			
			 initxhort17 = 64'd244,
			 initxvert17 = 64'd173,
			 initxhort18 = 64'd294, 
			 initxvert18 = 64'd173, //9th x 
			 
			 initxsquare9= 64'd244, 
			 initysquare9= 64'd173;  //9th square 
			 
			 
			 
parameter START=20'd0, CHANGEPIX=20'd1, MOVEX=20'd2, CHECKY=20'd3, MOVEY=20'd4, DRAW=20'd5,
			 STARTTABLE=20'd6, CHANGEPIXS=20'd7, MOVEHORTLEG=20'd8, CHECKYLEG=20'd9, MOVEYLEG=20'd10, DRAWTABLE=20'd11, //first vert. leg
			 STARTTABLE2=20'd12, CHANGEPIXS2=20'd13, MOVEHORTLEG2=20'd14, CHECKYLEG2=20'd15, MOVEYLEG2=20'd16, DRAWTABLE2=20'd17, //second vert. leg
			 STARTTABLE3=20'd18, CHANGEPIXS3=20'd19, MOVEHORTLEG3=20'd20, CHECKYLEG3=20'd21, MOVEYLEG3=20'd22, DRAWTABLE3=20'd23, //fist hort. leg
			 STARTTABLE4=20'd24, CHANGEPIXS4=20'd25, MOVEHORTLEG4=20'd26, CHECKYLEG4=20'd27, MOVEYLEG4=20'd28, DRAWTABLE4=20'd29, //second hort. leg
			 
			 STARTX=20'd30, CHANGEX=20'd31, MOVEXHORT=20'd32, CHECKXVERT= 20'd33, MOVEXVERT=20'd34, DRAWX=20'd35, //make pos1 1st x slash
			 STARTX2=20'd36, CHANGEX2=20'd37, MOVEXHORT2=20'd38, CHECKXVERT2= 20'd39, MOVEXVERT2=20'd40, DRAWX2=20'd41, //make pos1 2nd x slash 
			 
			 STARTSQUARE=20'd42, CHANGESQUARE=20'd43, MOVEXSQUARE=20'd44, CHECKYSQUARE=20'd45, MOVEYSQUARE=20'd46, DRAWSQUARE=20'd47, // make pos1 square
			 
			 STARTX3=20'd48, CHANGEX3=20'd49, MOVEXHORT3=20'd50, CHECKXVERT3= 20'd51, MOVEXVERT3=20'd52, DRAWX3=20'd53, //make pos2 1st x slash
			 STARTX4=20'd54, CHANGEX4=20'd55, MOVEXHORT4=20'd56, CHECKXVERT4= 20'd57, MOVEXVERT4=20'd58, DRAWX4=20'd59, //make pos2 2nd x slash 
			 
			 STARTSQUARE2=20'd60, CHANGESQUARE2=20'd61, MOVEXSQUARE2=20'd62, CHECKYSQUARE2=20'd63, MOVEYSQUARE2=20'd64, DRAWSQUARE2=20'd65, // make pos2 square
			 
			 PLAYERTURN=20'd66, PLAYERCHOICE=20'd67, //player1 enable to see what move they make 
			 
			 COMPUTERTURN=20'd68, COMPUTERCHOICE=20'd69, //player2 enable to see what move they make
			 
			  
			 STARTX5=20'd70, CHANGEX5=20'd71, MOVEXHORT5=20'd72, CHECKXVERT5= 20'd73, MOVEXVERT5=20'd74, DRAWX5=20'd75, //make pos3 1st x slash
			 STARTX6=20'd76, CHANGEX6=20'd77, MOVEXHORT6=20'd78, CHECKXVERT6= 20'd79, MOVEXVERT6=20'd80, DRAWX6=20'd81, //make pos3 2nd x slash 
			 
			 
			 STARTSQUARE3=20'd82, CHANGESQUARE3=20'd83, MOVEXSQUARE3=20'd84, CHECKYSQUARE3=20'd85, MOVEYSQUARE3=20'd86, DRAWSQUARE3=20'd87, // make pos3 square
			 
			 PLAYERCHOICE2=20'd88,PLAYERCHOICE3=20'd89,PLAYERCHOICE4=20'd90,PLAYERCHOICE5=20'd91,PLAYERCHOICE6=20'd92,PLAYERCHOICE7=20'd93,PLAYERCHOICE8=20'd94,PLAYERCHOICE9=20'd95,
			 
			 COMPUTERCHOICE2=20'd96, COMPUTERCHOICE3=20'd97, COMPUTERCHOICE4=20'd98, COMPUTERCHOICE5=20'd99, COMPUTERCHOICE6=20'd100, COMPUTERCHOICE7=20'd101, COMPUTERCHOICE8=20'd102, COMPUTERCHOICE9=20'd103,
			 
			 
			 	  
			 STARTX7=20'd104, CHANGEX7=20'd105, MOVEXHORT7=20'd106, CHECKXVERT7= 20'd107, MOVEXVERT7=20'd108, DRAWX7=20'd109, //make pos4 1st x slash
			 STARTX8=20'd110, CHANGEX8=20'd111, MOVEXHORT8=20'd112, CHECKXVERT8= 20'd113, MOVEXVERT8=20'd114, DRAWX8=20'd115, //make pos4 2nd x slash 
			 
			  
			 STARTSQUARE4=20'd116, CHANGESQUARE4=20'd117, MOVEXSQUARE4=20'd118, CHECKYSQUARE4=20'd119, MOVEYSQUARE4=20'd120, DRAWSQUARE4=20'd121, // make pos4 square
			 
			 
			 STARTX9=20'd122, CHANGEX9=20'd123, MOVEXHORT9=20'd124, CHECKXVERT9= 20'd125, MOVEXVERT9=20'd126, DRAWX9=20'd127, //make pos5 1st x slash
			 STARTX10=20'd128, CHANGEX10=20'd129, MOVEXHORT10=20'd130, CHECKXVERT10= 20'd131, MOVEXVERT10=20'd132, DRAWX10=20'd133, //make pos5 2nd x slash
			 
			 STARTSQUARE5=20'd134, CHANGESQUARE5=20'd135, MOVEXSQUARE5=20'd136, CHECKYSQUARE5=20'd137, MOVEYSQUARE5=20'd138, DRAWSQUARE5=20'd139, //make pos5 square
			 
			 
			 STARTX11=20'd140, CHANGEX11=20'd141, MOVEXHORT11=20'd142, CHECKXVERT11= 20'd143, MOVEXVERT11=20'd144, DRAWX11=20'd145, //make pos6 1st x slash
			 STARTX12=20'd146, CHANGEX12=20'd147, MOVEXHORT12=20'd148, CHECKXVERT12= 20'd149, MOVEXVERT12=20'd150, DRAWX12=20'd151, //make pos6 2nd x slash
			
			 
			 STARTSQUARE6=20'd152, CHANGESQUARE6=20'd153, MOVEXSQUARE6=20'd154, CHECKYSQUARE6=20'd155, MOVEYSQUARE6=20'd156, DRAWSQUARE6=20'd157, //make pos6 square
			 
			 
			 STARTX13=20'd158, CHANGEX13=20'd159, MOVEXHORT13=20'd160, CHECKXVERT13= 20'd161, MOVEXVERT13=20'd162, DRAWX13=20'd163, //make pos7 1st x slash
			 STARTX14=20'd164, CHANGEX14=20'd165, MOVEXHORT14=20'd166, CHECKXVERT14= 20'd167, MOVEXVERT14=20'd168, DRAWX14=20'd169, //make pos7 2nd x slash
			 
			 
			 STARTSQUARE7=20'd170, CHANGESQUARE7=20'd171, MOVEXSQUARE7=20'd172, CHECKYSQUARE7=20'd173, MOVEYSQUARE7=20'd174, DRAWSQUARE7=20'd175, //make pos7 square
			
			 
			 STARTX15=20'd176, CHANGEX15=20'd177, MOVEXHORT15=20'd178, CHECKXVERT15= 20'd179, MOVEXVERT15=20'd180, DRAWX15=20'd181, //make pos8 1st x slash
			 STARTX16=20'd182, CHANGEX16=20'd183, MOVEXHORT16=20'd184, CHECKXVERT16= 20'd185, MOVEXVERT16=20'd186, DRAWX16=20'd187, //make pos8 2nd x slash	
			 
			 STARTSQUARE8=20'd188, CHANGESQUARE8=20'd189, MOVEXSQUARE8=20'd190, CHECKYSQUARE8=20'd191, MOVEYSQUARE8=20'd192, DRAWSQUARE8=20'd193, //make pos8 square
			 
			  
			 STARTX17=20'd194, CHANGEX17=20'd195, MOVEXHORT17=20'd196, CHECKXVERT17= 20'd197, MOVEXVERT17=20'd198, DRAWX17=20'd199, //make pos9 1st x slash
			 STARTX18=20'd200, CHANGEX18=20'd201, MOVEXHORT18=20'd202, CHECKXVERT18= 20'd203, MOVEXVERT18=20'd204, DRAWX18=20'd205, //make pos9 2nd x slash	
			 
			
			 STARTSQUARE9=20'd206, CHANGESQUARE9=20'd207, MOVEXSQUARE9=20'd208, CHECKYSQUARE9=20'd209, MOVEYSQUARE9=20'd210, DRAWSQUARE9=20'd211, //make pos9 square
			 
			 PLAYERWIN=20'd212, //Player win feature 
			 
			 COMPUTERWIN=20'd213, //computer or player2 win feauture
			 
			 COMPUTERCHOICEAUTO=20'd214; //AI choice

always@(posedge clk or negedge rst) begin
if(rst==1'b0)
S<=START;
else
S<=NS;
end

always@(*) begin
case(S)
START:if(rst==1'b0)
		NS = START;
		else
		NS = DRAW;
DRAW: NS = CHANGEPIX;
CHANGEPIX: if (xcount < 9'd320)
			  NS = MOVEX;
			  else 
			  NS = CHECKY;
MOVEX: NS = DRAW;
CHECKY: if(ycount < 9'd240)
		  NS = MOVEY;
		  else 
		  NS = STARTTABLE;
MOVEY: NS = DRAW;


STARTTABLE:if(rst==1'b0)
		NS = STARTTABLE;
		else
		NS = DRAWTABLE;
DRAWTABLE: NS = CHANGEPIXS;
CHANGEPIXS: if (xtable < 9'd5)
			  NS = MOVEHORTLEG;
			  else
			  NS = CHECKYLEG;
MOVEHORTLEG: NS = DRAWTABLE;
CHECKYLEG: if(ytable < 9'd240)
		  NS = MOVEYLEG;
		  else 
		  NS = STARTTABLE2;
MOVEYLEG: NS = DRAWTABLE;



STARTTABLE2:if(rst==1'b0)
		NS = STARTTABLE2;
		else
		NS = DRAWTABLE2;
DRAWTABLE2: NS = CHANGEPIXS2;
CHANGEPIXS2: if (xtable2 < 9'd5)
			  NS = MOVEHORTLEG2;
			  else 
			  NS = CHECKYLEG2;
MOVEHORTLEG2: NS = DRAWTABLE2;
CHECKYLEG2: if(ytable2 < 9'd240)
		  NS = MOVEYLEG2;
		  else 
		  NS = STARTTABLE3;
MOVEYLEG2: NS = DRAWTABLE2;


STARTTABLE3:if(rst==1'b0)
		NS = STARTTABLE3;
		else
		NS = DRAWTABLE3;
DRAWTABLE3: NS = CHANGEPIXS3;
CHANGEPIXS3: if (xtable3 < 9'd320)
			  NS = MOVEHORTLEG3;
			  else 
			  NS = CHECKYLEG3;
MOVEHORTLEG3: NS = DRAWTABLE3;
CHECKYLEG3: if(ytable3 < 9'd5)
		  NS = MOVEYLEG3;
		  else 
		  NS = STARTTABLE4;
MOVEYLEG3: NS = DRAWTABLE3;



STARTTABLE4:if(rst==1'b0)
		NS = STARTTABLE4;
		else
		NS = DRAWTABLE4;
DRAWTABLE4: NS = CHANGEPIXS4;
CHANGEPIXS4: if (xtable4 < 9'd320)
			  NS = MOVEHORTLEG4;
			  else 
			  NS = CHECKYLEG4;
MOVEHORTLEG4: NS = DRAWTABLE4;
CHECKYLEG4: if(ytable4 < 9'd5)
		  NS = MOVEYLEG4;
		  else 
		  NS = PLAYERTURN; //change from STARTX
MOVEYLEG4: NS = DRAWTABLE4;


STARTX:if(rst==1'b0)
		NS = STARTX;
		else
		NS = DRAWX;
DRAWX: NS = CHANGEX;
CHANGEX: if (xhort < 9'd50)
			  NS = MOVEXHORT;
			  else 
			  NS = CHECKXVERT;
MOVEXHORT: NS = DRAWX;
CHECKXVERT: if(xvert < 9'd50)
		  NS = MOVEXVERT;
		  else 
		  NS = STARTX2;
MOVEXVERT: NS = DRAWX;



STARTX2:if(rst==1'b0)
		NS = STARTX2;
		else
		NS = DRAWX2;
DRAWX2: NS = CHANGEX2;
CHANGEX2: if (xhort2 < 9'd50)
			  NS = MOVEXHORT2;
			  else 
			  NS = CHECKXVERT2;
MOVEXHORT2: NS = DRAWX2;
CHECKXVERT2: if(xvert2 < 9'd50)
		  NS = MOVEXVERT2;
		  else 
		  //NS = COMPUTERTURN; //should be STARTSQUARE
		  NS = PLAYERCHOICE2;
MOVEXVERT2: NS = DRAWX2;


STARTSQUARE:if(rst==1'b0)
		NS = STARTSQUARE;
		else
		NS = DRAWSQUARE;
DRAWSQUARE: NS = CHANGESQUARE;
CHANGESQUARE: if (xsquare < 9'd50)
			  NS = MOVEXSQUARE;
			  else 
			  NS = CHECKYSQUARE;
MOVEXSQUARE: NS = DRAWSQUARE;
CHECKYSQUARE: if(ysquare < 9'd50)
		  NS = MOVEYSQUARE;
		  else 
		  NS = COMPUTERCHOICE2;
MOVEYSQUARE: NS = DRAWSQUARE;


STARTX3:if(rst==1'b0)
		NS = STARTX3;
		else
		NS = DRAWX3;
DRAWX3: NS = CHANGEX3;
CHANGEX3: if (xhort3 < 9'd50)
			  NS = MOVEXHORT3;
			  else 
			  NS = CHECKXVERT3;
MOVEXHORT3: NS = DRAWX3;
CHECKXVERT3: if(xvert3 < 9'd50)
		  NS = MOVEXVERT3;
		  else 
		  NS = STARTX4;
MOVEXVERT3: NS = DRAWX3;



STARTX4:if(rst==1'b0)
		NS = STARTX4;
		else
		NS = DRAWX4;
DRAWX4: NS = CHANGEX4;
CHANGEX4: if (xhort4 < 9'd50)
			  NS = MOVEXHORT4;
			  else 
			  NS = CHECKXVERT4;
MOVEXHORT4: NS = DRAWX4;
CHECKXVERT4: if(xvert4 < 9'd50)
		  NS = MOVEXVERT4;
		  else 
		  NS = PLAYERCHOICE3;
MOVEXVERT4: NS = DRAWX4;


STARTSQUARE2:if(rst==1'b0)
		NS = STARTSQUARE2;
		else
		NS = DRAWSQUARE2;
DRAWSQUARE2: NS = CHANGESQUARE2;
CHANGESQUARE2: if (xsquare2 < 9'd50)
			  NS = MOVEXSQUARE2;
			  else 
			  NS = CHECKYSQUARE2;
MOVEXSQUARE2: NS = DRAWSQUARE2;
CHECKYSQUARE2: if(ysquare2 < 9'd50)
		  NS = MOVEYSQUARE2;
		  else 
		  NS = COMPUTERCHOICE3;
MOVEYSQUARE2: NS = DRAWSQUARE2;


STARTX5:if(rst==1'b0)
		NS = STARTX5;
		else
		NS = DRAWX5;
DRAWX5: NS = CHANGEX5;
CHANGEX5: if (xhort5 < 9'd50)
			  NS = MOVEXHORT5;
			  else 
			  NS = CHECKXVERT5;
MOVEXHORT5: NS = DRAWX5;
CHECKXVERT5: if(xvert5 < 9'd50)
		  NS = MOVEXVERT5;
		  else 
		  NS = STARTX6;
MOVEXVERT5: NS = DRAWX5;



STARTX6:if(rst==1'b0)
		NS = STARTX6;
		else
		NS = DRAWX6;
DRAWX6: NS = CHANGEX6;
CHANGEX6: if (xhort6 < 9'd50)
			  NS = MOVEXHORT6;
			  else 
			  NS = CHECKXVERT6;
MOVEXHORT6: NS = DRAWX6;
CHECKXVERT6: if(xvert6 < 9'd50)
		  NS = MOVEXVERT6;
		  else 
		  NS = PLAYERCHOICE4;
MOVEXVERT6: NS = DRAWX6;



STARTSQUARE3:if(rst==1'b0)
		NS = STARTSQUARE3;
		else
		NS = DRAWSQUARE3;
DRAWSQUARE3: NS = CHANGESQUARE3;
CHANGESQUARE3: if (xsquare3 < 9'd50)
			  NS = MOVEXSQUARE3;
			  else 
			  NS = CHECKYSQUARE3;
MOVEXSQUARE3: NS = DRAWSQUARE3;
CHECKYSQUARE3: if(ysquare3 < 9'd50)
		  NS = MOVEYSQUARE3;
		  else 
		  NS = COMPUTERCHOICE4;
MOVEYSQUARE3: NS = DRAWSQUARE3;


STARTX7:if(rst==1'b0)
		NS = STARTX7;
		else
		NS = DRAWX7;
DRAWX7: NS = CHANGEX7;
CHANGEX7: if (xhort7 < 9'd50)
			  NS = MOVEXHORT7;
			  else 
			  NS = CHECKXVERT7;
MOVEXHORT7: NS = DRAWX7;
CHECKXVERT7: if(xvert7 < 9'd50)
		  NS = MOVEXVERT7;
		  else 
		  NS = STARTX8;
MOVEXVERT7: NS = DRAWX7;



STARTX8:if(rst==1'b0)
		NS = STARTX8;
		else
		NS = DRAWX8;
DRAWX8: NS = CHANGEX8;
CHANGEX8: if (xhort8 < 9'd50)
			  NS = MOVEXHORT8;
			  else 
			  NS = CHECKXVERT8;
MOVEXHORT8: NS = DRAWX8;
CHECKXVERT8: if(xvert8 < 9'd50)
		  NS = MOVEXVERT8;
		  else 
		  NS = PLAYERCHOICE5;
MOVEXVERT8: NS = DRAWX8;


STARTSQUARE4:if(rst==1'b0)
		NS = STARTSQUARE4;
		else
		NS = DRAWSQUARE4;
DRAWSQUARE4: NS = CHANGESQUARE4;
CHANGESQUARE4: if (xsquare4 < 9'd50)
			  NS = MOVEXSQUARE4;
			  else 
			  NS = CHECKYSQUARE4;
MOVEXSQUARE4: NS = DRAWSQUARE4;
CHECKYSQUARE4: if(ysquare4 < 9'd50)
		  NS = MOVEYSQUARE4;
		  else 
		  NS = COMPUTERCHOICE5;
MOVEYSQUARE4: NS = DRAWSQUARE4;


STARTX9:if(rst==1'b0)
		NS = STARTX9;
		else
		NS = DRAWX9;
DRAWX9: NS = CHANGEX9;
CHANGEX9: if (xhort9 < 9'd50)
			  NS = MOVEXHORT9;
			  else 
			  NS = CHECKXVERT9;
MOVEXHORT9: NS = DRAWX9;
CHECKXVERT9: if(xvert9 < 9'd50)
		  NS = MOVEXVERT9;
		  else 
		  NS = STARTX10;
MOVEXVERT9: NS = DRAWX9;



STARTX10:if(rst==1'b0)
		NS = STARTX10;
		else
		NS = DRAWX10;
DRAWX10: NS = CHANGEX10;
CHANGEX10: if (xhort10 < 9'd50)
			  NS = MOVEXHORT10;
			  else 
			  NS = CHECKXVERT10;
MOVEXHORT10: NS = DRAWX10;
CHECKXVERT10: if(xvert10 < 9'd50)
		  NS = MOVEXVERT10;
		  else 
		  NS = PLAYERCHOICE6;
MOVEXVERT10: NS = DRAWX10;


STARTSQUARE5:if(rst==1'b0)
		NS = STARTSQUARE5;
		else
		NS = DRAWSQUARE5;
DRAWSQUARE5: NS = CHANGESQUARE5;
CHANGESQUARE5: if (xsquare5 < 9'd50)
			  NS = MOVEXSQUARE5;
			  else 
			  NS = CHECKYSQUARE5;
MOVEXSQUARE5: NS = DRAWSQUARE5;
CHECKYSQUARE5: if(ysquare5 < 9'd50)
		  NS = MOVEYSQUARE5;
		  else 
		  NS = COMPUTERCHOICE6;
MOVEYSQUARE5: NS = DRAWSQUARE5;


STARTX11:if(rst==1'b0)
		NS = STARTX11;
		else
		NS = DRAWX11;
DRAWX11: NS = CHANGEX11;
CHANGEX11: if (xhort11 < 11'd50)
			  NS = MOVEXHORT11;
			  else 
			  NS = CHECKXVERT11;
MOVEXHORT11: NS = DRAWX11;
CHECKXVERT11: if(xvert11 < 11'd50)
		  NS = MOVEXVERT11;
		  else 
		  NS = STARTX12;
MOVEXVERT11: NS = DRAWX11;



STARTX12:if(rst==1'b0)
		NS = STARTX12;
		else
		NS = DRAWX12;
DRAWX12: NS = CHANGEX12;
CHANGEX12: if (xhort12 < 9'd50)
			  NS = MOVEXHORT12;
			  else 
			  NS = CHECKXVERT12;
MOVEXHORT12: NS = DRAWX12;
CHECKXVERT12: if(xvert12 < 9'd50)
		  NS = MOVEXVERT12;
		  else 
		  NS = PLAYERCHOICE7;
MOVEXVERT12: NS = DRAWX12;


STARTSQUARE6:if(rst==1'b0)
		NS = STARTSQUARE6;
		else
		NS = DRAWSQUARE6;
DRAWSQUARE6: NS = CHANGESQUARE6;
CHANGESQUARE6: if (xsquare6 < 9'd50)
			  NS = MOVEXSQUARE6;
			  else 
			  NS = CHECKYSQUARE6;
MOVEXSQUARE6: NS = DRAWSQUARE6;
CHECKYSQUARE6: if(ysquare6 < 9'd50)
		  NS = MOVEYSQUARE6;
		  else 
		  NS = COMPUTERCHOICE7;
MOVEYSQUARE6: NS = DRAWSQUARE6;
		  
STARTX13:if(rst==1'b0)
		NS = STARTX13;
		else
		NS = DRAWX13;
DRAWX13: NS = CHANGEX13;
CHANGEX13: if (xhort13 < 13'd50)
			  NS = MOVEXHORT13;
			  else 
			  NS = CHECKXVERT13;
MOVEXHORT13: NS = DRAWX13;
CHECKXVERT13: if(xvert13 < 13'd50)
		  NS = MOVEXVERT13;
		  else 
		  NS = STARTX14;
MOVEXVERT13: NS = DRAWX13;



STARTX14:if(rst==1'b0)
		NS = STARTX14;
		else
		NS = DRAWX14;
DRAWX14: NS = CHANGEX14;
CHANGEX14: if (xhort14 < 9'd50)
			  NS = MOVEXHORT14;
			  else 
			  NS = CHECKXVERT14;
MOVEXHORT14: NS = DRAWX14;
CHECKXVERT14: if(xvert14 < 9'd50)
		  NS = MOVEXVERT14;
		  else 
		  NS = PLAYERCHOICE8;
MOVEXVERT14: NS = DRAWX14;


STARTSQUARE7:if(rst==1'b0)
		NS = STARTSQUARE7;
		else
		NS = DRAWSQUARE7;
DRAWSQUARE7: NS = CHANGESQUARE7;
CHANGESQUARE7: if (xsquare7 < 9'd50)
			  NS = MOVEXSQUARE7;
			  else 
			  NS = CHECKYSQUARE7;
MOVEXSQUARE7: NS = DRAWSQUARE7;
CHECKYSQUARE7: if(ysquare7 < 9'd50)
		  NS = MOVEYSQUARE7;
		  else 
		  NS = COMPUTERCHOICE8;
MOVEYSQUARE7: NS = DRAWSQUARE7;
		  
STARTX15:if(rst==1'b0)
		NS = STARTX15;
		else
		NS = DRAWX15;
DRAWX15: NS = CHANGEX15;
CHANGEX15: if (xhort15 < 15'd50)
			  NS = MOVEXHORT15;
			  else 
			  NS = CHECKXVERT15;
MOVEXHORT15: NS = DRAWX15;
CHECKXVERT15: if(xvert15 < 15'd50)
		  NS = MOVEXVERT15;
		  else 
		  NS = STARTX16;
MOVEXVERT15: NS = DRAWX15;



STARTX16:if(rst==1'b0)
		NS = STARTX16;
		else
		NS = DRAWX16;
DRAWX16: NS = CHANGEX16;
CHANGEX16: if (xhort16 < 9'd50)
			  NS = MOVEXHORT16;
			  else 
			  NS = CHECKXVERT16;
MOVEXHORT16: NS = DRAWX16;
CHECKXVERT16: if(xvert16 < 9'd50)
		  NS = MOVEXVERT16;
		  else 
		  NS = PLAYERCHOICE9;
MOVEXVERT16: NS = DRAWX16;


STARTSQUARE8:if(rst==1'b0)
		NS = STARTSQUARE8;
		else
		NS = DRAWSQUARE8;
DRAWSQUARE8: NS = CHANGESQUARE8;
CHANGESQUARE8: if (xsquare8 < 9'd50)
			  NS = MOVEXSQUARE8;
			  else 
			  NS = CHECKYSQUARE8;
MOVEXSQUARE8: NS = DRAWSQUARE8;
CHECKYSQUARE8: if(ysquare8 < 9'd50)
		  NS = MOVEYSQUARE8;
		  else 
		  NS = COMPUTERCHOICE9;
MOVEYSQUARE8: NS = DRAWSQUARE8;		  
		  
STARTX17:if(rst==1'b0)
		NS = STARTX17;
		else
		NS = DRAWX17;
DRAWX17: NS = CHANGEX17;
CHANGEX17: if (xhort17 < 17'd50)
			  NS = MOVEXHORT17;
			  else 
			  NS = CHECKXVERT17;
MOVEXHORT17: NS = DRAWX17;
CHECKXVERT17: if(xvert17 < 17'd50)
		  NS = MOVEXVERT17;
		  else 
		  NS = STARTX18;
MOVEXVERT17: NS = DRAWX17;



STARTX18:if(rst==1'b0)
		NS = STARTX18;
		else
		NS = DRAWX18;
DRAWX18: NS = CHANGEX18;
CHANGEX18: if (xhort18 < 9'd50)
			  NS = MOVEXHORT18;
			  else 
			  NS = CHECKXVERT18;
MOVEXHORT18: NS = DRAWX18;
CHECKXVERT18: if(xvert18 < 9'd50)
		  NS = MOVEXVERT18;
		  else 
		  NS = PLAYERWIN; //should be playerturn 
MOVEXVERT18: NS = DRAWX18;


STARTSQUARE9:if(rst==1'b0)
		NS = STARTSQUARE9;
		else
		NS = DRAWSQUARE9;
DRAWSQUARE9: NS = CHANGESQUARE9;
CHANGESQUARE9: if (xsquare9 < 9'd50)
			  NS = MOVEXSQUARE9;
			  else 
			  NS = CHECKYSQUARE9;
MOVEXSQUARE9: NS = DRAWSQUARE9;
CHECKYSQUARE9: if(ysquare9 < 9'd50)
		  NS = MOVEYSQUARE9;
		  else 
		  NS = COMPUTERWIN;
MOVEYSQUARE9: NS = DRAWSQUARE9;	

PLAYERTURN: if(turn==1'b1)
				NS = PLAYERCHOICE;
				else 
				NS = COMPUTERTURN;
		

PLAYERCHOICE:  if (p1pos1 == 1'b1 && p1 == 2'd0)
					NS = STARTX;
					else
					NS = PLAYERCHOICE2;
PLAYERCHOICE2: if (p1pos2 == 1'b1 && p2 == 2'd0)
					NS = STARTX3;
					else
					NS = PLAYERCHOICE3;
PLAYERCHOICE3: if (p1pos3 == 1'b1 && p3 == 2'd0)
					NS = STARTX5;
					else
					NS = PLAYERCHOICE4;
PLAYERCHOICE4: if (p1pos4 == 1'b1 && p4 == 2'd0)
					NS = STARTX7;
					else
					NS = PLAYERCHOICE5;
PLAYERCHOICE5: if (p1pos5 == 1'b1 && p5 == 2'd0)
					NS = STARTX9;
					else
					NS = PLAYERCHOICE6;
PLAYERCHOICE6: if (p1pos6 == 1'b1 && p6 == 2'd0)
					NS = STARTX11;
					else
					NS = PLAYERCHOICE7;
PLAYERCHOICE7: if (p1pos7 == 1'b1 && p7 == 2'd0)
					NS = STARTX13;
					else
					NS = PLAYERCHOICE8;
PLAYERCHOICE8:	if (p1pos8 == 1'b1 && p8 == 2'd0)
					NS = STARTX15;
					else
					NS = PLAYERCHOICE9;
PLAYERCHOICE9: if (p1pos9 == 1'b1 && p9 == 2'd0)
					NS = STARTX17;
					else
					NS = PLAYERWIN;
					
PLAYERWIN:     if (p1==2'd1 && p2 == 2'd1 && p3 == 2'd1)
					NS = PLAYERWIN;
			 else if (p4 == 2'd1 && p5 == 2'd1 && p6 == 2'd1)
					NS = PLAYERWIN;
			 else if (p7 == 2'd1 && p8 == 2'd1 && p9 == 2'd1)
					NS = PLAYERWIN;
			 else if (p1 == 2'd1 && p4 == 2'd1 && p7 == 2'd1)
					NS = PLAYERWIN;
			 else if (p2 == 2'd1 && p5 == 2'd1 && p8 == 2'd1)
					NS = PLAYERWIN;
			 else if (p3 == 2'd1 && p6 == 2'd1 && p9 == 2'd1)
					NS = PLAYERWIN;
			 else if (p1==2'd1 && p5 == 2'd1 && p9 == 2'd1)
					NS = PLAYERWIN;
			 else if (p3 == 2'd1 && p5 == 2'd1 && p7 == 2'd1)
					NS = PLAYERWIN;
			 else
					NS = COMPUTERTURN;


COMPUTERTURN:	if(turn2==1'b1)
				   NS = COMPUTERCHOICE;
					else 
				   NS = PLAYERTURN;
				 
COMPUTERCHOICE:  if (p2pos1 == 1'b1 && p1 == 2'd0)
					  NS = STARTSQUARE;
					  else
					  NS = COMPUTERCHOICE2;
COMPUTERCHOICE2: if (p2pos2 == 1'b1 && p2 == 2'd0)
					  NS = STARTSQUARE2;
					  else
					  NS = COMPUTERCHOICE3;
COMPUTERCHOICE3: if (p2pos3 == 1'b1 && p3 == 2'd0)
					  NS = STARTSQUARE3;
					  else
					  NS = COMPUTERCHOICE4;
COMPUTERCHOICE4: if (p2pos4 == 1'b1 && p4 == 2'd0)
					  NS = STARTSQUARE4;
					  else
					  NS = COMPUTERCHOICE5;
COMPUTERCHOICE5: if (p2pos5 == 1'b1 && p5 == 2'd0)
					  NS = STARTSQUARE5;
					  else
					  NS = COMPUTERCHOICE6;
COMPUTERCHOICE6: if (p2pos6 == 1'b1 && p6 == 2'd0)
					  NS = STARTSQUARE6;
					  else
					  NS = COMPUTERCHOICE7;
COMPUTERCHOICE7: if (p2pos7 == 1'b1 && p7 == 2'd0)
					  NS = STARTSQUARE7;
					  else
					  NS = COMPUTERCHOICE8;
COMPUTERCHOICE8: if (p2pos8 == 1'b1 && p8 == 2'd0)
					  NS = STARTSQUARE8;
					  else
					  NS = COMPUTERCHOICE9;
COMPUTERCHOICE9: if (p2pos9 == 1'b1 && p9 == 2'd0)
					  NS = STARTSQUARE9;
					  else
					  NS = COMPUTERCHOICEAUTO; //CCAUTO
					  
COMPUTERCHOICEAUTO: if(auto==1'b0) begin //AUTOHARD difficulty

								//1. WIN NEXT
								
										//pos1
						  
										if (p1 == 2'd0 && p4 == 2'd2 && p7 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										else if (p1 == 2'd0 && p2 == 2'd2 && p3 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										else if (p1 == 2'd0 && p5 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										//pos2
						  
										else if (p2 == 2'd0 && p1 == 2'd2 && p3 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										else if (p2 == 2'd0 && p5 == 2'd2 && p8 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										//pos3
						  
										else if (p3 == 2'd0 && p1 == 2'd2 && p2 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										else if (p3 == 2'd0 && p6 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										else if (p3 == 2'd0 && p5 == 2'd2 && p7 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										//pos4
						  
										else if (p4 == 2'd0 && p1 == 2'd2 && p7 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										else if (p4 == 2'd0 && p5 == 2'd2 && p6 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										//pos5
						  
										else if (p5 == 2'd0 && p1 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p3 == 2'd2 && p7 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p2 == 2'd2 && p8 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p4 == 2'd2 && p8 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										//pos6
						  
										else if (p6 == 2'd0 && p3 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										else if (p6 == 2'd0 && p4 == 2'd2 && p5 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										//pos7
						  
										else if (p7 == 2'd0 && p1 == 2'd2 && p4 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										else if (p7 == 2'd0 && p5 == 2'd2 && p3 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										else if (p7 == 2'd0 && p8 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										//pos8
						  
										else if (p8 == 2'd0 && p2 == 2'd2 && p5 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
												
										else if (p8 == 2'd0 && p7 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
												
										//pos9
						  
										else if (p9 == 2'd0 && p1 == 2'd2 && p5 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										else if (p9 == 2'd0 && p3 == 2'd2 && p6 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										else if (p9 == 2'd0 && p7 == 2'd2 && p8 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
								
								//2. BLOCK OPP
								
										//pos1
								
										else if (p1 == 2'd0 && p4 == 2'd1 && p7 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										else if (p1 == 2'd0 && p2 == 2'd1 && p3 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										else if (p1 == 2'd0 && p5 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										//pos2
						  
										else if (p2 == 2'd0 && p1 == 2'd1 && p3 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										else if (p2 == 2'd0 && p5 == 2'd1 && p8 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										//pos3
						  
										else if (p3 == 2'd0 && p1 == 2'd1 && p2 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										else if (p3 == 2'd0 && p6 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										else if (p3 == 2'd0 && p5 == 2'd1 && p7 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										//pos4
						  
										else if (p4 == 2'd0 && p1 == 2'd1 && p7 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										else if (p4 == 2'd0 && p5 == 2'd1 && p6 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										//pos5
						  
										else if (p5 == 2'd0 && p1 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p3 == 2'd1 && p7 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p2 == 2'd1 && p8 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p4 == 2'd1 && p8 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										//pos6
						  
										else if (p6 == 2'd0 && p3 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										else if (p6 == 2'd0 && p4 == 2'd1 && p5 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										//pos7
						  
										else if (p7 == 2'd0 && p1 == 2'd1 && p4 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										else if (p7 == 2'd0 && p5 == 2'd1 && p3 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										else if (p7 == 2'd0 && p8 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										//pos8
						  
										else if (p8 == 2'd0 && p2 == 2'd1 && p5 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
												
										else if (p8 == 2'd0 && p7 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
												
										//pos9
						  
										else if (p9 == 2'd0 && p1 == 2'd1 && p5 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										else if (p9 == 2'd0 && p3 == 2'd1 && p6 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										else if (p9 == 2'd0 && p7 == 2'd1 && p8 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
										
								//3. FORK
								
										//Top Left
								
										else if (p2 == 2'd2 && p4 == 2'd2 && p6 == 2'd0 && p8 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										//Top Right
								
										else if (p2 == 2'd2 && p6 == 2'd2 && p4 == 2'd0 && p8 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										//Bottom Left
								
										else if (p4 == 2'd2 && p8 == 2'd2 && p2 == 2'd0 && p6 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										//Bottom Right
								
										else if (p6 == 2'd2 && p8 == 2'd2 && p2 == 2'd0 && p4 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
								
								//4. BLOCK OPP FORK
								
										//Top Left
								
										else if (p2 == 2'd1 && p4 == 2'd1 && p6 == 2'd0 && p8 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										//Top Right
								
										else if (p2 == 2'd1 && p6 == 2'd1 && p4 == 2'd0 && p8 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										//Bottom Left
								
										else if (p4 == 2'd1 && p8 == 2'd1 && p2 == 2'd0 && p6 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										//Bottom Right
								
										else if (p6 == 2'd1 && p8 == 2'd1 && p2 == 2'd0 && p4 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
								
								//5. PLAY CENTER
								
										else if (p5 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
								
								//6. OPPOSITE CORNER
								
										//Bottom Right
								
										else if (p1 == 2'd1 && p9 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										//Bottom Left
								
										else if (p3 == 2'd1 && p7 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										//Top Right
								
										else if (p7 == 2'd1 && p3 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										//Bottom Left
								
										else if (p9 == 2'd1 && p1 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
								
								//7. EMPTY CORNER
								
										//Top Left
								
										else if (p1 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										//Top Right
								
										else if (p3 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										//Bottom Left
								
										else if (p7 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										//Top Left
								
										else if (p9 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
								
								//8. EMPTY SIDE
								
										//Left
								
										else if (p4 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										//Top
								
										else if (p2 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										//Right
								
										else if (p6 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										//Bottom
								
										else if (p8 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
												
										end
								
								else if(automedium==1'b0) begin //AUTOHARD difficulty

								//1. WIN NEXT
								
										//pos1
						  
										if (p1 == 2'd0 && p4 == 2'd2 && p7 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										else if (p1 == 2'd0 && p2 == 2'd2 && p3 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										else if (p1 == 2'd0 && p5 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										//pos2
						  
										else if (p2 == 2'd0 && p1 == 2'd2 && p3 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										else if (p2 == 2'd0 && p5 == 2'd2 && p8 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										//pos3
						  
										else if (p3 == 2'd0 && p1 == 2'd2 && p2 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										else if (p3 == 2'd0 && p6 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										else if (p3 == 2'd0 && p5 == 2'd2 && p7 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										//pos4
						  
										else if (p4 == 2'd0 && p1 == 2'd2 && p7 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										else if (p4 == 2'd0 && p5 == 2'd2 && p6 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										//pos5
						  
										else if (p5 == 2'd0 && p1 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p3 == 2'd2 && p7 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p2 == 2'd2 && p8 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p4 == 2'd2 && p8 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										//pos6
						  
										else if (p6 == 2'd0 && p3 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										else if (p6 == 2'd0 && p4 == 2'd2 && p5 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										//pos7
						  
										else if (p7 == 2'd0 && p1 == 2'd2 && p4 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										else if (p7 == 2'd0 && p5 == 2'd2 && p3 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										else if (p7 == 2'd0 && p8 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										//pos8
						  
										else if (p8 == 2'd0 && p2 == 2'd2 && p5 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
												
										else if (p8 == 2'd0 && p7 == 2'd2 && p9 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
												
										//pos9
						  
										else if (p9 == 2'd0 && p1 == 2'd2 && p5 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										else if (p9 == 2'd0 && p3 == 2'd2 && p6 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										else if (p9 == 2'd0 && p7 == 2'd2 && p8 == 2'd2 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
								
								//2. BLOCK OPP
								
										//pos1
								
										else if (p1 == 2'd0 && p4 == 2'd1 && p7 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										else if (p1 == 2'd0 && p2 == 2'd1 && p3 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										else if (p1 == 2'd0 && p5 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										//pos2
						  
										else if (p2 == 2'd0 && p1 == 2'd1 && p3 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										else if (p2 == 2'd0 && p5 == 2'd1 && p8 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										//pos3
						  
										else if (p3 == 2'd0 && p1 == 2'd1 && p2 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										else if (p3 == 2'd0 && p6 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										else if (p3 == 2'd0 && p5 == 2'd1 && p7 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										//pos4
						  
										else if (p4 == 2'd0 && p1 == 2'd1 && p7 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										else if (p4 == 2'd0 && p5 == 2'd1 && p6 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										//pos5
						  
										else if (p5 == 2'd0 && p1 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p3 == 2'd1 && p7 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p2 == 2'd1 && p8 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										else if (p5 == 2'd0 && p4 == 2'd1 && p8 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
												
										//pos6
						  
										else if (p6 == 2'd0 && p3 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										else if (p6 == 2'd0 && p4 == 2'd1 && p5 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										//pos7
						  
										else if (p7 == 2'd0 && p1 == 2'd1 && p4 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										else if (p7 == 2'd0 && p5 == 2'd1 && p3 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										else if (p7 == 2'd0 && p8 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										//pos8
						  
										else if (p8 == 2'd0 && p2 == 2'd1 && p5 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
												
										else if (p8 == 2'd0 && p7 == 2'd1 && p9 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
												
										//pos9
						  
										else if (p9 == 2'd0 && p1 == 2'd1 && p5 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										else if (p9 == 2'd0 && p3 == 2'd1 && p6 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										else if (p9 == 2'd0 && p7 == 2'd1 && p8 == 2'd1 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
										
								
								
								//6. OPPOSITE CORNER
								
										//Bottom Right
								
										else if (p1 == 2'd1 && p9 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										//Bottom Left
								
										else if (p3 == 2'd1 && p7 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										//Top Right
								
										else if (p7 == 2'd1 && p3 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										//Bottom Left
								
										else if (p9 == 2'd1 && p1 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
								
								//7. EMPTY CORNER
								
										//Top Left
								
										else if (p1 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										//Top Right
								
										else if (p3 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										//Bottom Left
								
										else if (p7 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										//Top Left
								
										else if (p9 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
								
								//8. EMPTY SIDE
								
										//Left
								
										else if (p4 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										//Top
								
										else if (p2 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										//Right
								
										else if (p6 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										//Bottom
								
										else if (p8 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
												
										end
										
								else if (autoeasy == 1'b0) begin
										//5. PLAY CENTER
								
										 if (p5 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE5;
								
								//6. OPPOSITE CORNER
								
										//Bottom Right
								
										else if (p1 == 2'd1 && p9 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
												
										//Bottom Left
								
										else if (p3 == 2'd1 && p7 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										//Top Right
								
										else if (p7 == 2'd1 && p3 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										//Bottom Left
								
										else if (p9 == 2'd1 && p1 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
								
								//7. EMPTY CORNER
								
										//Top Left
								
										else if (p1 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE;
												
										//Top Right
								
										else if (p3 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE3;
												
										//Bottom Left
								
										else if (p7 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE7;
												
										//Top Left
								
										else if (p9 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE9;
								
								//8. EMPTY SIDE
								
										//Left
								
										else if (p4 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE4;
												
										//Top
								
										else if (p2 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE2;
												
										//Right
								
										else if (p6 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE6;
												
										//Bottom
								
										else if (p8 == 2'd0 && turn == 1'b0 && turn2 == 1'b1)
										
												NS = STARTSQUARE8;
						
												
										
										end
					
						  
						  else 
						  NS = COMPUTERWIN;

COMPUTERWIN: 	  if (p1==2'd2 && p2 == 2'd2 && p3 == 2'd2)
					NS = COMPUTERWIN;
			 else if (p4 == 2'd2 && p5 == 2'd2 && p6 == 2'd2)
					NS = COMPUTERWIN;
			 else if (p7 == 2'd2 && p8 == 2'd2 && p9 == 2'd2)
					NS = COMPUTERWIN;
			 else if (p1 == 2'd2 && p4 == 2'd2 && p7 == 2'd2)
					NS = COMPUTERWIN;
			 else if (p2 == 2'd2 && p5 == 2'd2 && p8 == 2'd2)
					NS = COMPUTERWIN;
			 else if (p3 == 2'd2 && p6 == 2'd2 && p9 == 2'd2)
					NS = COMPUTERWIN;
			 else if (p1==2'd2 && p5 == 2'd2 && p9 == 2'd2)
					NS = COMPUTERWIN;
			 else if (p3 == 2'd2 && p5 == 2'd2 && p7 == 2'd2)
					NS = COMPUTERWIN;
			 else
					NS = PLAYERTURN;


endcase
end

always@(posedge clk or negedge rst)begin 
if(rst==1'b0) begin
xcount <= 9'd0;
ycount <= 9'd0;
plotchange <=1'd0;
xtable <= 9'd0;
ytable <= 9'd0;
tablechange <=1'd0;
xtable2 <= 9'd0;
ytable2 <= 9'd0;
tablechange2 <=1'd0;
xtable3 <= 9'd0;
ytable3 <= 9'd0;
tablechange3 <=1'd0;
xtable4 <= 9'd0;
ytable4 <= 9'd0;
tablechange4 <=1'd0;
xhort <= 9'd0;
xvert <= 9'd0;
xchange <=1'd0;
xhort2 <= 9'd0;
xvert2 <= 9'd0;
xchange2 <=1'd0;
xsquare <= 9'd0;
ysquare <= 9'd0;
changesquare <=1'd0;
xhort3 <= 9'd0;
xvert3 <= 9'd0;
xchange3 <=1'd0;
xhort4 <= 9'd0;
xvert4 <= 9'd0;
xchange4 <= 9'd0;
xsquare2 <= 9'd0;
ysquare2 <= 9'd0;
changesquare2 <=1'd0;
xhort5 <= 9'd0;
xvert5 <= 9'd0;
xchange5 <=1'd0;
xhort6 <= 9'd0;
xvert6 <= 9'd0;
xchange6 <= 1'd0;
xsquare3 <= 9'd0;
ysquare3 <= 9'd0;
changesquare3 <=1'd0;
xhort7 <= 9'd0;
xvert7 <= 9'd0;
xchange7 <=1'd0;
xhort8 <= 9'd0;
xvert8 <= 9'd0;
xchange8 <= 1'd0;
xsquare4 <= 9'd0;
ysquare4 <= 9'd0;
changesquare4 <=1'd0;
xhort9 <= 9'd0;
xvert9 <= 9'd0;
xchange9 <=1'd0;
xhort10 <= 9'd0;
xvert10 <= 9'd0;
xchange10 <=1'd0;
changesquare5 <=1'd0;
xhort11 <= 11'd0;
xvert11 <= 11'd0;
xchange11 <=1'd0;
xhort12 <= 12'd0;
xvert12 <= 12'd0;
xchange12 <=1'd0;
changesquare6 <=1'd0;
xhort13 <= 13'd0;
xvert13 <= 13'd0;
xchange13 <=1'd0;
xhort14 <= 14'd0;
xvert14 <= 14'd0;
xchange14 <=1'd0;
changesquare7 <= 1'd0;
xhort15 <= 15'd0;
xvert15 <= 15'd0;
xchange15 <=1'd0;
xhort16 <= 16'd0;
xvert16 <= 16'd0;
xchange16 <=1'd0;
changesquare8 <= 1'd0;
xhort17 <= 17'd0;
xvert17 <= 17'd0;
xchange17 <=1'd0;
xhort18 <= 18'd0;
xvert18 <= 18'd0;
xchange18 <=1'd0;
changesquare9 <= 1'd0;
turn<=1'b1; 
turn2<=1'b0;
p1<=2'b00;
p2<=2'b00;
p3<=2'b00;
p4<=2'b00;
p5<=2'b00;
p6<=2'b00;
p7<=2'b00;
p8<=2'b00;
p9<=2'b00;
end
else begin
case(S)
START: begin  xcount <= 9'd0;
		 ycount <= 9'd0;
		 plotchange <= 1'd0;
		 end
CHANGEPIX: plotchange <= plot;
MOVEX: xcount <= xcount + 1'd1;
CHECKY: xcount<= 9'd0;
MOVEY: ycount <= ycount + 1'd1; 
DRAW:begin 
		color<= 3'b111;
		x<= xcount;
		y<= ycount;
		end
STARTTABLE: begin xtable <= 9'd0;
				ytable <= 9'd0;
				tablechange<=1'd0;
				end
CHANGEPIXS: tablechange <= plot;
MOVEHORTLEG: xtable <= xtable + 1'd1;
CHECKYLEG: xtable<= 9'd0;
MOVEYLEG: ytable <= ytable + 1'd1; 
DRAWTABLE:begin 
		color<= 3'b000;
		x<= initxtable + xtable;
		y<= ytable;
		end
		
		
		
STARTTABLE2: begin xtable2 <= 9'd0;
				ytable2 <= 9'd0;
				tablechange2<=1'd0;
				end
CHANGEPIXS2: tablechange2 <= plot;
MOVEHORTLEG2: xtable2 <= xtable2 + 1'd1;
CHECKYLEG2: xtable2 <= 9'd0;
MOVEYLEG2: ytable2 <= ytable2 + 1'd1; 
DRAWTABLE2:begin 
		color<= 3'b000;
		x<= initxtable2 + xtable2;
		y<= ytable2;
		end
		
		

STARTTABLE3: begin xtable3 <= 9'd0;
				ytable3 <= 9'd0;
				tablechange3<=1'd0;
				end
CHANGEPIXS3: tablechange3 <= plot;
MOVEYLEG3: ytable3 <= ytable3 + 1'd1; 
CHECKYLEG3: xtable3 <= 9'd0;
MOVEHORTLEG3: xtable3 <= xtable3 + 1'd1;
DRAWTABLE3:begin 
		color<= 3'b000;
		x<= xtable3;
		y<= initytable3 + ytable3;
		end
		
		
		
STARTTABLE4: begin xtable4 <= 9'd0;
				ytable4 <= 9'd0;
				tablechange4 <=1'd0;
				end
CHANGEPIXS4: tablechange4 <= plot;
MOVEYLEG4: ytable4 <= ytable4 + 1'd1; 
CHECKYLEG4: xtable4 <= 9'd0;
MOVEHORTLEG4: xtable4 <= xtable4 + 1'd1;
DRAWTABLE4:begin 
		color<= 3'b000;
		x<= xtable4;
		y<= initytable4 + ytable4;
		end

		
STARTX: begin xhort <= 9'd0;
				xvert <= 9'd0;
				xchange <=1'd0;
				turn <= 1'b0;
				turn2 <=1'b1;
				p1<=2'd1;
				end
CHANGEX: xchange <= plot;
MOVEXVERT: xvert <= xvert + 1'd1; 
CHECKXVERT: xhort <= 9'd0;
MOVEXHORT: xhort <= xhort + 1'd1;
DRAWX:begin 
		color<= 3'b000;
		x<= initxhort  + xvert;
		y<= initxvert + xvert;
		end	
		
STARTX2: begin xhort2 <= 9'd0;
				xvert2 <= 9'd0;
				xchange2 <=1'd0;
				end
CHANGEX2: xchange2 <= plot;
MOVEXVERT2: xvert2 <= xvert2 + 1'd1; 
CHECKXVERT2: xhort2 <= 9'd0;
MOVEXHORT2: xhort2 <= xhort2 + 1'd1;
DRAWX2:begin 
		color<= 3'b000;
		x<= initxhort2 - xvert2;
		y<= initxvert2 + xvert2;
		end
	
STARTSQUARE: begin xsquare <= 9'd0;
				ysquare <= 9'd0;
				changesquare <=1'd0;
				turn<=1'b1;
				turn2<=1'b0;
				p1<=2'd2;
				end
CHANGESQUARE: changesquare <= plot;
MOVEYSQUARE: ysquare <= ysquare + 1'd1; 
CHECKYSQUARE: xsquare <= 9'd0;
MOVEXSQUARE: xsquare <= xsquare + 1'd1;
DRAWSQUARE:begin 
		color<= 3'b000;
		x<= initxsquare + xsquare;
		y<= initysquare + ysquare;
		end
		
		
STARTX3: begin xhort3 <= 9'd0;
				xvert3 <= 9'd0;
				xchange3 <=1'd0;
				turn<=1'b0;
				turn2<=1'b1;
				p2<=2'd1;
				end
CHANGEX3: xchange3 <= plot;
MOVEXVERT3: xvert3 <= xvert3 + 1'd1; 
CHECKXVERT3: xhort3 <= 9'd0;
MOVEXHORT3: xhort3 <= xhort3 + 1'd1;
DRAWX3:begin 
		color<= 3'b000;
		x<= initxhort3  + xvert3;
		y<= initxvert3 + xvert3;
		end	
		
STARTX4: begin xhort4 <= 9'd0;
				xvert4 <= 9'd0;
				xchange4 <=1'd0;
				end
CHANGEX4: xchange4 <= plot;
MOVEXVERT4: xvert4 <= xvert4 + 1'd1; 
CHECKXVERT4: xhort4 <= 9'd0;
MOVEXHORT4: xhort4 <= xhort4 + 1'd1;
DRAWX4:begin 
		color<= 3'b000;
		x<= initxhort4 - xvert4;
		y<= initxvert4 + xvert4;
		end
		
		
STARTSQUARE2: begin xsquare2 <= 9'd0;
				ysquare2 <= 9'd0;
				changesquare2 <=1'd0;
				turn<=1'b1;
				turn2<=1'b0;
				p2<=2'd2;
				end
CHANGESQUARE2: changesquare2 <= plot;
MOVEYSQUARE2: ysquare2 <= ysquare2 + 1'd1; 
CHECKYSQUARE2: xsquare2 <= 9'd0;
MOVEXSQUARE2: xsquare2 <= xsquare2 + 1'd1;
DRAWSQUARE2:begin 
		color<= 3'b000;
		x<= initxsquare2 + xsquare2;
		y<= initysquare2 + ysquare2;
		end

		
STARTX5: begin xhort5 <= 9'd0;
				xvert5 <= 9'd0;
				xchange5 <=1'd0;
				turn<=1'b0;
				turn2<=1'b1;
				p3<=2'd1;
				end
CHANGEX5: xchange5 <= plot;
MOVEXVERT5: xvert5 <= xvert5 + 1'd1; 
CHECKXVERT5: xhort5 <= 9'd0;
MOVEXHORT5: xhort5 <= xhort5 + 1'd1;
DRAWX5:begin 
		color<= 3'b000;
		x<= initxhort5  + xvert5;
		y<= initxvert5 + xvert5;
		end	
		
STARTX6: begin xhort6 <= 9'd0;
				xvert6 <= 9'd0;
				xchange6 <=1'd0;
				end
CHANGEX6: xchange6 <= plot;
MOVEXVERT6: xvert6 <= xvert6 + 1'd1; 
CHECKXVERT6: xhort6 <= 9'd0;
MOVEXHORT6: xhort6 <= xhort6 + 1'd1;
DRAWX6:begin 
		color<= 3'b000;
		x<= initxhort6 - xvert6;
		y<= initxvert6 + xvert6;
		end

		
STARTSQUARE3: begin xsquare3 <= 9'd0;
				ysquare3 <= 9'd0;
				changesquare3 <=1'd0;
				turn<=1'b1;
				turn2<=1'b0;
				p3<=2'd2;
				end
CHANGESQUARE3: changesquare3 <= plot;
MOVEYSQUARE3: ysquare3 <= ysquare3 + 1'd1; 
CHECKYSQUARE3: xsquare3 <= 9'd0;
MOVEXSQUARE3: xsquare3 <= xsquare3 + 1'd1;
DRAWSQUARE3:begin 
		color<= 3'b000;
		x<= initxsquare3 + xsquare3;
		y<= initysquare3 + ysquare3;
		end
		
		
STARTX7: begin xhort7 <= 9'd0;
				xvert7 <= 9'd0;
				xchange7 <=1'd0;
				turn<=1'b0;
				turn2<=1'b1;
				p4<=2'd1;
				end
CHANGEX7: xchange7 <= plot;
MOVEXVERT7: xvert7 <= xvert7 + 1'd1; 
CHECKXVERT7: xhort7 <= 9'd0;
MOVEXHORT7: xhort7 <= xhort7 + 1'd1;
DRAWX7:begin 
		color<= 3'b000;
		x<= initxhort7  + xvert7;
		y<= initxvert7 + xvert7;
		end	
		
STARTX8: begin xhort8 <= 9'd0;
				xvert8 <= 9'd0;
				xchange8 <=1'd0;
				end
CHANGEX8: xchange8 <= plot;
MOVEXVERT8: xvert8 <= xvert8 + 1'd1; 
CHECKXVERT8: xhort8 <= 9'd0;
MOVEXHORT8: xhort8 <= xhort8 + 1'd1;
DRAWX8:begin 
		color<= 3'b000;
		x<= initxhort8 - xvert8;
		y<= initxvert8 + xvert8;
		end

		
STARTSQUARE4: begin xsquare4 <= 9'd0;
				ysquare4 <= 9'd0;
				changesquare4 <=1'd0;
				turn<=1'b1;
				turn2<=1'b0;
				p4<=2'd2;
				end
CHANGESQUARE4: changesquare4 <= plot;
MOVEYSQUARE4: ysquare4 <= ysquare4 + 1'd1; 
CHECKYSQUARE4: xsquare4 <= 9'd0;
MOVEXSQUARE4: xsquare4 <= xsquare4 + 1'd1;
DRAWSQUARE4:begin 
		color<= 3'b000;
		x<= initxsquare4 + xsquare4;
		y<= initysquare4 + ysquare4;
		end
		

STARTX9: begin xhort9 <= 9'd0;
				xvert9 <= 9'd0;
				xchange9 <=1'd0;
				turn<=1'b0;
				turn2<=1'b1;
				p5<=2'd1;
				end
CHANGEX9: xchange9 <= plot;
MOVEXVERT9: xvert9 <= xvert9 + 1'd1; 
CHECKXVERT9: xhort9 <= 9'd0;
MOVEXHORT9: xhort9 <= xhort9 + 1'd1;
DRAWX9:begin 
		color<= 3'b000;
		x<= initxhort9  + xvert9;
		y<= initxvert9 + xvert9;
		end	
		
STARTX10: begin xhort10 <= 9'd0;
				xvert10 <= 9'd0;
				xchange10 <=1'd0;
				end
CHANGEX10: xchange10 <= plot;
MOVEXVERT10: xvert10 <= xvert10 + 1'd1; 
CHECKXVERT10: xhort10 <= 9'd0;
MOVEXHORT10: xhort10 <= xhort10 + 1'd1;
DRAWX10:begin 
		color<= 3'b000;
		x<= initxhort10 - xvert10;
		y<= initxvert10 + xvert10;
		end
		
		
STARTSQUARE5: begin xsquare5 <= 9'd0;
				ysquare5 <= 9'd0;
				changesquare5 <=1'd0;
				turn<=1'b1;
				turn2<=1'b0;
				p5<=2'd2;
				end
CHANGESQUARE5: changesquare5 <= plot;
MOVEYSQUARE5: ysquare5 <= ysquare5 + 1'd1; 
CHECKYSQUARE5: xsquare5 <= 9'd0;
MOVEXSQUARE5: xsquare5 <= xsquare5 + 1'd1;
DRAWSQUARE5:begin 
		color<= 3'b000;
		x<= initxsquare5 + xsquare5;
		y<= initysquare5 + ysquare5;
		end
		
		
STARTX11: begin xhort11 <= 9'd0;
				xvert11 <= 9'd0;
				xchange11 <=1'd0;
				turn<=1'b0;
				turn2<=1'b1;
				p6<=2'd1;
				end
CHANGEX11: xchange11 <= plot;
MOVEXVERT11: xvert11 <= xvert11 + 1'd1; 
CHECKXVERT11: xhort11 <= 9'd0;
MOVEXHORT11: xhort11 <= xhort11 + 1'd1;
DRAWX11:begin 
		color<= 3'b000;
		x<= initxhort11  + xvert11;
		y<= initxvert11 + xvert11;
		end	
		
STARTX12: begin xhort12 <= 9'd0;
				xvert12 <= 9'd0;
				xchange12 <=1'd0;
				end
CHANGEX12: xchange12 <= plot;
MOVEXVERT12: xvert12 <= xvert12 + 1'd1; 
CHECKXVERT12: xhort12 <= 9'd0;
MOVEXHORT12: xhort12 <= xhort12 + 1'd1;
DRAWX12:begin 
		color<= 3'b000;
		x<= initxhort12 - xvert12;
		y<= initxvert12 + xvert12;
		end
		
STARTSQUARE6: begin xsquare6 <= 9'd0;
				ysquare6 <= 9'd0;
				changesquare6 <=1'd0;
				turn<=1'b1;
				turn2<=1'b0;
				p6<=2'd2;
				end
CHANGESQUARE6: changesquare6 <= plot;
MOVEYSQUARE6: ysquare6 <= ysquare6 + 1'd1; 
CHECKYSQUARE6: xsquare6 <= 9'd0;
MOVEXSQUARE6: xsquare6 <= xsquare6 + 1'd1;
DRAWSQUARE6:begin 
		color<= 3'b000;
		x<= initxsquare6 + xsquare6;
		y<= initysquare6 + ysquare6;
		end
		

STARTX13: begin xhort13 <= 9'd0;
				xvert13 <= 9'd0;
				xchange13 <=1'd0;
				turn<=1'b0;
				turn2<=1'b1;
				p7<=2'd1;
				end
CHANGEX13: xchange13 <= plot;
MOVEXVERT13: xvert13 <= xvert13 + 1'd1; 
CHECKXVERT13: xhort13 <= 9'd0;
MOVEXHORT13: xhort13 <= xhort13 + 1'd1;
DRAWX13:begin 
		color<= 3'b000;
		x<= initxhort13  + xvert13;
		y<= initxvert13 + xvert13;
		end	
		
STARTX14: begin xhort14 <= 9'd0;
				xvert14 <= 9'd0;
				xchange14 <=1'd0;
				end
CHANGEX14: xchange14 <= plot;
MOVEXVERT14: xvert14 <= xvert14 + 1'd1; 
CHECKXVERT14: xhort14 <= 9'd0;
MOVEXHORT14: xhort14 <= xhort14 + 1'd1;
DRAWX14:begin 
		color<= 3'b000;
		x<= initxhort14 - xvert14;
		y<= initxvert14 + xvert14;
		end
		
		
STARTSQUARE7: begin xsquare7 <= 9'd0;
				ysquare7 <= 9'd0;
				changesquare7 <=1'd0;
				turn<=1'b1;
				turn2<=1'b0;
				p7<=2'd2;
				end
CHANGESQUARE7: changesquare7 <= plot;
MOVEYSQUARE7: ysquare7 <= ysquare7 + 1'd1; 
CHECKYSQUARE7: xsquare7 <= 9'd0;
MOVEXSQUARE7: xsquare7 <= xsquare7 + 1'd1;
DRAWSQUARE7:begin 
		color<= 3'b000;
		x<= initxsquare7 + xsquare7;
		y<= initysquare7 + ysquare7;
		end
		
		
STARTX15: begin xhort15 <= 9'd0;
				xvert15 <= 9'd0;
				xchange15 <=1'd0;
				turn<=1'b0;
				turn2<=1'b1;
				p8<=2'd1;
				end
CHANGEX15: xchange15 <= plot;
MOVEXVERT15: xvert15 <= xvert15 + 1'd1; 
CHECKXVERT15: xhort15 <= 9'd0;
MOVEXHORT15: xhort15 <= xhort15 + 1'd1;
DRAWX15:begin 
		color<= 3'b000;
		x<= initxhort15  + xvert15;
		y<= initxvert15 + xvert15;
		end	
		
STARTX16: begin xhort16 <= 9'd0;
				xvert16 <= 9'd0;
				xchange16 <=1'd0;
				end
CHANGEX16: xchange16 <= plot;
MOVEXVERT16: xvert16 <= xvert16 + 1'd1; 
CHECKXVERT16: xhort16 <= 9'd0;
MOVEXHORT16: xhort16 <= xhort16 + 1'd1;
DRAWX16:begin 
		color<= 3'b000;
		x<= initxhort16 - xvert16;
		y<= initxvert16 + xvert16;
		end

STARTSQUARE8: begin xsquare8 <= 9'd0;
				ysquare8 <= 9'd0;
				changesquare8 <=1'd0;
				turn<=1'b1;
				turn2<=1'b0;
				p8<=2'd2;
				end
CHANGESQUARE8: changesquare8 <= plot;
MOVEYSQUARE8: ysquare8 <= ysquare8 + 1'd1; 
CHECKYSQUARE8: xsquare8 <= 9'd0;
MOVEXSQUARE8: xsquare8 <= xsquare8 + 1'd1;
DRAWSQUARE8:begin 
		color<= 3'b000;
		x<= initxsquare8 + xsquare8;
		y<= initysquare8 + ysquare8;
		end		


STARTX17: begin xhort17 <= 9'd0;
				xvert17 <= 9'd0;
				xchange17 <=1'd0;
				turn<=1'b0;
				turn2<=1'b1;
				p9<=2'd1;
				end
CHANGEX17: xchange17 <= plot;
MOVEXVERT17: xvert17 <= xvert17 + 1'd1; 
CHECKXVERT17: xhort17 <= 9'd0;
MOVEXHORT17: xhort17 <= xhort17 + 1'd1;
DRAWX17:begin 
		color<= 3'b000;
		x<= initxhort17  + xvert17;
		y<= initxvert17 + xvert17;
		end	
		
STARTX18: begin xhort18 <= 9'd0;
				xvert18 <= 9'd0;
				xchange18 <=1'd0;
				end
CHANGEX18: xchange18 <= plot;
MOVEXVERT18: xvert18 <= xvert18 + 1'd1; 
CHECKXVERT18: xhort18 <= 9'd0;
MOVEXHORT18: xhort18 <= xhort18 + 1'd1;
DRAWX18:begin 
		color<= 3'b000;
		x<= initxhort18 - xvert18;
		y<= initxvert18 + xvert18;
		end
		
		
STARTSQUARE9: begin xsquare9 <= 9'd0;
				ysquare9 <= 9'd0;
				changesquare9 <=1'd0;
				turn<=1'b1;
				turn2<=1'b0;
				p9<=2'd2;
				end
CHANGESQUARE9: changesquare9 <= plot;
MOVEYSQUARE9: ysquare9 <= ysquare9 + 1'd1; 
CHECKYSQUARE9: xsquare9 <= 9'd0;
MOVEXSQUARE9: xsquare9 <= xsquare9 + 1'd1;
DRAWSQUARE9:begin 
		color<= 3'b000;
		x<= initxsquare9 + xsquare9;
		y<= initysquare9 + ysquare9;
		end		

endcase
end
end
endmodule

