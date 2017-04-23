library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity dual_port_ram is
	generic 
	(
		DATA_WIDTH : natural := 8;
		ADDR_WIDTH : natural := 8
	);

	port 
	(
		clk		: in std_logic;
		rstn		: in std_logic := '0';
		we			: in std_logic;
		data_in 	: in std_logic_vector((DATA_WIDTH-1) downto 0);
		address	: in std_logic_vector((ADDR_WIDTH-1) downto 0);
		data_out	: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);
	
end entity;

architecture rtl of dual_port_ram is

	subtype word_t is std_logic_vector((DATA_WIDTH-1) downto 0);
	type memory_t is array(2**ADDR_WIDTH-1 downto 0) of word_t;	
	signal ram : memory_t;

begin
	process(clk)
	begin
		if rstn = '0' then
			data_out <= (others => '0');
		elsif(rising_edge(clk)) then 
			if(we = '1') then
				ram(conv_integer(unsigned(address))) <= data_in;	
			end if;
			data_out <= ram(conv_integer(unsigned(address)));
		end if;
	end process;
end rtl;
