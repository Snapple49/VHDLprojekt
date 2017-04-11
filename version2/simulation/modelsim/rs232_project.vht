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
-- Generated on "04/11/2017 15:54:06"
                                                            
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
SIGNAL fast_clock : STD_LOGIC;
SIGNAL freq_select : STD_LOGIC := '1';
SIGNAL inv_enable : STD_LOGIC := '1';
SIGNAL inv_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL source_clock : STD_LOGIC := '0';
SIGNAL sr_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL UART_RX : STD_LOGIC := '1';
SIGNAL UART_TX : STD_LOGIC;
COMPONENT rs232_project
	PORT (
	fast_clock : OUT STD_LOGIC;
	freq_select : IN STD_LOGIC;
	inv_enable : IN STD_LOGIC;
	inv_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	source_clock : IN STD_LOGIC;
	sr_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	UART_RX : IN STD_LOGIC;
	UART_TX : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : rs232_project
	PORT MAP (
-- list connections between master ports and signals
	fast_clock => fast_clock,
	freq_select => freq_select,
	inv_enable => inv_enable,
	inv_out => inv_out,
	source_clock => source_clock,
	sr_out => sr_out,
	UART_RX => UART_RX,
	UART_TX => UART_TX
	);
                                         
always : PROCESS

-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
	wait for 10000 ns;
	UART_RX <= '0'; -- start bit
	wait for 104166 ns;
	UART_RX <= '1'; 
	wait for 104166 ns;
	UART_RX <= '0';
	wait for 104166 ns;
	UART_RX <= '0';
	wait for 104166 ns;
	UART_RX <= '1';
	wait for 104166 ns;
	UART_RX <= '1';
	wait for 104166 ns;
	UART_RX <= '0';
	wait for 104166 ns;
	UART_RX <= '0';
	wait for 104166 ns;
	UART_RX <= '1';
	wait for 104166 ns;
	UART_RX <= '1'; -- stop bit
END PROCESS always;
source_clock <= not(source_clock) after 10 ns;                                          
END rs232_project_arch;
