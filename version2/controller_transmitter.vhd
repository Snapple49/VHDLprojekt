library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controller_transmitter is

	port 
	(
		clk_baud16		: in std_logic;
		data_in		: in std_logic_vector (7 downto 0); -- data from memory
		send			: out std_logic := '0'; -- enable outgoing shift register
		data_rdy		: in std_logic := '0'; --data is ready to be sent
		rst			: in std_logic;
		load			: out std_logic_vector (7 downto 0); -- load data into outgoing shift register
		inv_en, freq_sel	: out std_logic;
		tx_rst, clk_rst	: out std_logic
	);

end entity;

architecture rtl of controller_transmitter is

type state is (idle, sending, waiting);

signal counter_tr : std_logic_vector(7 downto 0) := "00000000";
signal c_state : state;
begin

	process (clk_baud16, rst)
	begin
		if (rst = '0') then
			counter_tr <= "00000000";
			tx_rst <= '0';
			clk_rst <= '0';
			c_state <= idle;

		elsif rising_edge(clk_baud16) then
		
			case c_state is
				when idle =>
					
					c_state <= waiting;
				
				when sending =>
					
					send <= '1';
					clk_rst <= '1';
					counter_tr <= counter_tr + 1;
					if (counter_tr = "10101000") then
						counter_tr <= "00000000";
						--load <= "11111111";
						tx_rst <= '0';
						c_state <= waiting;
					else
						c_state <= sending;
					end if;
				
				when waiting =>
					
					clk_rst <= '0';
					tx_rst <= '1';
					send <= '0';
					if (data_rdy = '1') then
						load <= data_in;
						c_state <= sending;
					else
						c_state <= waiting;
					end if;
				when others =>
					c_state <= idle;
					
			end case;
		end if;
	end process;

inv_en <= '1';
freq_sel <= '1';

end rtl;