library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tx_reg is

	

	port 
	(
		clk_baud	: in std_logic;
		sending	: in std_logic;
		par_in	: in std_logic_vector (7 downto 0);
		sr_out	: out std_logic;
		rst 		: in std_logic
	);

end entity;

architecture rtl of tx_reg is

	-- Build an array type for the shift register
	--type sr_length is array ((size-1) downto 0) of std_logic;

	-- Declare the shift register signal
	signal sr: std_logic_vector(9 downto 0);

begin

	process (clk_baud, rst, par_in)
	begin
		if (rst = '0') then
			sr <= "1111111111";
		else
			if (sending = '0') then
				sr(8 downto 1) <= par_in;
				sr(0) <= '1';
				sr(9) <= '0';
			elsif ((falling_edge(clk_baud)) and sending = '1') then
				sr <= sr(8 downto 0) & '1';
			end if;
		end if;
	end process;
	sr_out <= sr(9) when (sending = '1') else '1';

end rtl;
