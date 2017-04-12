library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity s_reg is

	generic
	(
		size : natural := 8
	);

	port 
	(
		clk		: in std_logic;
		enable	: in std_logic;
		sr_in	   : in std_logic;
		sr_out	: out std_logic_vector((size-1) downto 0);
		rst 		: in std_logic
	);

end entity;

architecture rtl of s_reg is

	-- Build an array type for the shift register
	--type sr_length is array ((size-1) downto 0) of std_logic;

	-- Declare the shift register signal
	signal sr: std_logic_vector((size-1) downto 0);

begin

	process (clk, rst)
	begin
		if (rst = '0') then
			sr <= conv_std_logic_vector(0, size);
		elsif (falling_edge(clk)) then

			if (enable = '1') then

				-- Shift data by one stage; data from last stage is lost
				sr <= sr((size-2) downto 0) & sr_in;
			end if;
		end if;
	end process;

	-- Capture the data from the last stage, before it is lost
	sr_out <= sr;

end rtl;
