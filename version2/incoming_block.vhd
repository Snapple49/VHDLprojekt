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
-- CREATED		"Tue Apr 25 16:47:20 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY incoming_block IS 
	PORT
	(
		source_clock :  IN  STD_LOGIC;
		reset_all :  IN  STD_LOGIC;
		RX_in :  IN  STD_LOGIC;
		RX_ready :  OUT  STD_LOGIC;
		RX_out :  OUT  STD_LOGIC;
		sr_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END incoming_block;

ARCHITECTURE bdf_type OF incoming_block IS 

COMPONENT clock_generator
GENERIC (baudrate : INTEGER
			);
	PORT(clk_source : IN STD_LOGIC;
		 freq_sel : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 clk_baud : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT controller_receiver
	PORT(clk_baud : IN STD_LOGIC;
		 clk_baud16 : IN STD_LOGIC;
		 RX_in : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 clk_rst : OUT STD_LOGIC;
		 clk_rst16 : OUT STD_LOGIC;
		 wrt_reg : OUT STD_LOGIC;
		 freq_sel : OUT STD_LOGIC;
		 inv_en : OUT STD_LOGIC;
		 data_rdy : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT inverter
	PORT(enable : IN STD_LOGIC;
		 input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
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
SIGNAL	data_rdy :  STD_LOGIC;
SIGNAL	freq_sel :  STD_LOGIC;
SIGNAL	inv_enable :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;


BEGIN 
RX_out <= RX_in;



b2v_baudclock : clock_generator
GENERIC MAP(baudrate => 5208
			)
PORT MAP(clk_source => source_clock,
		 freq_sel => SYNTHESIZED_WIRE_0,
		 rst => SYNTHESIZED_WIRE_1,
		 clk_baud => clk_baud);


b2v_baudclock16 : clock_generator
GENERIC MAP(baudrate => 5208
			)
PORT MAP(clk_source => source_clock,
		 freq_sel => freq_sel,
		 rst => SYNTHESIZED_WIRE_2,
		 clk_baud => SYNTHESIZED_WIRE_3);


b2v_controller : controller_receiver
PORT MAP(clk_baud => clk_baud,
		 clk_baud16 => SYNTHESIZED_WIRE_3,
		 RX_in => RX_in,
		 rst => reset_all,
		 clk_rst => SYNTHESIZED_WIRE_1,
		 clk_rst16 => SYNTHESIZED_WIRE_2,
		 wrt_reg => SYNTHESIZED_WIRE_5,
		 freq_sel => freq_sel,
		 inv_en => inv_enable,
		 data_rdy => data_rdy);


b2v_inst : inverter
PORT MAP(enable => inv_enable,
		 input => SYNTHESIZED_WIRE_4,
		 output => sr_out);


SYNTHESIZED_WIRE_0 <= NOT(freq_sel);



b2v_sreg : s_reg
GENERIC MAP(size => 8
			)
PORT MAP(clk => clk_baud,
		 enable => SYNTHESIZED_WIRE_5,
		 sr_in => RX_in,
		 rst => reset_all,
		 sr_par_out => SYNTHESIZED_WIRE_4);

RX_ready <= data_rdy;

END bdf_type;