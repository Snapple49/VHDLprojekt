library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controller is

	port 
	(
		clk_baud		: in std_logic;
		clk_baud16	: in std_logic;
		RX_in	      : in std_logic;
		clk_rst		: out std_logic;
		wrt_reg		: out std_logic
	);

end entity;

architecture rtl of controller is
signal reading : std_logic := '0';
signal counter8 : std_logic_vector(2 downto 0) := "000";	
signal counter16 : std_logic_vector(3 downto 0) := "0000";
begin
	process(clk_baud16, reading)
	begin
		if (reading = '0') then
			if (rising_edge(clk_baud16)) then
				if (RX_in = '0') then
					counter8 <= counter8 + 1;
				elsif(RX_in = '1') then
					counter8 <= "000";
				end if;
			end if;
		elsif (reading = '1') then
			if rising_edge(clk_baud16) then
					counter16 <= counter16 + 1;
			end if;
		end if;
	end process;
	
	process(clk_baud, reading)
	begin
		if (reading = '1') then
			clk_rst = '1';
		end if;
		
	process(counter8)
	begin
		if(counter8 = "111")then
			counter8 <= "000";
			reading <= '1';
		end if;
	end process;
end rtl;

