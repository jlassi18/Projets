library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ACC_REG is
    Port ( Raz : in  STD_LOGIC;
           Load : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           Data_out : out  STD_LOGIC_VECTOR (15 downto 0);
           AccZ : out  STD_LOGIC;
           Acc15 : out  STD_LOGIC);
end ACC_REG;

architecture Architecture_ACC_REG of ACC_REG is
signal q_reg: std_logic_vector(15 downto 0);
begin
	process(clk,raz, load)
	begin
			if(clk'event and clk ='1') then
				if(raz ='1') then 
					data_out <=(others =>'0');
					acc15 <= '0';
					q_reg <= (others =>'0');
				elsif(load ='1') then
					data_out <= data_in;
					q_reg <= data_in;
					acc15 <= data_in(15);
				end if;
			end if;
	end process;	
	accz <= '1' when q_reg="0000000000000000" else '0';
end Architecture_ACC_REG;

