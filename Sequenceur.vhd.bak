----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:12:49 02/28/2021 
-- Design Name: 
-- Module Name:    Sequenceur - Behavioral_sequenceur 
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

entity Sequenceur is
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
end Sequenceur;

architecture Behavioral_sequenceur of Sequenceur is
type me_states is (INIT,FETCH,EXECUTE,STOP);
signal etat_cr,etat_sv: me_states ;
begin
process(clk,reset)
	begin
		if reset='1' then etat_cr <= INIT;
		elsif rising_edge(clk) then etat_cr <= etat_sv;
		end if;
end process;

process(etat_cr,opcode,accz,acc15)
	begin
		etat_sv <= etat_cr;
		raz <= '0';
		selA <= '0';
		selB <= '0';
		acc_ld <= '0';
		acc_oe <= '0';
		pc_ld <= '0';
		ir_ld <= '0';
		alufs  <= "0011";
		memrq <= '1';
		rnw <= '1';
		case etat_cr is
			when INIT =>
				etat_sv <= FETCH;
				raz  <= '1';
			when FETCH =>
				etat_sv <= EXECUTE;
				ir_ld <='1';
				alufs  <= "0011";
				pc_ld <= '1';
			when EXECUTE =>
				case opcode is 
					when "0000" =>
						selA <= '1';
						selB <= '1';
						alufs <= "0000";
						acc_ld <= '1';
						etat_sv <= FETCH;
					when "0001" =>
						selA <= '1';
						acc_oe <= '1';
						rnw <='0';
						etat_sv <= FETCH;					
					when "0010" =>
						selA <= '1';
						selB <= '1';
						alufs <= "0010";
						acc_ld <= '1';
						etat_sv <= FETCH;
					when "0011" =>
						selA <= '1';
						selB <= '1';
						alufs <= "0001";
						acc_ld <= '1';
						etat_sv <= FETCH;					
					when "0100" =>
						selA <= '1';
						alufs <= "0000";
						pc_ld <= '1';
						etat_sv <= FETCH;
					when "0101" =>
						if acc15 ='0' then
							selA <= '1';
							alufs <= "0000";
							pc_ld <= '1';
						end if;	
						etat_sv <= FETCH;						
					when "0110" =>
						if accz ='0' then
							selA <= '1';
							alufs <= "0000";
							pc_ld <= '1';
						end if;
						etat_sv <= FETCH;
					when "0111" =>
						etat_sv <= STOP;						
					when "1000" =>
						selA <= '1';
						selB <= '1';
						alufs <= "0100";
						acc_ld <= '1';
						etat_sv <= FETCH;
					when "1001" =>
						selA <= '1';
						selB <= '1';
						alufs <= "0101";
						acc_ld <= '1';
						etat_sv <= FETCH;												
					when "1010" =>
						selA <= '1';
						selB <= '1';
						alufs <= "1001";
						acc_ld <= '1';
						etat_sv <= FETCH;	
					when "1011" =>
						selA <= '1';
						selB <= '1';
						alufs <= "0000";
						acc_ld <= '1';
						etat_sv <= FETCH;
					when others =>
						etat_sv <= STOP;
				end case;
				when STOP => etat_sv <= STOP;
		end case;		
end process;
end Behavioral_sequenceur;

