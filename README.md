# Tic-Tac-Toe

Authors: Blake Apathy & Tucker Schurig

Class: ECE 287 - Digital System Design

Topic: Tic-Tac-Toe with a 2 Player mode & versus AI (3 modes: easy,medium,hard)

Description Of Topic: 

The purpose of this project is to use the FPGA board to project a playable tic-tac-toe game onto a screen using the VGA. The user can play versus another by them both flipping switches on the FPGA board to declare a move. ALso, the user can play against an AI bot of hard, medium, or easy difficulty by pressing one of the buttons.


Background Information:

The idea of tic-tac-toe is very popular and we are sure that everyone knows the basic concepts on how to play the game. The tic-tac-toe algorithm that we implemented, as explained here, takes in a user input by flipping one of the first nine switches and project a X to a position on the displayed board. Then depending on what mode you would like to do play if you would like to play against another user, the second user would then represent O's and take control of the second nine switches. However, if the user would like to play against An AI they would select the 2nd button for the hard difficulty, the 3rd button for medium difficulty, and the 4th button for easy difficulty. Finally once a winner is detected in whatever style you decide to play, you must press the reset button, which is button 1 to restart the game. There is 8 different possible winning combinations to end the game.

Modular Design: 

This project was implemented using 5 Verilog (.v) files:

projectvga.v: This is our top level entity, it holds all of the major code for our project. It instantiates our vgadadapter module for getting input and displaying it to the screen. It also contains our code inside a FSM for our tic-tac-toe board, shapes, and the logic behind our entire game including the different modes, how to detect turns, and when to detect a winner. 

Summary On How to Use the Design:

1. Compile the design and upload it to the FPGA
2. Choose what AI difficulty you would like to play against by selecting the corresponding button (KEY2 = hard, KEY1 = medium, KEY0 = easy) or do not press any button to keep it in the player versus. player mode. 
3. Player 1 (X's) always will have the first move, so they must give input for a position on the board by flipping one of the first nine switches(SW17-SW9), once flipping one of these switches your X will be displayed in the corresponding position on the tic-tac-toe board. However, before Player 2 is allowed to make a move, Player 1 must turn whatever switch they selected back to low. Once Player 1 flips their selected switch back to low, PLayer 2 (O's) can then make their move by flipping one of the second nine switches (SW8-SW0) to display the O in the corresponding position. Similar to Player 1 being required to flip their selected switch back to low in order for Player 2 to being able to make a move, Player 2 must do the same. 
4. 




Here are videos on how to play the different modes of our game :
(2 Player: )
(Hard AI: )
(Medium AI: )
(Easy AI: )





