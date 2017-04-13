library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity d_reg is
	
	generic
	(
		size : natural := 8
	);
	
	port
	(
		clk		: in std_logic;
		rst 		: in std_logic;
		load 		: in std_logic; --enable? 
		data_in	: in std_logic_vector((size-1) downto 0);
		data_out	: out std_logic_vector((size-1) downto 0)
	);
end entity;
	
architecture rtl of d_reg is
signal tmp : std_logic_vector((size-1) downto 0);
begin
	process (clk, rst, data_in, load)
	begin
		if (rst = '0') then
			tmp <= (others => '0');
		elsif rising_edge(clk) then
			if load = '1' then
				tmp <= data_in;
			end if;
		end if;
	end process;
	data_out <= tmp;
end rtl;