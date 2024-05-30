library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity MUXB is
    Port ( e_0 : in  STD_LOGIC_VECTOR (15 downto 0);
           e_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (15 downto 0));
end MUXB;

architecture Architecture_MUXB of MUXB is

begin
	s <= e_0 when sel='0' else
			e_1;
end Architecture_MUXB;

