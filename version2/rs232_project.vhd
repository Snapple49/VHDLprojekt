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
-- CREATED		"Tue Apr 25 18:40:44 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY rs232_project IS 
	PORT
	(
		src_clk :  IN  STD_LOGIC;
		RX_in :  IN  STD_LOGIC;
		rst_all :  IN  STD_LOGIC;
		loop_enable :  IN  STD_LOGIC;
		TX_out :  OUT  STD_LOGIC
	);
END rs232_project;

ARCHITECTURE bdf_type OF rs232_project IS 

COMPONENT mem_component
	PORT(rst : IN STD_LOGIC;
		 RX_ready : IN STD_LOGIC;
		 source_clk : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 TX_enable : OUT STD_LOGIC;
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT incoming_block
	PORT(source_clock : IN STD_LOGIC;
		 reset_all : IN STD_LOGIC;
		 RX_in : IN STD_LOGIC;
		 RX_ready : OUT STD_LOGIC;
		 RX_out : OUT STD_LOGIC;
		 sr_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT outgoing_block
	PORT(rst_all : IN STD_LOGIC;
		 src_clock : IN STD_LOGIC;
		 data_ready : IN STD_LOGIC;
		 loopback_enable : IN STD_LOGIC;
		 RX_loopback : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 TX_out : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	rstn :  STD_LOGIC;
SIGNAL	RX_loop :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_memunit : mem_component
PORT MAP(rst => rstn,
		 RX_ready => SYNTHESIZED_WIRE_0,
		 source_clk => src_clk,
		 data_in => SYNTHESIZED_WIRE_1,
		 TX_enable => SYNTHESIZED_WIRE_2,
		 data_out => SYNTHESIZED_WIRE_3);


b2v_receiver : incoming_block
PORT MAP(source_clock => src_clk,
		 reset_all => rstn,
		 RX_in => RX_in,
		 RX_ready => SYNTHESIZED_WIRE_0,
		 RX_out => RX_loop,
		 sr_out => SYNTHESIZED_WIRE_1);


b2v_transmitter : outgoing_block
PORT MAP(rst_all => rstn,
		 src_clock => src_clk,
		 data_ready => SYNTHESIZED_WIRE_2,
		 loopback_enable => loop_enable,
		 RX_loopback => RX_loop,
		 data_in => SYNTHESIZED_WIRE_3,
		 TX_out => TX_out);

rstn <= rst_all;

END bdf_type;