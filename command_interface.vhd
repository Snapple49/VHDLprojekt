library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity command_interface is

	port 
	(
		clk_baud		: in std_logic;
		clk_baud16	: in std_logic;
		RX_in	      : in std_logic;
		wrt_reg		: out std_logic
	);

end entity;

architecture rtl of command_interface is
signal reading : std_logic := '0';
signal counter : std_logic_vector(2 downto 0) := "000";	

begin
	process(clk_baud16, reading)
	begin
		if(reading = '0') then
			if(rising_edge(clk_baud16)) then
				if(RX_in = '0') then
					counter <= counter + 1;
				end if;
			end if;
		elsif(reading = '1') then
		 -- vänta en symbol?
			counter <= "000";
		end if;
	end process;
	
	process(counter)
	begin
		if(counter = "111")then
			reading <= '1';
		end if;
	end process;
end rtl;

