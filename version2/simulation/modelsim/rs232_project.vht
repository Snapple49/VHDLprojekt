-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/25/2017 18:01:32"
                                                            
-- Vhdl Test Bench template for design  :  rs232_project
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY rs232_project_vhd_tst IS
END rs232_project_vhd_tst;
ARCHITECTURE rs232_project_arch OF rs232_project_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL loop_enable : STD_LOGIC := '0';
SIGNAL rst_all : STD_LOGIC := '0';
SIGNAL RX_in : STD_LOGIC := '1';
SIGNAL src_clk : STD_LOGIC := '0';
SIGNAL TX_out : STD_LOGIC;
COMPONENT rs232_project
	PORT (
	loop_enable : IN STD_LOGIC;
	rst_all : IN STD_LOGIC;
	RX_in : IN STD_LOGIC;
	src_clk : IN STD_LOGIC;
	TX_out : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : rs232_project
	PORT MAP (
-- list connections between master ports and signals
	loop_enable => loop_enable,
	rst_all => rst_all,
	RX_in => RX_in,
	src_clk => src_clk,
	TX_out => TX_out
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN
	
	
	wait for 100000 ns;
	--data_in <= "01000001";
	RX_in <= '0'; -- start bit
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1'; -- stop bit
	wait for 104166 ns;
	
	
	wait for 500000 ns;
	--data_in <= "00000000";
	RX_in <= '0'; -- start bit
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1'; -- stop bit
	wait for 104166 ns;
	
	
	wait for 500000 ns;	
	--data_in <= "01000100";
	RX_in <= '0'; -- start bit
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1'; -- stop bit
	wait for 104166 ns;
	
	wait for 500000 ns;
	--data_in <= "11110000";
	RX_in <= '0'; -- start bit
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '1'; -- stop bit
	wait for 104166 ns;

	wait for 500000 ns;
	--data_in <= "01010111";
	RX_in <= '0'; -- start bit
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1'; -- stop bit
	wait for 104166 ns;
	
	wait for 500000 ns;
	--data_in <= "01010010";
	RX_in <= '0'; -- start bit
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1';
	wait for 104166 ns;
	RX_in <= '0';
	wait for 104166 ns;
	RX_in <= '1'; -- stop bit
	wait for 104166 ns;
	
	
	-- other address
--	wait for 850000 ns;
--	data_in <= "01000001";
--	RX_ready <= '1';
--	wait for 7000 ns;
--	RX_ready <= '0';
--	
--	wait for 850000 ns;
--	data_in <= "00000001";
--	RX_ready <= '1';
--	wait for 7000 ns;
--	RX_ready <= '0';
--	
--	wait for 850000 ns;	
--	data_in <= "01000100";
--	RX_ready <= '1';
--	wait for 7000 ns;
--	RX_ready <= '0';
--	
--	wait for 850000 ns;
--	data_in <= "00001111";
--	RX_ready <= '1';
--	wait for 7000 ns;
--	RX_ready <= '0'; 
--
--	wait for 850000 ns;
--	data_in <= "01010111";
--	RX_ready <= '1';
--	wait for 7000 ns;
--	RX_ready <= '0';
--	
--	wait for 850000 ns;
--	data_in <= "01010010";
--	RX_ready <= '1';
--	wait for 7000 ns;
--	RX_ready <= '0';

END PROCESS always;

rst_all <= '1' after 200 ns;
src_clk <= not src_clk after 10 ns;

END rs232_project_arch;
