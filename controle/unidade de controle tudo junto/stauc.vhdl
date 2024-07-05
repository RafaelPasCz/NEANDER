library ieee;
use ieee.std_logic_1164.all;

entity stauc is
    port(
        b        : in std_logic_vector(2 downto 0);
        saida_cu : out std_logic_vector (10 downto 0)
        -- nbarrinc : out std_logic;
        -- nbarrpc  : out std_logic;
        -- ula_op   : out std_logic_vector(2 downto 0);
        -- pc_nrw   : out std_logic;
        -- ac_nrw   : out std_logic;
        -- mem_nrw  : out std_logic;
        -- rem_nrw  : out std_logic;
        -- rdm_nrw  : out std_logic;
        -- ri_nrw   : out std_logic
        );
end entity;

architecture sta of stauc is
    begin
    saida_cu(10) <= '1';
    saida_cu(9) <= not(b(2) and (not b(1)) and b(0));
    saida_cu(8) <= '0';
    saida_cu(7) <= '0';
    saida_cu(6) <= '0';
    saida_cu(5) <= ((not b(2)) and (not b(1)) and b(0)) or (b(2) and (not b(1)) and (not b(0)));
    saida_cu(4) <= '0';
    saida_cu(3) <=b(0) and b(1) and not b(2);
    saida_cu(2) <= ((not b(2)) and (not b(1)) and (not b(0))) or ((not b(2)) and b(1) and b(0)) or (b(2) and (not b(1)) and b(2));
    saida_cu(1) <= ((not b(2)) and (not b(1)) and b(0)) or (b(2) and (not b(1)) and (not b(0)));
    saida_cu(0) <= not b(2) and b(1) and not b(0);
end architecture;