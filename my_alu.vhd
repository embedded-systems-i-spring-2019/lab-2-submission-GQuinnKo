
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity my_alu is
  Port (A, B : in std_logic_vector (3 downto 0);
        Opcode : in std_logic_vector(3 downto 0);
        F : out std_logic_vector(3 downto 0));
end my_alu;

architecture Behavioral of my_alu is

begin
p: process(A, B, Opcode)
begin
    case(Opcode) is
    when "0000" => F <= std_logic_vector(unsigned(A) + unsigned(B));
    when "0001" => F <= std_logic_vector(unsigned(A) - unsigned(B));
    when "0010" => F <= std_logic_vector(unsigned(A) + 1);
    when "0011" => F <= std_logic_vector(unsigned(A) - 1);
    when "0100" => F <= std_logic_vector(0 - unsigned(A));
    when "0101" => if(A > B) then F <= "0001";
                   else F <= "0000"; 
                   end if;
    when "0110" => F <= std_logic_vector(unsigned(A) sll 1);
    when "0111" => F <= std_logic_vector(unsigned(A) srl 1);
    when "1000" => F <= '1' & A(3 downto 1);
    when "1001" => F <= NOT A;
    when "1010" => F <= A AND B;
    when "1011" => F <= A OR B;
    when "1100" => F <= A XOR B;
    when "1101" => F <= A XNOR B;
    when "1110" => F <= A NAND B;
    when "1111" => F <= A NOR B;
    end case;
end process;
end Behavioral;
