library ieee;
use ieee.std_logic_1164.all;

package baud_generator is
	component clock_generator
		
		generic(
			baudrate : integer -- 9600 is 0010010110000000, 115200 is 11100001000000000
		);
		
		port (
			clk_source, freq_sel, rst : in std_logic;
			clk_baud, clk_baud16 : out std_logic
		);
		
	end component;
end package baud_generator;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity generator is

	generic(
		baudrate : integer
	);

	port (
		clk_source, freq_sel, rst : in std_logic; -- freq_sel chooses between baud (0) and baud16 (1)
		clk_baud, clk_baud16 : out std_logic
	);
	
end entity;

architecture behavior of generator is

	signal half_rate : std_logic_vector;
	signal ctr : std_logic_vector (16 downto 0) := "000000000000000000000";

begin
	half_rate <= '0' & conv_std_logic_vector(baudrate, 17)(21 downto 1);
	process (clk_source, rst)
	begin
		if rising_edge(rst) then
			ctr <= "000000000000000000000";
			clk_baud <= '0';
			clk_baud16 <= '0';
		elsif rising_edge(clk_source) then
			ctr <= ctr + 1;
		end if;
	end process;
	
	process (ctr)
	begin
		case freq_sel is
			when 0 => 
				if (ctr = half_rate-1) then
					clk_baud <= not clk_baud;
				end if;	
			when 1 =>
				if (ctr = half_rate-1) then
					clk_baud <= not clk_baud;
				end if;	
		
	
	end process;

end behavior;