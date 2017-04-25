library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity inverter is
		
	port(
		enable : in std_logic := '0';
		input : in std_logic_vector (7 downto 0);
		output : out std_logic_vector (7 downto 0)
	);
	
end entity;

architecture behavior of inverter is
	
begin
--	process
--		(clk)
--	begin
--		if (enable = '1') then
--			for i in 0 to size-1 loop 
--				output(i) <= input ((size-1)-i);
--			end loop;
--		elsif (enable = '0') then
--			output <= (others => '0');
--		end if;
--	end process;
	
output(0) <= input(7);
output(1) <= input(6);
output(2) <= input(5);
output(3) <= input(4);
output(4) <= input(3);
output(5) <= input(2);
output(6) <= input(1);
output(7) <= input(0);

	
end behavior;