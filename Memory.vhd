library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Memory is
    Port ( clk : in  STD_LOGIC;
           MEMrq : in  STD_LOGIC;
           RnW : in  STD_LOGIC;
           addr_bus : in  STD_LOGIC_VECTOR (11 downto 0);
           data_bus : inout  STD_LOGIC_VECTOR (15 downto 0));
end Memory;

architecture Architecture_Memory of Memory is

type memory_type is array ( integer range 0 to 15 ) of std_logic_vector (15 downto 0);
signal memory : memory_type :=(
"0000000000000100",--0
"0010000000000101",--1
"0001000000000110",--2
"0111000000000000",--3
"0000000000000001",--4
"0000000000000010",--5
"0000000000000000",--6
"0000000000000000",--7
"0000000000000000",--8
"0000000000000000",--9
"0000000000000000",--10
"0000000000000000",--11
"0000000000000000",--12
"0000000000000000",--13
"0000000011000000",--14
"0000000000100000"--15
);
begin
	data_bus <= memory(to_integer(unsigned(addr_bus))) when (MEMrq='1' and RnW ='1') else (others=>'Z');
		process(clk)
		begin
			if rising_edge(clk) then 
				if ( MEMrq='1' and RnW ='0' ) then 
					memory(to_integer(unsigned(addr_bus)))<= data_bus;
				end if; 
			end if ;
		end process;

end Architecture_Memory;
