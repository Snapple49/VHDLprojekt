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
-- Generated on "04/06/2017 16:30:47"
                                                            
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
SIGNAL pin_name1 : STD_LOGIC;
SIGNAL pin_name2 : STD_LOGIC;
SIGNAL pin_name5 : STD_LOGIC;
SIGNAL pin_name6 : STD_LOGIC;
SIGNAL sr_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL UART_RX : STD_LOGIC;
SIGNAL UART_TX : STD_LOGIC;
COMPONENT rs232_project
	PORT (
	pin_name1 : IN STD_LOGIC;
	pin_name2 : IN STD_LOGIC;
	pin_name5 : IN STD_LOGIC;
	pin_name6 : IN STD_LOGIC;
	sr_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	UART_RX : IN STD_LOGIC;
	UART_TX : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : rs232_project
	PORT MAP (
-- list connections between master ports and signals
	pin_name1 => pin_name1,
	pin_name2 => pin_name2,
	pin_name5 => pin_name5,
	pin_name6 => pin_name6,
	sr_out => sr_out,
	UART_RX => UART_RX,
	UART_TX => UART_TX
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
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;
pin_name1 <= not(pin_name1) after 10 ns;                                          
END rs232_project_arch;
