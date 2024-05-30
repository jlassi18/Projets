----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:44:06 11/13/2020 
-- Design Name: 
-- Module Name:    TriState - Architecture_TriState 
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

entity TriState is
    Port ( data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           ose : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end TriState;

architecture Architecture_TriState of TriState is

begin
	data_out <= data_in when ose='1' else
				"ZZZZZZZZZZZZZZZZ";
end Architecture_TriState;

