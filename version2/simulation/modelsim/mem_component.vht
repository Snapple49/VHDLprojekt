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
-- Generated on "04/24/2017 14:22:39"
                                                            
-- Vhdl Test Bench template for design  :  mem_component
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mem_component_vhd_tst IS
END mem_component_vhd_tst;
ARCHITECTURE mem_component_arch OF mem_component_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL data_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL data_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL freq_sel : STD_LOGIC := '1';
SIGNAL rst : STD_LOGIC := '0';
SIGNAL RX_ready : STD_LOGIC := '0';
SIGNAL source_clk : STD_LOGIC := '0';
SIGNAL TX_enable : STD_LOGIC;
COMPONENT mem_component
	PORT (
	data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	freq_sel : IN STD_LOGIC;
	rst : IN STD_LOGIC;
	RX_ready : IN STD_LOGIC;
	source_clk : IN STD_LOGIC;
	TX_enable : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : mem_component
	PORT MAP (
-- list connections between master ports and signals
	data_in => data_in,
	data_out => data_out,
	freq_sel => freq_sel,
	rst => rst,
	RX_ready => RX_ready,
	source_clk => source_clk,
	TX_enable => TX_enable
	);                                          
always : PROCESS                                           
BEGIN                                                         
  	--A  "01000001" 
	--D  "01000100"
	--R  "01010010"
	--W  "01010111"
   rst <= '0';
	wait for 200 ns;
	rst <= '1';
	wait for 900000 ns;
	data_in <= "01000001";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0';
	
	wait for 850000 ns;
	data_in <= "00000000";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0';
	
	wait for 850000 ns;	
	data_in <= "01000100";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0';
	
	wait for 850000 ns;
	data_in <= "11110000";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0'; 

	wait for 850000 ns;
	data_in <= "01010111";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0';
	
	wait for 850000 ns;
	data_in <= "01010010";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0';
	
	
	-- other address
	wait for 850000 ns;
	data_in <= "01000001";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0';
	
	wait for 850000 ns;
	data_in <= "00000001";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0';
	
	wait for 850000 ns;	
	data_in <= "01000100";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0';
	
	wait for 850000 ns;
	data_in <= "00001111";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0'; 

	wait for 850000 ns;
	data_in <= "01010111";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0';
	
	wait for 850000 ns;
	data_in <= "01010010";
	RX_ready <= '1';
	wait for 7000 ns;
	RX_ready <= '0';
	
WAIT;                                                        
END PROCESS always; 
	source_clk <= not(source_clk) after 10 ns;
END mem_component_arch;
