----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:59:55 02/28/2021 
-- Design Name: 
-- Module Name:    MU0 - Behavioral_MU0 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MU0 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
           addr_bus : inout  STD_LOGIC_VECTOR (11 downto 0);
           mem_rq : out  STD_LOGIC;
           rnw : out  STD_LOGIC);
end MU0;

architecture Behavioral_MU0 of MU0 is
	signal opcode: std_logic_vector(3 downto 0);
	signal raz : std_logic;
	signal ir_out: std_logic_vector(11 downto 0);
	signal pc_out: std_logic_vector(11 downto 0);
	signal alu_out: std_logic_vector(15 downto 0);
	signal acc_out: std_logic_vector(15 downto 0);
	signal muxb_out: std_logic_vector(15 downto 0);
	signal concat: std_logic_vector(15 downto 0);
	signal alufs: std_logic_vector(3 downto 0);
	signal ir_ld : std_logic;
	signal pc_ld : std_logic;
	signal acc_ld : std_logic;
	signal acc_oe : std_logic;
	signal selA : std_logic;
	signal selB : std_logic;
	signal accz : std_logic;
	signal acc15 : std_logic;
	
-- declaration des composant	
component Sequenceur
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           accz : in  STD_LOGIC;
           acc15 : in  STD_LOGIC;
           opcode : in  STD_LOGIC_VECTOR (3 downto 0);
           raz : out  STD_LOGIC;
           selA : out  STD_LOGIC;
           selB : out  STD_LOGIC;
           acc_ld : out  STD_LOGIC;
           pc_ld : out  STD_LOGIC;
           ir_ld : out  STD_LOGIC;
           acc_oe : out  STD_LOGIC;
           alufs : out  STD_LOGIC_VECTOR (3 downto 0);
           memrq : out  STD_LOGIC;
           rnw : out  STD_LOGIC);
end component;

component AUL
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           AULFS : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component TriState
    Port ( data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           ose : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component PC_reg
    Port ( clk : in  STD_LOGIC;
           raz : in  STD_LOGIC;
           load : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (11 downto 0);
           data_out : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

component ACC_REG
    Port ( Raz : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           Data_out : out  STD_LOGIC_VECTOR (15 downto 0);
           AccZ : out  STD_LOGIC;
           Acc15 : out  STD_LOGIC);
end component;

component IR_reg
    Port ( data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           raz : in  STD_LOGIC;
           load : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           op_code : out  STD_LOGIC_VECTOR (3 downto 0);
           data_out : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

component MUXA
    Port ( e_0 : in  STD_LOGIC_VECTOR (11 downto 0);
           e_1 : in  STD_LOGIC_VECTOR (11 downto 0);
           sel : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (11 downto 0));
end component;

component MUXB
    Port ( e_0 : in  STD_LOGIC_VECTOR (15 downto 0);
           e_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

begin

concat <= "0000" & addr_bus;

instance_sequenceur: Sequenceur port map(
														clk => clk,
														reset => reset,
														accz => accz,
														acc15 => acc15,
														opcode => opcode,
														raz => raz,
														selA => selA,
														selB => selB,
														acc_ld => acc_ld,
														pc_ld => pc_ld,
														ir_ld => ir_ld,
														acc_oe => acc_oe,
														alufs => alufs,
														memrq => mem_rq,
														rnw => rnw
													);
instance_AUL: AUL port map(
										A => acc_out,
										B => muxb_out,
										AULFS => alufs,
										S => alu_out
									);
instance_tristate: TriState port map(
													data_in => acc_out,
													ose => acc_oe,
													data_out => data_bus
												);
instance_PC_reg: PC_reg port map(
												clk => clk,
												raz => raz,
												load => pc_ld, 
												data_in => alu_out(11 downto 0),
												data_out => pc_out
											);
instance_Acc_reg: ACC_REG port map( 
												Raz => raz,
												Load => acc_ld,
												Clk => clk,
												Data_in => alu_out,
												Data_out => acc_out,
												AccZ => accz,
												Acc15 => acc15
											);

instance_IR_reg: IR_reg port map( 
												data_in => data_bus,
												raz => raz,
												load => ir_ld,
												clk => clk,
												op_code => opcode,
												data_out => ir_out
											);
instance_MUXA: MUXA port map( 
										e_0 => pc_out ,
										e_1 => ir_out,
										sel => selA ,
										s => addr_bus
									);

instance_MUXB: MUXB port map( 
											e_0 => concat,
											e_1 => data_bus,
											sel => selB,
											s => muxb_out
										);

end Behavioral_MU0;

