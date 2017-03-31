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

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Thu Mar 30 11:08:44 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY rs232_project IS 
	PORT
	(
		UART_RX :  IN  STD_LOGIC;
		pin_name1 :  IN  STD_LOGIC;
		pin_name2 :  IN  STD_LOGIC;
		pin_name3 :  IN  STD_LOGIC;
		UART_TX :  OUT  STD_LOGIC;
		pin_name4 :  OUT  STD_LOGIC;
		pin_name5 :  OUT  STD_LOGIC
	);
END rs232_project;

ARCHITECTURE bdf_type OF rs232_project IS 

COMPONENT clock_generator
GENERIC (baudrate : INTEGER
			);
	PORT(clk_source : IN STD_LOGIC;
		 freq_sel : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 clk_baud : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 
UART_TX <= UART_RX;



b2v_inst : clock_generator
GENERIC MAP(baudrate => 115200
			)
PORT MAP(clk_source => pin_name1,
		 freq_sel => pin_name2,
		 rst => pin_name3,
		 clk_baud => pin_name4
);
END bdf_type;