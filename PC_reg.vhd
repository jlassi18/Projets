library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity PC_reg is
    Port ( clk : in  STD_LOGIC;
           raz : in  STD_LOGIC;
           load : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (11 downto 0);
           data_out : out  STD_LOGIC_VECTOR (11 downto 0));
end PC_reg;

architecture Behavioral of PC_reg is

begin
	process (clk,raz)
	begin
	if raz='1' then 
		data_out <="000000000000";
	elsif rising_edge(clk) then 
		if load='1' then 
			data_out <= data_in(11 downto 0);
		end if;
	end if ;
	end process;

end Behavioral;

