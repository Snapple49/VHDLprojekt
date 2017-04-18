library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controller_outgoing is

	port 
	(
		clk_baud		: in std_logic;
		data_in		: in std_logic_vector (7 downto 0); -- data from memory
		send			: out std_logic := '0'; -- enable outgoing shift register
		data_rdy		: in std_logic := '0'; --data is ready to be sent
		rst			: in std_logic := '1';
		load			: out std_logic_vector (7 downto 0) -- load data into outgoing shift register
	);

end entity;

architecture rtl of controller_outgoing is

type state is (idle, sending, waiting);

signal counter_sb : std_logic_vector(2 downto 0) := "000";
signal counter_tr : std_logic_vector(3 downto 0) := "0000";
signal c_state : state := idle;
signal state_clk : std_logic := clk_baud16;
begin

	process (clk_baud, rst)
	begin
		if (rst = '0') then
			clk_rst <= '0';
			clk_rst16 <= '0';
			counter_sb <= "000";
			counter_tr <= "0000";
			wrt_reg <= '0';
			state_clk <= clk_baud16;
			c_state <= idle;

		elsif rising_edge(clk_baud) then
		
			case c_state is
				when idle =>
					
					c_state <= waiting;
				
				when sending =>
					
					
				
				
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