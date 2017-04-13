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
-- CREATED		"Thu Apr 13 13:10:14 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY rs232_project IS 
	PORT
	(
		UART_RX :  IN  STD_LOGIC;
		source_clock :  IN  STD_LOGIC;
		freq_select :  IN  STD_LOGIC;
		inv_enable :  IN  STD_LOGIC;
		reset_all :  IN  STD_LOGIC := '1';
		--UART_TX :  OUT  STD_LOGIC;
		inv_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		sr_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
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

COMPONENT inverter
GENERIC (size : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT controller
	PORT(clk_baud : IN STD_LOGIC;
		 clk_baud16 : IN STD_LOGIC;
		 RX_in : IN STD_LOGIC;
		 rst : IN STD_LOGIC := '1';
		 clk_rst : OUT STD_LOGIC;
		 clk_rst16 : OUT STD_LOGIC;
		 wrt_reg : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT s_reg
GENERIC (size : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 sr_in : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 sr_out : OUT STD_LOGIC;
		 sr_par_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	clk_baud :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;


BEGIN 
sr_out <= SYNTHESIZED_WIRE_3;



b2v_16baudrate_clock : clock_generator
GENERIC MAP(baudrate => 5208
			)
PORT MAP(clk_source => source_clock,
		 freq_sel => freq_select,
		 rst => SYNTHESIZED_WIRE_0,
		 clk_baud => SYNTHESIZED_WIRE_4);


b2v_baudrate_clock : clock_generator
GENERIC MAP(baudrate => 5208
			)
PORT MAP(clk_source => source_clock,
		 freq_sel => SYNTHESIZED_WIRE_1,
		 rst => SYNTHESIZED_WIRE_2,
		 clk_baud => clk_baud);


b2v_inst : inverter
GENERIC MAP(size => 8
			)
PORT MAP(clk => source_clock,
		 enable => inv_enable,
		 input => SYNTHESIZED_WIRE_3,
		 output => inv_out);


SYNTHESIZED_WIRE_1 <= NOT(freq_select);



b2v_inst3 : controller
PORT MAP(clk_baud => clk_baud,
		 clk_baud16 => SYNTHESIZED_WIRE_4,
		 RX_in => UART_RX,
		 clk_rst => SYNTHESIZED_WIRE_2,
		 clk_rst16 => SYNTHESIZED_WIRE_0,
		 wrt_reg => SYNTHESIZED_WIRE_5);


b2v_inst5 : s_reg
GENERIC MAP(size => 8
			)
PORT MAP(clk => clk_baud,
		 enable => SYNTHESIZED_WIRE_5,
		 sr_in => UART_RX,
		 rst => reset_all,
		 sr_par_out => SYNTHESIZED_WIRE_3);


END bdf_type;