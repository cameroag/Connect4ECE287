LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

-- Entity(Not determined)
entity Connect4 is
port(
-- Used to select cols
sw0, sw1, sw2, sw3, sw4, sw5, sw6 : in STD_LOGIC;
-- Alert for unusal transactions
LED: out STD_LOGIC
);
end Connect4;
--
-- Architecture
architecture Behavior of Connect4 is
-- Check the game status
signal Ongame : boolean := false;
-- For player1
-- Count rows for PL1
signal P1R0 : std_logic_vector(6 downto 0) := "0000000";
signal P1R1 : std_logic_vector(6 downto 0) := "0000000";
signal P1R2 : std_logic_vector(6 downto 0) := "0000000";
signal P1R3 : std_logic_vector(6 downto 0) := "0000000";
signal P1R4 : std_logic_vector(6 downto 0) := "0000000";
signal P1R5 : std_logic_vector(6 downto 0) := "0000000";
-- Count Cols for PL1
signal P1C0 : std_logic_vector(5 downto 0) := "000000";
signal P1C1 : std_logic_vector(5 downto 0) := "000000";
signal P1C2 : std_logic_vector(5 downto 0) := "000000";
signal P1C3 : std_logic_vector(5 downto 0) := "000000";
signal P1C4 : std_logic_vector(5 downto 0) := "000000";
signal P1C5 : std_logic_vector(5 downto 0) := "000000";
signal P1C6 : std_logic_vector(5 downto 0) := "000000";
-- For player2
-- Count rows for PL2
signal P2R0 : std_logic_vector(6 downto 0) := "0000000";
signal P2R1 : std_logic_vector(6 downto 0) := "0000000";
signal P2R2 : std_logic_vector(6 downto 0) := "0000000";
signal P2R3 : std_logic_vector(6 downto 0) := "0000000";
signal P2R4 : std_logic_vector(6 downto 0) := "0000000";
signal P2R5 : std_logic_vector(6 downto 0) := "0000000";
-- Count Cols for PL2
signal P2C0 : std_logic_vector(5 downto 0) := "000000";
signal P2C1 : std_logic_vector(5 downto 0) := "000000";
signal P2C2 : std_logic_vector(5 downto 0) := "000000";
signal P2C3 : std_logic_vector(5 downto 0) := "000000";
signal P2C4 : std_logic_vector(5 downto 0) := "000000";
signal P2C5 : std_logic_vector(5 downto 0) := "000000";
signal P2C6 : std_logic_vector(5 downto 0) := "000000";
-- The whole board
-- Rows
signal R0 : std_logic_vector(6 downto 0) := "0000000";
signal R1 : std_logic_vector(6 downto 0) := "0000000";
signal R2 : std_logic_vector(6 downto 0) := "0000000";
signal R3 : std_logic_vector(6 downto 0) := "0000000";
signal R4 : std_logic_vector(6 downto 0) := "0000000";
signal R5 : std_logic_vector(6 downto 0) := "0000000";
-- Cols
signal C0 : std_logic_vector(5 downto 0) := "000000";
signal C1 : std_logic_vector(5 downto 0) := "000000";
signal C2 : std_logic_vector(5 downto 0) := "000000";
signal C3 : std_logic_vector(5 downto 0) := "000000";
signal C4 : std_logic_vector(5 downto 0) := "000000";
signal C5 : std_logic_vector(5 downto 0) := "000000";
signal C6 : std_logic_vector(5 downto 0) := "000000";
begin
checkWin : process(sw0, sw1, sw2, sw3, sw4, sw5, sw6) is
-- turn 0 is PL1, 1 is PL2
variable turn : integer range 0 to 2 := 0;
-- Count for turns, if tie
variable counter : integer := 1;
variable rowNum : integer := 0;
begin
report "Welcome to Connect 4. To play, flip switches 0-6 to choose a column and take the lowest available spot.";
wait 3 sec;
while (Ongame = true) loop
-- Player1's turn
if(turn = 0) then
report "it is Player 1's turn, please flip a switch and wait.";
wait 5 sec;
if(sw0 = '1' and sw1 = '0' and sw2 = '0' and sw3 = '0' and sw4 = '0' and sw5 = '0' and sw6 = '0')
then
for i in 0 to 5 loop
if (C0(i) = '0') then
P1C0(i) <= '1';
C0(i) <= '1';
rowNum := i;
report "Column 0 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another.";
end if;
end loop;
if(rowNum = 0) then
P1R0(0) <= '1';
R0(0) <= '1';
report "Player 1 takes spot 0,0";
elsif(rowNum = 1) then
P1R1(0) <= '1';
R1(0) <= '1';
report "Player 1 takes spot 0,1";
elsif(rowNum = 2) then
P1R2(0) <= '1';
R2(0) <= '1';
report "Player 1 takes spot 0,2";
elsif(rowNum = 3) then
P1R3(0) <= '1';
R3(0) <= '1';
report "Player 1 takes spot 0,3";
elsif(rowNum = 4) then
P1R4(0) <= '1';
R4(0) <= '1';
report "Player 1 takes spot 0,4";
else 
P1R5(0) <= '1';
R5(0) <= '1';
report "Player 1 takes spot 0,5";
end if;
elsif(sw0 = '0' and sw1 = '1' and sw2 = '0' and sw3 = '0' and sw4 = '0' and sw5 = '0' and sw6 = '0')
then
for i in 0 to 5 loop
if (C1(i) = '0') then
P1C1(i) <= '1';
C1(i) <= '1';
rowNum := i;
report "Column 1 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another.";
end if;
end loop;
if(rowNum = 0) then
P1R0(1) <= '1';
R0(1) <= '1';
report "Player 1 takes spot 1,0";
elsif(rowNum = 1) then
P1R1(1) <= '1';
R1(1) <= '1';
report "Player 1 takes spot 1,1";
elsif(rowNum = 2) then
P1R2(1) <= '1';
R2(1) <= '1';
report "Player 1 takes spot 1,2";
elsif(rowNum = 3) then
P1R3(1) <= '1';
R3(1) <= '1';
elsif(rowNum = 4) then
P1R4(1) <= '1';
R4(1) <= '1';
report "Player 1 takes spot 1,4";
else
P1R5(1) <= '1';
R5(1) <= '1';
report "Player 1 takes spot 1,5";
end if;
elsif(sw0 = '0' and sw1 = '0' and sw2 = '1' and sw3 = '0' and sw4 = '0' and sw5 = '0' and sw6 = '0')
then
for i in 0 to 5 loop
if (C2(i) = '0') then
P1C2(i) <= '1';
C2(i) <= '1';
rowNum := i;
report "Column 2 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another.";
end if;
end loop;
if(rowNum = 0) then
P1R0(2) <= '1';
R0(2) <= '1';
report "Player 1 takes spot 2,0";
elsif(rowNum = 1) then
P1R1(2) <= '1';
R1(2) <= '1';
"Player 1 takes spot 2,1"
elsif(rowNum = 2) then
P1R2(2) <= '1';
R2(2) <= '1';
report "Player 1 takes spot 2,2";
elsif(rowNum = 3) then
P1R3(2) <= '1';
R3(2) <= '1';
report "Player 1 takes spot 2,3";
elsif(rowNum = 4) then
P1R4(2) <= '1';
R4(2) <= '1';
report "Player 1 takes spot 2,4";
else
P1R5(2) <= '1';
R5(2) <= '1';
report "Player 1 takes spot 2,5";
end if;
elsif(sw0 = '0' and sw1 = '0' and sw2 = '0' and sw3 = '1' and sw4 = '0' and sw5 = '0' and sw6 = '0')
then
for i in 0 to 5 loop
if(C3(i) = '0') then
P1C3(i) <= '1';
C3(i) <= '1';
rowNum := i;
report "Column 3 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another";
end if;
end loop;
if(rowNum = 0) then
P1R0(3) <= '1';
R0(3) <= '1';
report "Player 1 takes spot 3,0";
elsif(rowNum = 1) then
P1R1(3) <= '1';
R1(3) <= '1';
report "Player 1 takes spot 3,1";
elsif(rowNum = 2) then
P1R2(3) <= '1';
R2(3) <= '1';
report "Player 1 takes spot 3,2";
elsif(rowNum = 3) then
P1R3(3) <= '1';
R3(3) <= '1';
report "Player 1 takes spot 3,3";
elsif(rowNum = 4) then
P1R4(3) <= '1';
R4(3) <= '1';
report "Player 1 takes spot 3,4";
else
P1R5(3) <= '1';
R5(3) <= '1';
report "Player 1 takes spot 3,5";
end if;
elsif(sw0 = '0' and sw1 = '0' and sw2 = '0' and sw3 = '0' and sw4 = '1' and sw5 = '0' and sw6 = '0')
then
for i in 0 to 5 loop
if (C4(i) = '0') then
P1C4(i) <= '1';
C4(i) <= '1';
rowNum := i;
report "Column 4 selected";
exit;
else
-- The Col is full
LED <= '1';

