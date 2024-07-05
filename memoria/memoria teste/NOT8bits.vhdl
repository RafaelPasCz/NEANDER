library IEEE;
use IEEE.std_logic_1164.all;

entity not8bits is 
    port(
        notX : in std_logic_vector(7 downto 0);

        notS : out std_logic_vector(7 downto 0)
        );
end entity not8bits;

architecture behavior of not8bits is
begin
    notS <= not(notX);
end architecture;


