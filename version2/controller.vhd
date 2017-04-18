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
		rst			: in std_logic := '1';
		data_rdy		: out std_logic := '0'
	);

end entity;

architecture rtl of controller is

type state is (idle, reading, waiting);

signal counter_sb : std_logic_vector(2 downto 0) := "000";
signal counter_rd : std_logic_vector(3 downto 0) := "0000";
signal c_state : state;
signal state_clk : std_logic;
signal freq : std_logic := '0'; -- 0=baud16, 1 = baud

begin
	process (state_clk, rst)
	begin
		if (rst = '0') then
			--clk_rst <= '0';
			--clk_rst16 <= '0';
			counter_sb <= "000";
			counter_rd <= "0000";
			wrt_reg <= '0';
			c_state <= idle;
			data_rdy <= '0';

		elsif rising_edge(state_clk) then
		
			case c_state is
				when idle =>
					
					c_state <= waiting;
					
				when reading =>
					
					freq <= '1';
					wrt_reg <= '1';
					counter_rd <= counter_rd + 1;
					if (counter_rd = "1001") then
						wrt_reg <= '0';
						counter_rd <= "0000";
						freq <= '0';
						data_rdy <= '1';
						c_state <= waiting;
					else
						c_state <= reading;
					end if;
					

				when waiting =>
					data_rdy <= '0';
					clk_rst16 <= '1';
					clk_rst <= '0';
					freq <= '0';
					if (counter_sb = "111") then
						counter_sb <= "000";
						clk_rst <= '1';
						c_state <= reading;
					elsif (RX_in = '0') then
						counter_sb <= counter_sb + 1;
						c_state <= waiting;
					elsif (RX_in = '1') then
						counter_sb <= "000";
						c_state <= waiting;
					end if;
				when others =>
					c_state <= idle;
					
			end case;
		end if;
	end process;

	process (clk_baud16, freq)
	begin
		if (freq = '0') then
			state_clk <= clk_baud16;
		elsif (freq = '1') then
			state_clk <= clk_baud;
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


