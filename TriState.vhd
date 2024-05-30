library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

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

