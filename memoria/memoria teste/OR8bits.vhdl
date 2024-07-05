library IEEE;
use IEEE.std_logic_1164.all;

entity or8bits is 
    port(
        orX : in std_logic_vector(7 downto 0);
        orY : in std_logic_vector(7 downto 0);
        orS : out std_logic_vector(7 downto 0)
        );
end entity or8bits;

architecture behavior of or8bits is
begin
    orS <= orX or orY;
end architecture;


