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
-- Generated on "04/23/2017 21:59:27"
                                                            
-- Vhdl Test Bench template for design  :  outgoing_block
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY outgoing_block_vhd_tst IS
END outgoing_block_vhd_tst;
ARCHITECTURE outgoing_block_arch OF outgoing_block_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL data_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL data_ready : STD_LOGIC := '0';
SIGNAL freq_sel : STD_LOGIC := '1';
SIGNAL loopback_enable : STD_LOGIC;
SIGNAL rst_all : STD_LOGIC := '0';
SIGNAL RX_loopback : STD_LOGIC;
SIGNAL src_clock : STD_LOGIC := '0';
SIGNAL TX_out : STD_LOGIC;
COMPONENT outgoing_block
	PORT (
	data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	data_ready : IN STD_LOGIC;
	freq_sel : IN STD_LOGIC;
	loopback_enable : IN STD_LOGIC;
	rst_all : IN STD_LOGIC;
	RX_loopback : IN STD_LOGIC;
	src_clock : IN STD_LOGIC;
	TX_out : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : outgoing_block
	PORT MAP (
-- list connections between master ports and signals
	data_in => data_in,
	data_ready => data_ready,
	freq_sel => freq_sel,
	loopback_enable => loopback_enable,
	rst_all => rst_all,
	RX_loopback => RX_loopback,
	src_clock => src_clock,
	TX_out => TX_out
	);
                                         
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN
	
	RX_loopback <= '0';
	data_ready <= '0';
	wait for 1000 ns;
	data_in <= "01000001";
	wait for 10 ns;
	data_ready <= '1';
	wait for 13000 ns;
	data_ready <= '0';
	wait for 1500000 ns;
	data_in <= "11101010";
	data_ready <= '1';
	wait for 13000 ns;
	data_ready <= '0';
	wait;
	
END PROCESS always;

src_clock <= not src_clock after 10 ns;
loopback_enable <= '0' after 20 ns;
rst_all <= '1' after 200 ns;

END outgoing_block_arch;
