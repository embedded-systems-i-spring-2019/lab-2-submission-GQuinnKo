library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
  port (
    A_in, B_in : in std_logic_vector(3 downto 0);
    C_in0 : in STD_LOGIC;
    C_out3 : out STD_LOGIC;
    S_out : out std_logic_vector(3 downto 0)
  );
end ripple_adder;

architecture Behavioral of ripple_adder is
  component adder_one is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    C_in : in STD_LOGIC;
    S : out STD_LOGIC;
    C_out : out STD_LOGIC
  );
  end component adder_one;

signal C : std_logic_vector(2 downto 0);
begin
adder_one_0: component adder_one
     port map (
      A => A_in(0),
      B => B_in(0),
      C_in => C_in0,
      C_out => C(0),
      S => S_out(0)
    );
adder_one_1: component adder_one
     port map (
      A => A_in(1),
     B => B_in(1),
     C_in => C(0),
     C_out => C(1),
     S => S_out(1)
    );
adder_one_2: component adder_one
     port map (
      A => A_in(2),
     B => B_in(2),
     C_in => C(1),
     C_out => C(2),
     S => S_out(2)
   );
adder_one_3: component adder_one
     port map (
      A => A_in(3),
     B => B_in(3),
     C_in => C(2),
     C_out => C_out3,
     S => S_out(3)
   );
end Behavioral;
