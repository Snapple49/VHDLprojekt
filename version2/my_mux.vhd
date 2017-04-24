LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY my_mux IS 
PORT 
( 
	data	:	IN	 STD_LOGIC_VECTOR(1 DOWNTO 0);
	sel	:	IN	 STD_LOGIC;
	result:	OUT STD_LOGIC
); 
END my_mux;
ARCHITECTURE rtl OF my_mux IS 

signal tmp : std_logic;


BEGIN 

	result <= data(0) when (sel = '0') else data(1);

END rtl; 

