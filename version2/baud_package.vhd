library ieee;
use ieee.std_logic_1164.all;

package baud_generator is
	component clock_generator
		
		generic(
			baudrate : integer := 9600 -- 9600 is 0010010110000000, 115200 is 11100001000000000
		);
		
		port (
			clk_source, freq_sel, rst : in std_logic;
			clk_baud, clk_baud16 : out std_logic
		);
		
	end component;
end package baud_generator;
