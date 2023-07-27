library IEEE;
use IEEE.std_logic_1164.all;

entity lda8bits is
    port(
        lday: in std_logic_vector(7 downto 0);
        ldas: out   std_logic_vector(7 downto 0)
        );
end entity;

architecture lda of lda8bits is
    begin
    ldas <= lday;
end architecture;