end if;
end loop;
if(rowNum = 0) then
P1R0(4) <= '1';
R0(4) <= '1';
report "Player 1 takes spot 4,0";
elsif(rowNum = 1) then
P1R1(4) <= '1';
R1(4) <= '1';
report "Player 1 takes spot 4,1";
elsif(rowNum = 2) then
P1R2(4) <= '1';
R2(4) <= '1';
report "Player 1 takes spot 4,2";
elsif(rowNum = 3) then
P1R3(4) <= '1';
R3(4) <= '1';
report "Player 1 takes spot 4,3";
elsif(rowNum = 4) then
P1R4(4) <= '1';
R4(4) <= '1';
report "Player 1 takes spot 4,4";
else
P1R5(4) <= '1';
R5(4) <= '1';
report "Player 1 takes spot 4,5";
end if;
elsif(sw0 = '0' and sw1 = '0' and sw2 = '0' and sw3 = '0' and sw4 = '0' and sw5 = '1' and sw6 = '0')
then
for i in 0 to 5 loop
if (C5(i) = '0') then
P1C5(i) <= '1';
C5(i) <= '1';
rowNum := i;
report "Column 5 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another";
end if;
end loop;
if(rowNum = 0) then
P1R0(5) <= '1';
R0(5) <= '1';
 report "Player 1 takes spot 5,0";
