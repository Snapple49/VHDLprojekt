library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controller is

	port 
	(
		clk_baud		: in std_logic;
		clk_baud16	: in std_logic;
		RX_in	      : in std_logic;
		clk_rst		: out std_logic := '1';
		clk_rst16 	: out std_logic := '1';
		wrt_reg		: out std_logic := '0';
		rst			: in std_logic := '1'
	);

end entity;

architecture rtl of controller is

type state is (idle, reading, waiting);

signal counter_sb : std_logic_vector(2 downto 0) := "000";
signal counter_tr : std_logic_vector(3 downto 0) := "0000";
signal c_state : state := idle;
signal state_clk : std_logic := clk_baud16;
begin

	process (state_clk, rst)
	begin
		if (rst = '0') then
			clk_rst <= '0';
			clk_rst16 <= '0';
			counter_sb <= "000";
			counter_tr <= "0000";
			wrt_reg <= '0';
			state_clk <= clk_baud16;
			c_state <= idle;

		elsif falling_edge(state_clk) then
		
			case c_state is
				when idle =>
					
					c_state <= waiting;
				
				when reading =>
					
					state_clk <= clk_baud;
					wrt_reg <= '1';
					
				
				
				when waiting =>
					
					state_clk <= clk_baud16;
					clk_rst <= '0';
					if (counter_sb = "111") then
						counter_sb <= "000";
						clk_rst <= '1';
						c_state <= reading;
					elsif (RX_in = '0') then
						counter_sb <= counter_sb + 1;
					elsif (RX_in = '1') then
						counter_sb <= "000";
					end if;
					c_state <= waiting;
					
				when others =>
					c_state <= idle;
					
			end case;
		end if;
	end process;



end rtl;


--/*
--
--
--
--begin
--	process(clk_baud16, reading)
--	begin
--		if (reading = '0') then
--			clk_rst <= '1';
--			if (rising_edge(clk_baud16)) then
--				if (RX_in = '0') then
--					counter8a <= counter8a + 1;
--				elsif(RX_in = '1') then
--					counter8a <= "000";
--				end if;
--			end if;
--		elsif (reading = '1') then
--			clk_rst <= '0'; --clk_rst16 <= 1??
--			
--		end if;
--	end process;
--	
--	process(clk_baud, reading)
--	begin
--		if (reading = '1') then
--			if falling_edge(clk_baud) then
--				wrt_reg <= '1';
--				if (counter8b = "1001") then
--					counter8b <= "0000";
--				else
--					counter8b <= counter8b + 1;
--				end if;
--			end if;
--		end if;
-- 	end process;
--	
--	process(counter8a, counter8b)
--	begin
--		if(counter8a = "111")then
--			reading <= '1';
--		end if;
--		if(counter8b = "1001")then
--			reading <= '0';
--		end if;
--	end process; */


