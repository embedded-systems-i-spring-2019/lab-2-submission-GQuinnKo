
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_tester is
  Port (sw, btn : in  std_logic_vector (3 downto 0);
        clk : in std_logic;
        led : out std_logic_vector (3 downto 0));
end alu_tester;

architecture Behavioral of alu_tester is

component my_alu is
  Port (A, B : in std_logic_vector (3 downto 0);
        Opcode : in std_logic_vector(3 downto 0);
        F : out std_logic_vector(3 downto 0));
end component;

component debouncer is
 Port ( clkd, bt : in std_logic;
        debounce: out std_logic);
end component;

signal value : std_logic_vector (3 downto 0);
signal dbnc : std_logic_vector (3 downto 0);
signal A_temp, B_temp, OP_temp : std_logic_vector (3 downto 0);
begin

process(clk)
begin
if rising_edge(clk) then
    if(dbnc(3) = '1') then
        A_temp <= (others => '0');
        B_temp <= (others => '0');
        OP_temp <= (others => '0');
    else
        if(dbnc(0) = '1') then B_temp <= sw; end if;
        if(dbnc(1) = '1') then A_temp <= sw; end if;
        if(dbnc(2) = '1') then OP_temp <= sw; end if;
    end if;
end if;
end process;

u1: debouncer
port map ( bt => btn(0),
           clkd => clk,
           debounce => dbnc(0));

u2: debouncer
port map ( bt => btn(1),
           clkd => clk,
           debounce => dbnc(1));
           
u3: debouncer
port map ( bt => btn(2),
           clkd => clk,
           debounce => dbnc(2));

u4: debouncer
port map ( bt => btn(3),
           clkd => clk,
           debounce => dbnc(3));

u5: my_alu
port map ( A => A_temp,
           B => B_temp,
           Opcode => OP_temp,
           F => led);
           


end Behavioral;
