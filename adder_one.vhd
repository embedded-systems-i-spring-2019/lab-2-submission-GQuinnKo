----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adder_one is
  Port (A, B, C_in : in std_logic;
        S, C_out : out std_logic );
end adder_one;

architecture Behavioral of adder_one is
signal sum : std_logic;
begin
sum <= A xor B;
S <= sum xor C_in;
C_out <= (sum and C_in) or (A and B);

end Behavioral;
