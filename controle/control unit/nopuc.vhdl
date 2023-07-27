library ieee;
use ieee.std_logic_1164.all;

entity nopuc is
    port(
        b        : in std_logic_vector(2 downto 0);
        saida_cu : out std_logic_vector(10 downto 0)
        -- nbarrinc 10
        -- nbarrpc  9
        -- ula_op 8
        -- ula_op 7 
        -- ula_op 6
        -- pc_nrw 5 
        -- ac_nrw 4
        -- mem_nrw 3
        -- rem_nrw 2
        -- rdm_nrw 1
        -- ri_nrw  0
        );
end entity;

architecture nop of nopuc is
    begin
    saida_cu(10) <= '1';
    saida_cu(9) <= '1';
    saida_cu(8) <= '0';
    saida_cu(7) <= '0';
    saida_cu(6) <= '0';
    saida_cu(5) <= (not b(2)) and (not b(1)) and b(0);
    saida_cu(4) <= '0';
    saida_cu(3) <= '0';
    saida_cu(2) <= (not b(2)) and (not b(1)) and (not b(0));
    saida_cu(1) <= (not b(2)) and (not b(1)) and b(0);
    saida_cu(0) <= not b(2) and b(1) and not b(0);
end architecture;