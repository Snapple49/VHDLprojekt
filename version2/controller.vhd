library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controller is

	port 
	(
		clk_baud		: in std_logic;
		clk_baud16	: in std_logic;
		RX_in	      : in std_logic;
		clk_rst		: out std_logic := '0';
		clk_rst16 	: out std_logic := '0';
		wrt_reg		: out std_logic := '0'
	);

end entity;

architecture rtl of controller is
signal reading : std_logic := '0';
signal counter8a : std_logic_vector(2 downto 0) := "000";
signal counter8b : std_logic_vector(3 downto 0) := "0000";
signal counter16 : std_logic_vector(3 downto 0) := "0000";

begin
	process(clk_baud16, reading)
	begin
		if (reading = '0') then
			clk_rst <= '1';
			if (rising_edge(clk_baud16)) then
				if (RX_in = '0') then
					counter8a <= counter8a + 1;
				elsif(RX_in = '1') then
					counter8a <= "000";
				end if;
			end if;
		elsif (reading = '1') then
			clk_rst <= '0'; --clk_rst16 <= 1??
			
		end if;
	end process;
	
	process(clk_baud, reading)
	begin
		if (reading = '1') then
			if falling_edge(clk_baud) then
				wrt_reg <= '1';
				if (counter8b = "1001") then
					counter8b <= "0000";
				else
					counter8b <= counter8b + 1;
				end if;
			end if;
		end if;
 	end process;
	
	process(counter8a, counter8b)
	begin
		if(counter8a = "111")then
			reading <= '1';
		end if;
		if(counter8b = "1001")then
			reading <= '0';
		end if;
	end process;

end rtl;

