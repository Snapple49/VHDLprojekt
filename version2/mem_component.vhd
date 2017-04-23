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
-- CREATED		"Sun Apr 23 15:43:33 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mem_component IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		rst :  IN  STD_LOGIC;
		RX_ready :  IN  STD_LOGIC;
		source_clk :  IN  STD_LOGIC;
		data_in :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END mem_component;

ARCHITECTURE bdf_type OF mem_component IS 

COMPONENT dual_port_ram
GENERIC (ADDR_WIDTH : INTEGER;
			DATA_WIDTH : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 rstn : IN STD_LOGIC;
		 we : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT d_reg
GENERIC (size : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT interpreter
GENERIC (size : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 RX_ready : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 da : OUT STD_LOGIC;
		 we : OUT STD_LOGIC;
		 TX_enable : OUT STD_LOGIC;
		 address_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	baud_clk :  STD_LOGIC;
SIGNAL	da :  STD_LOGIC;
SIGNAL	we :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : dual_port_ram
GENERIC MAP(ADDR_WIDTH => 8,
			DATA_WIDTH => 8
			)
PORT MAP(clk => source_clk,
		 rstn => rst,
		 we => we,
		 address => SYNTHESIZED_WIRE_0,
		 data_in => SYNTHESIZED_WIRE_1,
		 data_out => data_out);


b2v_inst2 : d_reg
GENERIC MAP(size => 8
			)
PORT MAP(clk => baud_clk,
		 rst => rst,
		 load => da,
		 data_in => SYNTHESIZED_WIRE_2,
		 data_out => SYNTHESIZED_WIRE_1);


SYNTHESIZED_WIRE_3 <= NOT(da);



b2v_inst4 : d_reg
GENERIC MAP(size => 8
			)
PORT MAP(clk => baud_clk,
		 rst => rst,
		 load => SYNTHESIZED_WIRE_3,
		 data_in => SYNTHESIZED_WIRE_4,
		 data_out => SYNTHESIZED_WIRE_0);


b2v_inst5 : interpreter
GENERIC MAP(size => 8
			)
PORT MAP(clk => baud_clk,
		 rst => rst,
		 RX_ready => RX_ready,
		 data_in => data_in,
		 da => da,
		 we => we,
		 address_out => SYNTHESIZED_WIRE_4,
		 data_out => SYNTHESIZED_WIRE_2);

baud_clk <= clk;

END bdf_type;