elsif(rowNum = 1) then
P1R1(5) <= '1';
R1(5) <= '1';
report "Player 1 takes spot 5,1";
elsif(rowNum = 2) then
P1R2(5) <= '1';
R2(5) <= '1';
report "Player 1 takes spot 5,2";
elsif(rowNum = 3) then
P1R3(5) <= '1';
R3(5) <= '1';
report "Player 1 takes spot 5,3";
elsif(rowNum = 4) then
P1R4(5) <= '1';
R4(5) <= '1';
report "Player 1 takes spot 5,4";
else
P1R5(5) <= '1';
R5(5) <= '1';
report "Player 1 takes spot 5,5";
end if;
elsif(sw0 = '0' and sw1 = '0' and sw2 = '0' and sw3 = '0' and sw4 = '0' and sw5 = '0' and sw6 = '1')
then
for i in 0 to 5 loop
if (C6(i) = '0') then
P1C6(i) <= '1';
C6(i) <= '1';
rowNum := i;
Report "Column 6 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another";
end if;
end loop;
if(rowNum = 0) then
P1R0(6) <= '1';
R0(6) <= '1';
report "Player 1 takes spot 6,0";
elsif(rowNum = 1) then
P1R1(6) <= '1';
R1(6) <= '1';
report "Player 1 takes spot 6,1";
elsif(rowNum = 2) then
P1R2(6) <= '1';
R2(6) <= '1';
report "Player 1 takes spot 6,2";
elsif(rowNum = 3) then
P1R3(6) <= '1';
R3(6) <= '1';
report "Player 1 takes spot 6,3";
elsif(rowNum = 4) then
P1R4(6) <= '1';
R4(6) <= '1';
report "Player 1 takes spot 6,4";
else
P1R5(6) <= '1';
R5(6) <= '1';
report "Player 1 takes spot 6,5";
end if;
else
-- more than 1 '1', should alert
LED <= '1';
report "More than one 1 (On player 1's turn)";
end if;
-- Horizontal Check
for j in 0 to 3 loop
if((P1R0(j) = '1') and (P1R0(j+1) = '1') and (P1R0(j+2) = '1') and (P1R0(j+3) = '1'))
or ((P1R1(j) = '1') and (P1R1(j+1) = '1') and (P1R1(j+2) = '1') and (P1R1(j+3) = '1'))
or ((P1R2(j) = '1') and (P1R2(j+1) = '1') and (P1R2(j+2) = '1') and (P1R2(j+3) = '1')) 
or ((P1R3(j) = '1') and (P1R3(j+1) = '1') and (P1R3(j+2) = '1') and (P1R3(j+3) = '1'))
or ((P1R4(j) = '1') and (P1R4(j+1) = '1') and (P1R4(j+2) = '1') and (P1R4(j+3) = '1'))
or ((P1R5(j) = '1') and (P1R5(j+1) = '1') and (P1R5(j+2) = '1') and (P1R5(j+3) = '1')) 
then
-- Should show on screen
report "PL1 WINS";
Ongame <= false;
end if;
end loop;
-- Vertical Check
for i in 0 to 2 loop
if((P1C0(i) = '1') and (P1C0(i+1) = '1') and (P1C0(i+2) = '1') and (P1C0(i+3) = '1')) 
or ((P1C1(i) = '1') and (P1C1(i+1) = '1') and (P1C1(i+2) = '1') and (P1C1(i+3) = '1')) 
or ((P1C2(i) = '1') and (P1C2(i+1) = '1') and (P1C2(i+2) = '1') and (P1C2(i+3) = '1'))
or ((P1C3(i) = '1') and (P1C3(i+1) = '1') and (P1C3(i+2) = '1') and (P1C3(i+3) = '1'))
or ((P1C4(i) = '1') and (P1C4(i+1) = '1') and (P1C4(i+2) = '1') and (P1C4(i+3) = '1'))
or ((P1C5(i) = '1') and (P1C5(i+1) = '1') and (P1C5(i+2) = '1') and (P1C5(i+3) = '1'))
or ((P1C6(i) = '1') and (P1C6(i+1) = '1') and (P1C6(i+2) = '1') and (P1C6(i+3) = '1'))
then
-- Should show on screen
report "PL1 WINS";
Ongame <= false;
end if;
end loop;
-- Diagonal Check 
-- Check for diagonal "\"
for i in 0 to 3 loop
if((P1R0(i) = '1') and (P1R1(i+1) = '1') and (P1R2(i+2) = '1') and (P1R3(i+3) = '1')) 
or ((P1R1(i) = '1') and (P1R2(i+1) = '1') and (P1R3(i+2) = '1') and (P1R4(i+3) = '1')) 
or ((P1R2(i) = '1') and (P1R3(i+1) = '1') and (P1R4(i+2) = '1') and (P1R5(i+3) = '1')) 
then
-- Should show on screen
report "PL1 WINS";
Ongame <= false;
end if;
end loop;
-- Check for diagonal "/"
for i in 3 to 6 loop
if((P1R0(i) = '1') and (P1R1(i-1) = '1') and (P1R2(i-2) = '1') and (P1R3(i-3) = '1')) 
or ((P1R1(i) = '1') and (P1R2(i-1) = '1') and (P1R3(i-2) = '1') and (P1R4(i-3) = '1')) 
or ((P1R2(i) = '1') and (P1R3(i-1) = '1') and (P1R4(i-2) = '1') and (P1R5(i-3) = '1')) 
then
-- Should show on screen
report "PL1 WINS";
Ongame <= false;
end if;
end loop;
--- Check for tie
if(counter = 42) then
-- Should show on screen
report "TIE";
Ongame <= false;
end if;
counter := counter + 1;
end if;
-- Player2's turn
if(turn = 1) then
report "It is Player 2's turn. Please flip a switch and wait."
wait 5 sec;
if(sw0 = '1' and sw1 = '0' and sw2 = '0' and sw3 = '0' and sw4 = '0' and sw5 = '0' and sw6 = '0')
then
for i in 0 to 5 loop
if (C0(i) = '0') then
P2C0(i) <= '1';
C0(i) <= '1';
rowNum := i;
report "Column 0 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another";
end if;
end loop;
if(rowNum = 0) then
P2R0(0) <= '1';
R0(0) <= '1';
report "Player 2 takes spot 0,0";
elsif(rowNum = 1) then
P2R1(0) <= '1';
R1(0) <= '1';
report "Player 2 takes spot 0,1";
elsif(rowNum = 2) then
P2R2(0) <= '1';
R2(0) <= '1';
report "Player 2 takes spot 0,2";
elsif(rowNum = 3) then
P2R3(0) <= '1';
R3(0) <= '1';
report "Player 2 takes spot 0,3";
elsif(rowNum = 4) then
P2R4(0) <= '1';
R4(0) <= '1';
report "Player 2 takes spot 0,4";
else 
P2R5(0) <= '1';
R5(0) <= '1';
report "Player 2 takes spot 0,5";
end if;
elsif(sw0 = '0' and sw1 = '1' and sw2 = '0' and sw3 = '0' and sw4 = '0' and sw5 = '0' and sw6 = '0')
then
for i in 0 to 5 loop
if (C1(i) = '0') then
P2C1(i) <= '1';
C1(i) <= '1';
rowNum := i;
report "Column 1 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another";
end if;
end loop;
if(rowNum = 0) then
P2R0(1) <= '1';
R0(1) <= '1';
report "Player 2 takes spot 1,0";
elsif(rowNum = 1) then
P2R1(1) <= '1';
R1(1) <= '1';
report "Player 2 takes spot 1,1";
elsif(rowNum = 2) then
P1R2(1) <= '1';
R2(1) <= '1';
report "Player 2 takes spot 1,2";
elsif(rowNum = 3) then
P2R3(1) <= '1';
R3(1) <= '1';
report "Player 2 takes spot 1,3";
elsif(rowNum = 4) then
P2R4(1) <= '1';
R4(1) <= '1';
report "Player 2 takes spot 1,4";
else
P2R5(1) <= '1';
R5(1) <= '1';
report "Player 2 takes spot 1,5";
end if;
elsif(sw0 = '0' and sw1 = '0' and sw2 = '1' and sw3 = '0' and sw4 = '0' and sw5 = '0' and sw6 = '0')
then
for i in 0 to 5 loop
if (C2(i) = '0') then
P2C2(i) <= '1';
C2(i) <= '1';
rowNum := i;
report "Column 2 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another";
end if;
end loop;
if(rowNum = 0) then
P2R0(2) <= '1';
R0(2) <= '1';
report "Player 2 takes spot 2,0";
elsif(rowNum = 1) then
P2R1(2) <= '1';
R1(2) <= '1';
report "Player 2 takes spot 2,1";
elsif(rowNum = 2) then
P2R2(2) <= '1';
R2(2) <= '1';
report "Player 2 takes spot 2,2";
elsif(rowNum = 3) then
P2R3(2) <= '1';
R3(2) <= '1';
report "Player 2 takes spot 2,3";
elsif(rowNum = 4) then
P2R4(2) <= '1';
R4(2) <= '1';
report "Player 2 takes spot 2,4";
else
P2R5(2) <= '1';
R5(2) <= '1';
report "Player 2 takes spot 2,5";
end if;
elsif(sw0 = '0' and sw1 = '0' and sw2 = '0' and sw3 = '1' and sw4 = '0' and sw5 = '0' and sw6 = '0')
then
for i in 0 to 5 loop
if(C3(i) = '0') then
P2C3(i) <= '1';
C3(i) <= '1';
rowNum := i;
report "Column 3 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another";
end if;
end loop;
if(rowNum = 0) then
P2R0(3) <= '1';
R0(3) <= '1';
report "Player 2 takes spot 3,0";
elsif(rowNum = 1) then
P2R1(3) <= '1';
R1(3) <= '1';
report "Player 2 takes spot 3,1";
elsif(rowNum = 2) then
P2R2(3) <= '1';
R2(3) <= '1';
report "Player 2 takes spot 3,2";
elsif(rowNum = 3) then
P2R3(3) <= '1';
R3(3) <= '1';
report "Player 2 takes spot 3,3";
elsif(rowNum = 4) then
P2R4(3) <= '1';
R4(3) <= '1';
report "Player 2 takes spot 3,4";
else
P2R5(3) <= '1';
R5(3) <= '1';
report "Player 2 takes spot 3,5";
end if;
elsif(sw0 = '0' and sw1 = '0' and sw2 = '0' and sw3 = '0' and sw4 = '1' and sw5 = '0' and sw6 = '0')
then
for i in 0 to 5 loop
if (C4(i) = '0') then
P2C4(i) <= '1';
C4(i) <= '1';
rowNum := i;
report "Column 4 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another";
end if;
end loop;
if(rowNum = 0) then
P2R0(4) <= '1';
R0(4) <= '1';
report "Player 2 takes spot 4,0";
elsif(rowNum = 1) then
P1R1(4) <= '1';
R2(4) <= '1';
report "Player 2 takes spot 4,1";
elsif(rowNum = 2) then
P2R2(4) <= '1';
R2(4) <= '1';
report "Player 2 takes spot 4,2";
elsif(rowNum = 3) then
P2R3(4) <= '1';
R3(4) <= '1';
report "Player 2 takes spot 4,3";
elsif(rowNum = 4) then
P2R4(4) <= '1';
R4(4) <= '1';
report "Player 2 takes spot 4,4"
else
P2R5(4) <= '1';
R5(4) <= '1';
report "Player 2 takes spot 4,5";
end if;
elsif(sw0 = '0' and sw1 = '0' and sw2 = '0' and sw3 = '0' and sw4 = '0' and sw5 = '1' and sw6 = '0')
then
for i in 0 to 5 loop
if (C5(i) = '0') then
P2C5(i) <= '1';
C5(i) <= '1';
rowNum := i;
report "Column 5 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full, please choose another";
end if;
end loop;
if(rowNum = 0) then
P2R0(5) <= '1';
R0(5) <= '1';
report "Player 2 takes spot 5,0";
elsif(rowNum = 1) then
P2R1(5) <= '1';
R1(5) <= '1';
report "Player 2 takes spot 5,1";
elsif(rowNum = 2) then
P2R2(5) <= '1';
R2(5) <= '1';
report "Player 2 takes spot 5,2";
elsif(rowNum = 3) then
P2R3(5) <= '1';
R3(5) <= '1';
report "Player 2 takes spot 5,3";
elsif(rowNum = 4) then
P2R4(5) <= '1';
R4(5) <= '1';
report "Player 2 takes spot 5,4";
else
P2R5(5) <= '1';
R5(5) <= '1';
report "Player 2 takes spot 5,5";
end if;
elsif(sw0 = '0' and sw1 = '0' and sw2 = '0' and sw3 = '0' and sw4 = '0' and sw5 = '0' and sw6 = '1')
then
for i in 0 to 5 loop
if (C6(i) = '0') then
P2C6(i) <= '1';
C6(i) <= '1';
rowNum := i;
report "Column 6 selected";
exit;
else
-- The Col is full
LED <= '1';
report "This column is full";
end if;
end loop;
if(rowNum = 0) then
P2R0(6) <= '1';
R0(6) <= '1';
report "Player 2 takes spot 6,0";
elsif(rowNum = 1) then
P2R1(6) <= '1';
R1(6) <= '1';
report "Player 2 takes spot 6,1";
elsif(rowNum = 2) then
P2R2(6) <= '1';
R2(6) <= '1';
report "Player 2 takes spot 6,2";
elsif(rowNum = 3) then
P2R3(6) <= '1';
R3(6) <= '1';
report "Player 2 takes spot 6,3";
elsif(rowNum = 4) then
P2R4(6) <= '1';
R4(6) <= '1';
report "Player 2 takes spot 6,4";
else
P2R5(6) <= '1';
R5(6) <= '1';
report "Player 2 takes spot 6,5";
end if;
else
-- more than 1 '1', should alert
LED <= '1';
report "More than one 1 (On player 2's turn)";
end if;
-- Horizontal Check
for j in 0 to 3 loop
if((P2R0(j) = '1') and (P2R0(j+1) = '1') and (P2R0(j+2) = '1') and (P2R0(j+3) = '1'))
or((P2R1(j) = '1') and (P2R1(j+1) = '1') and (P2R1(j+2) = '1') and (P2R1(j+3) = '1'))
or((P2R2(j) = '1') and (P2R2(j+1) = '1') and (P2R2(j+2) = '1') and (P2R2(j+3) = '1')) 
or((P2R3(j) = '1') and (P2R3(j+1) = '1') and (P2R3(j+2) = '1') and (P2R3(j+3) = '1'))
or((P2R4(j) = '1') and (P2R4(j+1) = '1') and (P2R4(j+2) = '1') and (P2R4(j+3) = '1'))
or((P2R5(j) = '1') and (P2R5(j+1) = '1') and (P2R5(j+2) = '1') and (P2R5(j+3) = '1')) 
then
report "PL2 WINS";
Ongame <= false;
end if;
end loop;
-- Vertical Check
for i in 0 to 2 loop
if ((P2C0(i) = '1') and (P2C0(i+1) = '1') and (P2C0(i+2) = '1') and (P2C0(i+3) = '1')) 
or ((P2C1(i) = '1') and (P2C1(i+1) = '1') and (P2C1(i+2) = '1') and (P2C1(i+3) = '1')) 
or ((P2C2(i) = '1') and (P2C2(i+1) = '1') and (P2C2(i+2) = '1') and (P2C2(i+3) = '1'))
or ((P2C3(i) = '1') and (P2C3(i+1) = '1') and (P2C3(i+2) = '1') and (P2C3(i+3) = '1'))
or ((P2C4(i) = '1') and (P2C4(i+1) = '1') and (P2C4(i+2) = '1') and (P2C4(i+3) = '1'))
or ((P2C5(i) = '1') and (P2C5(i+1) = '1') and (P2C5(i+2) = '1') and (P2C5(i+3) = '1'))
or ((P2C6(i) = '1') and (P2C6(i+1) = '1') and (P2C6(i+2) = '1') and (P2C6(i+3) = '1'))
then
-- Should show on screen
report "PL2 WINS";
Ongame <= false;
end if;
end loop;
-- Diagonal Check 
-- Check for diagonal "\"
for i in 0 to 3 loop
if((P2R0(i) = '1') and (P2R1(i+1) = '1') and (P2R2(i+2) = '1') and (P2R3(i+3) = '1')) 
or ((P2R1(i) = '1') and (P2R2(i+1) = '1') and (P2R3(i+2) = '1') and (P2R4(i+3) = '1')) 
or ((P2R2(i) = '1') and (P2R3(i+1) = '1') and (P2R4(i+2) = '1') and (P2R5(i+3) = '1')) 
then
-- Should show on screen
report "PL2 WINS";
Ongame <= false;
end if;
end loop;
-- Check for diagonal "/"
for i in 3 to 6 loop
if((P2R0(i) = '1') and (P2R1(i-1) = '1') and (P2R2(i-2) = '1') and (P2R3(i-3) = '1')) 
or ((P2R1(i) = '1') and (P2R2(i-1) = '1') and (P2R3(i-2) = '1') and (P2R4(i-3) = '1')) 
or ((P2R2(i) = '1') and (P2R3(i-1) = '1') and (P2R4(i-2) = '1') and (P2R5(i-3) = '1')) 
then
-- Should show on screen
report "PL2 WINS";
Ongame <= false;
end if;
end loop;
-- Check for tie
if(counter = 42) then
-- Should show on screen
report "TIE";
Ongame <= false;
end if;
counter := counter + 1;
end if;
turn := turn + 1;
turn := turn mod 2;
end loop;
end process checkWin;
end Behavior;