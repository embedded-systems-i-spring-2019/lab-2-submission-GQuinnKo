----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 03:17:29 PM
-- Design Name: 
-- Module Name: adder_test - tb
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_test is

end adder_test;

architecture tb of adder_test is

component ripple_adder is
  port (
    A_in, B_in : in std_logic_vector(3 downto 0);
    C_in0 : in STD_LOGIC;
    C_out3 : out STD_LOGIC;
    S_out : out std_logic_vector(3 downto 0)
  );
end component;

signal A, B : std_logic_vector(3 downto 0) := (others => '0');
signal C_in, C_out : std_logic := '0';
signal S : std_logic_vector(3 downto 0) := (others => '0');

begin

    adder: ripple_adder port map(A_in(0) => A(0), A_in(1) => A(1), A_in(2) => A(2), A_in(3) => A(3),
                          B_in(0) => B(0), B_in(1) => B(1), B_in(2) => B(2), B_in(3) => B(3),
                          C_in0 => C_in, C_out3 => C_out,
                          S_out(0) => S(0), S_out(1) => S(1), S_out(2) => S(2),S_out(3) => S(3));

process begin
    C_in <= '0';
    A <= "0101";
    wait for 20 ns;
    B <= "0101";
    wait for 20 ns;
    B <= "1011";
    wait for 20 ns;
    C_in <= '1';
    wait for 20 ns;
end process;

end tb;
