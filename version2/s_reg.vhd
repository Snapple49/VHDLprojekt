library ieee;
use ieee.std_logic_1164.all;

entity s_reg is

	generic
	(
		NUM_STAGES : natural := 8
	);

	port 
	(
		clk		: in std_logic;
		enable	: in std_logic;
		sr_in	   : in std_logic;
		sr_out	: out std_logic_vector((NUM_STAGES-1) downto 0)
	);

end entity;

architecture rtl of s_reg is

	-- Build an array type for the shift register
	--type sr_length is array ((NUM_STAGES-1) downto 0) of std_logic;

	-- Declare the shift register signal
	signal sr: std_logic_vector((NUM_STAGES-1) downto 0);

begin

	process (clk)
	begin
		if (rising_edge(clk)) then

			if (enable = '1') then

				-- Shift data by one stage; data from last stage is lost
				sr <= sr((NUM_STAGES-2) downto 0) & sr_in;
			end if;
		end if;
	end process;

	-- Capture the data from the last stage, before it is lost
	sr_out <= sr;

end rtl;
