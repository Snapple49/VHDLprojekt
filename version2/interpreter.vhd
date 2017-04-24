library ieee;
use ieee.std_logic_1164.all;

entity interpreter is

	generic
	(
		size : natural := 8
	);
	
	port
	(
		clk			: in std_logic;
		rst 			: in std_logic;
		RX_ready		: in std_logic; 
		data_in		: in std_logic_vector((size-1) downto 0);
		data_out 	: out std_logic_vector((size-1) downto 0);
		address_out : out std_logic_vector((size-1) downto 0);
		da				: out std_logic; -- data (1) or address (0)
		we				: out std_logic; -- write enable
		TX_enable	: out std_logic --enable?
	);
	
end entity;

architecture rtl of interpreter is
type state is (IDLE, DECODING, WRITING, READING, ADDRESS, DATA, D_WAITING, A_WAITING);
signal c_state : state;
signal done : std_logic;
signal tmp : std_logic_vector((size-1) downto 0);
begin
--	process(RX_ready) 
--	begin 
--		if rising_edge(RX_ready) then
--			done <= '0';
--		end if;
--	end process;
	
	process(clk, rst, RX_ready)
	begin
		if (rst = '0') then
			c_state <= IDLE;
			TX_enable <= '0';
			data_out <= (others => '0');
		elsif falling_edge(clk) then
			case c_state is
				when IDLE =>
					TX_enable <= '0';
					we <= '0';
					if  RX_ready = '1' then
						c_state <= DECODING;
					else
						c_state <= IDLE;
					end if;	
				when DECODING =>
					--tmp <= data_in;
				   
					if data_in = "01000100" then
						c_state <= D_WAITING;
					elsif data_in = "01000001" then
						c_state <= A_WAITING;
					elsif data_in = "01010010" then
						c_state <= READING;
					elsif data_in = "01010111" then
						we <= '1';
						c_state <= WRITING;
					end if;
--					case (tmp) is
--						--A
--						when "01000001" =>
--							c_state <= A_WAITING;
--						--D	
--						when "01000100" =>
--							c_state <= D_WAITING;
--						--R	
--						when "01010010" =>
--							c_state <= READING;
--						--W	
--						when "01010111" => -- W
--							we <= '1';
--							c_state <= WRITING;
--						when others =>
--							c_state <= DECODING;
--					end  case;	
	
				when A_WAITING =>	
					if RX_ready = '1' then
						c_state <= ADDRESS;
					else
						c_state <= A_WAITING;
					end if;
				when ADDRESS =>
					address_out <= data_in;
					da <= '1';
					c_state <= IDLE;
				when D_WAITING =>
					if RX_ready = '1' then
						c_state <= DATA;
					else
						c_state <= D_WAITING;
					end if;
				when DATA =>
					data_out <= data_in;
					da <= '0';
					c_state <= IDLE;
				when READING =>
					TX_enable <= '1';
					c_state <= IDLE;
				when WRITING =>
					we <= '1';
					c_state <= IDLE;
			end case;
		end if;
	end process;
end rtl;	