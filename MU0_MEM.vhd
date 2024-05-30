library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity MU0_MEM is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
           addr_bus : inout  STD_LOGIC_VECTOR (11 downto 0));
end MU0_MEM;

architecture Behavioral of MU0_MEM is
Signal memrq: std_logic;
signal rnw:std_logic;

component MU0
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
           addr_bus : inout  STD_LOGIC_VECTOR (11 downto 0);
           mem_rq : out  STD_LOGIC;
           rnw : out  STD_LOGIC);
end component;

component Memory
    Port ( clk : in  STD_LOGIC;
           MEMrq : in  STD_LOGIC;
           RnW : in  STD_LOGIC;
           addr_bus : in  STD_LOGIC_VECTOR (11 downto 0);
           data_bus : inout  STD_LOGIC_VECTOR (15 downto 0));
end component;

begin
instance_MU0 : MU0 port map(
										clk => clk,
										reset => reset,
										data_bus => data_bus,
										addr_bus => addr_bus,
										mem_rq => memrq,
										rnw => rnw
									);
instance_MEMORY : Memory port map(
										clk => clk,
										MEMrq => memrq,
										RnW => rnw,
										data_bus => data_bus,
										addr_bus => addr_bus
									);
end Behavioral;

