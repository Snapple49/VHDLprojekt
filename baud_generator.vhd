library ieee;
use ieee.std_logic_1164.all;

package baud_generator is
	component clock_generator
		
		generic(
			baudrate : integer := 9600 -- 9600 is 0010010110000000, 115200 is 11100001000000000
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

entity clock_generator is

	generic(
		baudrate : integer := 9600
	);

	port (
		clk_source, freq_sel, rst : in std_logic; -- freq_sel chooses between baud (0) and baud16 (1)
		clk_baud, clk_baud16 : out std_logic
	);
	
end entity;

architecture behavior of clock_generator is

	signal clk_out : std_logic := '0';
	signal half_rate : std_logic_vector;
	signal ctr : std_logic_vector (20 downto 0) := "000000000000000000000";

begin
	half_rate <= '0' & conv_std_logic_vector(baudrate, 21)(20 downto 1);
	
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
			when '0' => -- baud
				if (ctr = half_rate-1) then
					clk_out <= not clk_out;
				end if;	
			when '1' => -- baud16
				if (ctr = (half_rate(16 downto 0)-1 & "0000")) then
					clk_out <= not clk_out;
				end if;	
		end case;
	end process;

end behavior;