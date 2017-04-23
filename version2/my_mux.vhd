LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY my_mux IS 
PORT 
( 
	data	:	IN	 STD_LOGIC_VECTOR(1 DOWNTO 0);
	sel	:	IN	 STD_LOGIC := '0';
	result	:	OUT	 STD_LOGIC
); 
END my_mux;
ARCHITECTURE rtl OF my_mux IS 

signal tmp : std_logic;


BEGIN 

process (sel) is
begin

	if (sel = '0') then
		tmp <= data(0);
	elsif (sel = '1') then
		tmp <= data(1);
	else
		tmp <= 'Z';
	end if;
	
end process;

result <= tmp;

END rtl; 

