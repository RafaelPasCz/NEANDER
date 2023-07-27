library ieee;
use ieee.std_logic_1164.all;

entity jnuc is
    port(
        b        : in std_logic_vector(2 downto 0);
        n        : in std_logic;
        saida_cu : out std_logic_vector (10 downto 0)
        );
end entity;
    
architecture jn of jnuc is
    begin
        saida_cu(10)    <= not b(2) when n = '0' else (not ( ( b(2) and not(b(1)) and b(0) ) or ( b(2) and b(1) and not(b(0)) ) or ( b(2) and b(1) and b(0) ) ) );
        saida_cu(9)     <= not b(2) when n = '0' else (not ( ( b(2) and b(1) and not(b(0)) ) or ( b(2) and b(1) and b(0) ) ));
        saida_cu(8)     <= '0';
        saida_cu(7)     <= '0';
        saida_cu(6)     <= '0';
        saida_cu(5)     <= ((not b(2) and not b(1) and b(0)) or (not b(2) and b(1) and b(0))) when n = '0' else ( ( not(b(2)) and not(b(1)) and b(0) ) or ( (b(2)) and not(b(1)) and (b(0)) ) or (not b(2) and b(1) and b(0) ) ); --and not n;
        saida_cu(4)     <= '0';
        saida_cu(3)     <= '0';
        saida_cu(2)     <= (not b(2) and not b(1) and not b(0)) when n = '0' else (( not b(2) and not b(1) and not b(0) ) or (not b(2) and b(1) and b(0))); --and not n;
        saida_cu(1)     <= (not b(2) and not b(1) and b(0)) when n = '0' else (( not b(2) and not b(1) and b(0) ) or ( b(2) and not(b(1)) and not(b(0)) ));
        saida_cu(0)     <= ( ((not b(2)) and b(1) and (not b(0)))) when n = '0' else ( (not b(2)) and b(1) and (not b(0)) );
end architecture;

--pc_nrw <= (not b(2) and not b(1) and b(0)) or (not b(2) and b(1) and b(0))) when n = '0' else (( ( not(b(2)) and not(b(1)) and b(0) ) or ( b(2) and not(b(1)) and b(0) ) )