library ieee;
use ieee.std_logic_1164.all;

package baud_generator is
	component clock_generator
		
		generic(
			baudrate : integer -- 9600 is 0010010110000000, 115200 is 11100001000000000
		);
		
		port (
			clk_source, freq_sel, rst : in std_logic;
			clk_baud, clk_baud16 : out std_logic
		);
		
	end component;
end package baud_generator;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity generator is

	generic(
		baudrate : integer
	);

	port (
		clk_source, freq_sel, rst : in std_logic;
		clk_baud, clk_baud16 : out std_logic
	);
	
end entity;

architecture behavior of generator is

	signal b_rate : std_logic_vector;
	signal ctr : std_logic_vector (16 downto 0) := "00000000000000000";

begin
	b_rate <= conv_std_logic_vector(baudrate, 17);
	process (clk_source, rst)
	begin
		if rising_edge(rst) then
			
		
		elsif rising_edge(clk_source) then
		
		end if;
		
	end process;
	

end behavior;