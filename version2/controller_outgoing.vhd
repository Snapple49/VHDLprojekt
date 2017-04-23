library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controller_outgoing is

	port 
	(
		clk_baud16		: in std_logic;
		data_in		: in std_logic_vector (7 downto 0); -- data from memory
		send			: out std_logic := '0'; -- enable outgoing shift register
		data_rdy		: in std_logic := '0'; --data is ready to be sent
		rst			: in std_logic := '1';
		load			: out std_logic_vector (7 downto 0) -- load data into outgoing shift register
	);

end entity;

architecture rtl of controller_outgoing is

type state is (idle, sending, waiting);

signal counter_tr : std_logic_vector(2 downto 0) := "000";
signal c_state : state;
begin

	process (clk_baud16, rst)
	begin
		if (rst = '0') then
			counter_tr <= "000";
			c_state <= idle;

		elsif rising_edge(clk_baud16) then
		
			case c_state is
				when idle =>
					
					c_state <= waiting;
				
				when sending =>
					
					send <= '1';
					counter_tr <= counter_tr + 1;
					if (counter_tr = "111") then
						counter_tr <= "000";
						c_state <= waiting;
					else
						c_state <= sending;
					end if;
				
				when waiting =>
					
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



end rtl;