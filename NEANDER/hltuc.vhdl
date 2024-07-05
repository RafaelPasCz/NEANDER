library ieee;
use ieee.std_logic_1164.all;


entity hltuc is
    port(
       b        : in std_logic_vector(2 downto 0);
       saida_cu : out std_logic_vector (10 downto 0)
        );
end entity;

architecture hlt of hltuc is
    begin
        saida_cu(10) <= '0';
        saida_cu(9) <= '0';
        saida_cu(8) <= '0';
        saida_cu(7) <= '0';
        saida_cu(6) <= '0';
        saida_cu(5) <= '0';
        saida_cu(4) <= '0';
        saida_cu(3) <= '0';
        saida_cu(2) <= '0';
        saida_cu(1) <= '0';
        saida_cu(0) <= '0';
end architecture;