library ieee;
use ieee.std_logic_1164.all;

entity interpreter is

	generic
	(
		--- baud rate här?
		size : natural := 8
	);
	

	port
	(
		clk			: in std_logic;
		rst 			: in std_logic;
		start			: in std_logic; --enable?
		ctr 			: in std_logic_vector; --räkna bits? 
		RX_data		: in std_logic_vector((size-1) downto 0);
		data_out 	: out std_logic_vector((size-1) downto 0)
	);
	
end entity;

architecture rtl of interpreter is
type state is (IDLE, LISTENING, WRITING, READING, ADDRESS, DATA);
signal c_state : state := IDLE;
begin
	process(clk, rst)
	begin
		if (rst = '0') then
			c_state <= IDLE;
		elsif rising_edge(clk) then
			case c_state is
				when IDLE =>
				
				when LISTENING =>
				
				when READING =>
				
				when WRITING =>
				
				when ADDRESS =>
				
				when DATA =>
				
			end case;
		end if;
	end process;
end rtl;	