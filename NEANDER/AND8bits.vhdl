library IEEE;
use IEEE.std_logic_1164.all;

entity and8bits is 
    port(
        andX : in std_logic_vector(7 downto 0);
        andY : in std_logic_vector(7 downto 0);
        andS : out std_logic_vector(7 downto 0)
        );
end entity and8bits;

architecture behavior of and8bits is
begin
    andS <= andX and andY;
end architecture;


