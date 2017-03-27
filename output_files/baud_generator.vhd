library ieee;
use ieee.std_logic_1164.all;

package baud_generator is
	component clock_generator
		port (
			clk_source, freq_sel, rst : in std_logic;
			clk_baud, clk_baud16 : out std_logic
		);
	end component;
end package baud_generator;

library ieee;
use ieee.std_logic_1164.all;

entity generator is

	port (
		clk_source, freq_sel, rst : in std_logic;
		clk_baud, clk_baud16 : out std_logic
	);
	
end entity;

architecture behavior of generator is

	signal ctr : std_logic_vector (16 downto 0) := "00000000000000000";

begin

	process (clk_source, rst)
	begin
		if rising_edge(rst) then
			
		
		if rising_edge(clk_source)
		
	end process;
	

end behavior;