library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity inverter is
	
	generic(size : natural := 8);
	
	port(
		clk : in std_logic := '0';
		enable : in std_logic := '0';
		input : in std_logic_vector ((size-1) downto 0);
		output : out std_logic_vector ((size-1) downto 0)
	);
	
end entity;

architecture behavior of inverter is

	signal zero : std_logic_vector ((size-1) downto 0);
	
begin
	zero <= conv_std_logic_vector(0, size);
	process
		(clk)
	begin
		if (enable = '1') then
			for i in 0 to size-1 loop 
				output(i) <= input ((size-1)-i);
			end loop;
		elsif (enable = '0') then
			output <= zero;
		end if;
	end process;
end behavior;