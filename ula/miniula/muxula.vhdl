library IEEE;
use IEEE.std_logic_1164.all;

entity muxula is
    port
    (
    i000   : inout std_logic_vector(7 downto 0);
    i001   : in std_logic_vector(7 downto 0);
    i010   : in std_logic_vector(7 downto 0);
    i011   : in std_logic_vector(7 downto 0);
    i100   : in std_logic_vector(7 downto 0);
    --ula_op0,ula_op1,ula_op2 : in std_logic;
    ula_op : in std_logic_vector(2 downto 0);
    muxs      : out std_logic_vector(7 downto 0)
    );
end entity;

architecture muxacao of muxula is
    begin
     muxs <= i000 when ula_op = "000" else
          i001 when ula_op = "001" else
          i010 when ula_op = "010" else
          i011 when ula_op = "011" else
          i100 when ula_op = "100" else
          (others => 'Z');
end architecture;
