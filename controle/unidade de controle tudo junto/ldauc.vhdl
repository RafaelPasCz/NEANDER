library ieee;
use ieee.std_logic_1164.all;

entity ldauc is
    port(
        b        : in std_logic_vector(2 downto 0);
        saida_cu : out std_logic_vector(10 downto 0)
        );
end entity;
    
architecture lda of ldauc is
    begin
    saida_cu(10) <= '1';
    saida_cu(9) <= not(b(2)) or b(1) or not(b(0));
    saida_cu(8) <= '0';
    saida_cu(7) <= '0';
    saida_cu(6) <= '0';
    saida_cu(5) <= not(b(1)) and (b(2) xor b(0));
    saida_cu(4) <= b(2) and b(1) and b(0);
    saida_cu(3)<= '0';
    saida_cu(2) <= (not b(1) and (b(2) xnor b(0))) or (not(b(2)) and b(1) and b(0));
    saida_cu(1) <= (b(2) and not b(0)) or (not b(2) and not b(1) and b(0));
    saida_cu(0) <= not b(2) and b(1) and not b(0);

end architecture;
