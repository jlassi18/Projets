library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IR_reg is
    Port ( data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           raz : in  STD_LOGIC;
           load : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           op_code : out  STD_LOGIC_VECTOR (3 downto 0);
           data_out : out  STD_LOGIC_VECTOR (11 downto 0));
end IR_reg;

architecture Architecture_IR_reg of IR_reg is
signal interne : std_logic_vector(3 downto 0);
begin
	process (clk,raz)
	begin
	if raz='1' then 
		data_out <="000000000000";
		op_code <= "0000";
	elsif rising_edge(clk) then 
		if load='1' then 
			data_out<= data_in(11 downto 0);
			op_code<= data_in(15 downto 12);
		end if;
	end if ;
	end process;
	--op_code <= interne;

end Architecture_IR_reg;

