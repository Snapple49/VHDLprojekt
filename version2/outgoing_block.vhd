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
-- CREATED		"Sun Apr 23 21:58:18 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY outgoing_block IS 
	PORT
	(
		rst_all :  IN  STD_LOGIC;
		src_clock :  IN  STD_LOGIC;
		freq_sel :  IN  STD_LOGIC;
		data_ready :  IN  STD_LOGIC;
		loopback_enable :  IN  STD_LOGIC;
		RX_loopback :  IN  STD_LOGIC;
		data_in :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		TX_out :  OUT  STD_LOGIC
	);
END outgoing_block;

ARCHITECTURE bdf_type OF outgoing_block IS 

COMPONENT controller_outgoing
	PORT(clk_baud16 : IN STD_LOGIC;
		 data_rdy : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 send : OUT STD_LOGIC;
		 load : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT clock_generator
GENERIC (baudrate : INTEGER
			);
	PORT(clk_source : IN STD_LOGIC;
		 freq_sel : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 clk_baud : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT my_mux
	PORT(sel : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 result : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT tx_reg
	PORT(clk_baud : IN STD_LOGIC;
		 sending : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 par_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 sr_out : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	clk_baud16 :  STD_LOGIC;
SIGNAL	tx_mux :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : controller_outgoing
PORT MAP(clk_baud16 => clk_baud16,
		 data_rdy => data_ready,
		 rst => rst_all,
		 data_in => data_in,
		 send => SYNTHESIZED_WIRE_2,
		 load => SYNTHESIZED_WIRE_3);


b2v_inst1 : clock_generator
GENERIC MAP(baudrate => 5208
			)
PORT MAP(clk_source => src_clock,
		 freq_sel => freq_sel,
		 rst => rst_all,
		 clk_baud => clk_baud16);


b2v_inst10 : my_mux
PORT MAP(sel => loopback_enable,
		 data => tx_mux,
		 result => TX_out);


b2v_inst2 : clock_generator
GENERIC MAP(baudrate => 5208
			)
PORT MAP(clk_source => src_clock,
		 freq_sel => SYNTHESIZED_WIRE_0,
		 rst => rst_all,
		 clk_baud => SYNTHESIZED_WIRE_1);


SYNTHESIZED_WIRE_0 <= NOT(freq_sel);



b2v_inst4 : tx_reg
PORT MAP(clk_baud => SYNTHESIZED_WIRE_1,
		 sending => SYNTHESIZED_WIRE_2,
		 rst => rst_all,
		 par_in => SYNTHESIZED_WIRE_3,
		 sr_out => tx_mux(0));


tx_mux(1) <= RX_loopback;
END bdf_type;