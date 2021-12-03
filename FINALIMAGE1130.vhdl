--------------------------------------------------------------------------------
--
--   FileName:         hw_image_generator.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 12.1 Build 177 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 05/10/2013 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hw_image_generator IS
	GENERIC(
		pixels_y :	INTEGER := 1200;    --row that first color will persist until
		pixels_x	:	INTEGER := 1050);   --column that first color will persist until

	
	PORT(
		disp_ena		:	IN		STD_LOGIC;	--display enable ('1' = display time, '0' = blanking time)
		row			:	IN		INTEGER;		--row pixel coordinate
		column		:	IN		INTEGER;		--column pixel coordinate
		red			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
		green			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
		blue			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')); --blue magnitude output to DAC
	

END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS
BEGIN

      TYPE xScoordx IS ARRAY(0 to 6) OF integer;
      SIGNAL Scoordx : xScoordx;
      TYPE xFcoordx IS ARRAY(0 to 6) OF integer;
      SIGNAL Fcoordx : xFcoordx;
      TYPE yScoordy IS ARRAY(0 to 5) OF integer;
      SIGNAL Scoordy: yScoordy;
      TYPE yFcoordy IS ARRAY(0 to 5) OF integer;
      SIGNAL Fcoordy : yFcoordy;
      TYPE tXtakencoords IS ARRAY(0 to 6) OF integer;
      SIGNAL Xtakencoords : tXtakencoords;
      TYPE tYtakencoords IS ARRAY(0 to 5) OF integer;
      SIGNAL Ytakencoords : tYtakencoords;
	
	PROCESS(disp_ena, row, column)
	BEGIN
      Scoordx <= (25, 150, 275, 400, 525, 650, 775); -- Horizontal pixel constraints start
      Fcoordx <= (125, 250, 375, 500, 625, 750, 875);  -- Horizontal pixel contraints end
      Scoordy <= (50, 250, 450, 650, 850, 1050); 		-- Vertical pixel constraints start
      Fcoordy <= (150, 350, 550, 750, 950, 1150);     -- Vertical pixel contraints end
      
      
		IF(disp_ena = '1') THEN		--display time
			IF(row < pixels_y AND column < pixels_x) THEN
         
				 FOR I in   Xtakencoords loop 
               FOR J in Ytakencoords loop
                  IF (Xtakendcoords(I) = "1" AND Ytakencoords(J) = "1") THEN
                     IF (pixels_y > Scoordy(I) AND pixels_y < Fcoordy(I) AND pixels_x < Scoordx(I) AND pixels_x > Fcoordx(I) ) THEN
                        
					         red <= (OTHERS => '1');    -- Inside Player 1's red spots.
				            green	<= (OTHERS => '0');
				            blue <= (OTHERS => '0');
                     END IF;
                  ELSE IF (Xtakencoords(I) = "2" AND Ytakencoords(J) = "2") THEN
                     IF (pixels_y > Scoordy(I) AND pixels_y < Fcoordy(I) AND pixels_x < Scoordx(I) AND pixels_x > Fcoordx(I)) THEN
                     
                       red <= (OTHERS => '1');     -- Inside Player 2's yellow spots
				            green	<= (OTHERS => '1');
				            blue <= (OTHERS => '0');
								END IF;
                  ELSE 
                     IF (pixels_y > Scoordy(I) AND pixels_y < Fcoordy(I) AND pixels_x < Scoordx(I) AND pixels_x > Fcoordx(I)) THEN
                        
				              red <= (OTHERS => '1');     -- Inside blank spots
				            green	<= (OTHERS => '1');
				            blue <= (OTHERS => '1');
                      ELSE                            -- The borders between spots
                        red <= (OTHERS => '0');
				            green	<= (OTHERS => '0');
				            blue <= (OTHERS => '1');
                     END IF;
						END IF;
                J <= J + 1;
					 END IF;
					 END LOOP;
             I <= I + 1;
				 END LOOP;
     
				
				
				
			
		ELSE								--blanking time
			red <= (OTHERS => '0');
			green <= (OTHERS => '0');
			blue <= (OTHERS => '0');
		END IF;
		END IF;
	
	END PROCESS;
END behavior;