# FPGA Whack-A-Mole
Accelerometer-based whack-a-mole game that can be played on an FPGA board. Specifically, this one was designed for the DE10-Lite board.
3 rounds for whacking the mole with a countdown timer. At the end of the 3 rounds, your scores are read back to you and loop until you reset the game.
Use Button to whack the mole.

# Design
Used a finite state machine to determine when the game started, the game being played, if the mole is pressed, and next round, and reading the scores back to the player.
Filtering and outputting to HEX displays
