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
		ready			: in std_logic; 
		ctr 			: in std_logic_vector; --räkna bits? 
		data_in		: in std_logic_vector((size-1) downto 0);
		data_out 	: out std_logic_vector((size-1) downto 0)
	);
	
end entity;

architecture rtl of interpreter is
type state is (IDLE, LISTENING, WRITING, READING, ADDRESS, DATA, D_WAITING, A_WAITING);
signal c_state : state := IDLE;
signal tmp : std_logic_vector((size-1) downto 0);
begin
	process(clk, rst)
	begin
		if (rst = '0') then
			c_state <= IDLE;
			data_out <= (others => '0');
		elsif rising_edge(clk) then

			case c_state is
				when IDLE =>
					--start ??
				when LISTENING =>
					case (data_in) is
						--A
						when "01000001" =>
							tmp <= data_in; 
							c_state <= A_WAITING;
						when "01100001" =>
							tmp <= data_in; 
							c_state <= A_WAITING;
						--D	
						when "01000100" =>
							tmp <= data_in; 
							c_state <= D_WAITING;
						when "01100100" =>
							tmp <= data_in; 
							c_state <= D_WAITING;
						--R	
						when "01010010" =>
							c_State <= READING;
						when "01110010" =>
							c_state <= READING;
						--W	
						when "01010111" => -- W
							c_state <= WRITING;
						when "01110111" =>
							c_state <= WRITING;
						when others =>
							c_state <= LISTENING;
					end  case;	
					
				when A_WAITING =>	
					if (tmp = data_in) then
						c_state <= A_WAITING;
					else
						c_state <= ADDRESS;
					end if;
					
				when D_WAITING =>
				
				when READING =>
					
				when WRITING =>
					
				when ADDRESS =>
					data_out <= data_in;
					c_state <= LISTENING;
				when DATA =>
					
			end case;
		end if;
	end process;
end rtl;	