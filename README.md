# Tic-Tac-Toe

Authors: Blake Apathy & Tucker Schurig

Class: ECE 287 - Digital System Design

Topic: Tic-Tac-Toe with a 2 Player mode & versus AI (3 modes: easy,medium,hard)

Description Of Topic: 

The purpose of this project is to use the FPGA board to project a playable tic-tac-toe game onto a screen using the VGA. The user can play versus another by them both flipping switches on the FPGA board to declare a move. Also, the user can play against an AI bot of hard, medium, or easy difficulty by pressing one of the buttons.


Background Information:

The idea of tic-tac-toe is very popular and we are sure that everyone knows the basic concepts on how to play the game. The tic-tac-toe algorithm that we implemented, as explained here, takes in a user input by flipping one of the first nine switches and project an X to a position on the displayed board. Then depending on what mode you would like to do play if you would like to play against another user, the second user would then represent O's and take control of the second nine switches. However, if the user would like to play against An AI they would select the 2nd button for the hard difficulty, the 3rd button for medium difficulty, and the 4th button for easy difficulty. Finally once a winner is detected in whatever style you decide to play, you must press the reset button, which is button 1 to restart the game. There is 8 different possible winning combinations to end the game. 

Modular Design: 

This project was implemented using 4 Verilog (.v) files:

projectvga.v: This is our top level entity, it holds all of the major code for our project. It instantiates our vgadadapter module for getting input and displaying it to the screen. It also contains our code inside a FSM for our tic-tac-toe board, shapes, and the logic behind our entire game including the different modes, how to detect turns, and when to detect a winner. 

vga_adapter.v: The adapter uses VGA mode signalling to initiate the 640x480 resolution mode on a computer monitor, with a refresh rate of approximately 60Hz. It is designed for easy use in an early digital logic design course to facilitate student projects on the Altera DE2 Educational board. This implementation of the VGA adapter can display images of varying colour depth at a resolution of 320x240 or 160x120 superpixels. (Taken from the description listed on the vga_adapter.v file)

vga_address_translator.v: This module converts a user specified coordinates into a memory address. (Taken from descrption on vga_address_translator.v file)

vga_controller.v: This module implements the VGA controller. It assumes a 25MHz clock is supplied as input. (Taken from descrption on vga_controller.v file)


Summary On How to Use the Design:

1. Compile the design and upload it to the FPGA. To better understand our design (SW17(X) & SW8(O) correspong to Position 1,etc)

2. The way our positions are set up is like this :
--------------------
|  1  |   2   |  3 |
--------------------
|  4  |   5   |  6 |
--------------------
|  7  |   8   |  9 |
--------------------
3. Choose what AI difficulty you would like to play against by selecting the corresponding button (KEY2 = hard, KEY1 = medium, KEY0 = easy) or do not press any button to keep it in the player versus player mode. 

4. PLAYER VS PLAYER : Player 1 (X's) always will have the first move, so they must give input for a position on the board by flipping one of the first nine switches(SW17-SW9), once flipping one of these switches your X will be displayed in the corresponding position on the tic-tac-toe board. However, before Player 2 is allowed to make a move, Player 1 must turn whatever switch they selected back to low. Once Player 1 flips their selected switch back to low, PLayer 2 (O's) can then make their move by flipping one of the second nine switches (SW8-SW0) to display the O in the corresponding position. Similar to Player 1 being required to flip their selected switch back to low in order for Player 2 to being able to make a move, Player 2 must do the same. Repeat this until a winner is detected

5. PLAYER VS AI : Player 1 (X's) again will always have the first move, similarly as described in the PLAYER VS PLAYER mode, Player 1 is allowed to choose one of the first nine switches to map their X on the tic-tac-toe board. Again, as stated in the PLAYER VS PLAYER state before selecting which AI to face, you must turn whichever switch you turned high back to low. After turning this switch to low, you can select which mode you would like to play against either hard, medium, or easy. Once selecting whatever AI you would like to play against, it will place an O in whatever position it deems necessary on the board. You then return to Player 1's turn and select whatever postion you would like to play your X in. Again turn the selected switch low again in order to move to the AI's turn. Press the corresponding AI difficulty button in order for the AI to place its next O. Repeat this process until a winner is detected.

6. Once a winner is detected, you will no longer be able to place X's or O's on the board. If you would like to play again press the reset button (KEY=3) and as described in step 3 choose decide whatever mode you would like to play. In addition, if you would ever like to restart in the middle of a game, you can also press the reset button. The winning combinations are as followed ([1,2,3] ; [4,5,6] ; [7,8,9] ; [1,5,9] ; [3,5,7] ; [1,4,7] ; [2,5,8] ; [3,6,9]).

7. We hope you enjoyed playing our game !



Here are videos on how to play the different modes of our game :
(2 Player: )
(Hard AI: )
(Medium AI: )
(Easy AI: )

Citations:
1. We recieved our projectVGA.qsf file, which included the vga_address_translation.v file, vga_controller.v file , and vga_adapter.v file from Lukas Tackett who recieved it from Chris Lallo.
2. We would like to give a special thanks to Lukas Tackett, who was very helpful to us during our journey in creating this project. He offered guidance and helped us troubleshoot some problems we encountered along the way.




