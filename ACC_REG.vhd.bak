----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:46:55 11/13/2020 
-- Design Name: 
-- Module Name:    ACC_REG - Architecture_ACC_REG 
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

