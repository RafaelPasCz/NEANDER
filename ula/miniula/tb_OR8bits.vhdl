library IEEE;
use IEEE.std_logic_1164.all;

entity tb_or8bits is
end entity tb_or8bits;

architecture cor8bits of tb_or8bits is

    component or8bits is port(
                orX : in std_logic_vector(7 downto 0);
                orY : in std_logic_vector(7 downto 0);
                orS : out std_logic_vector(7 downto 0)
    );
    end component;

signal orSx, orSy, orSs: std_logic_vector(7 downto 0);
begin

u_or8bits: or8bits port map (orSx,orSy,orSs);
u_tb: process
begin
    wait for 10 ns;
    orSx <= "11111111";
    orSy <= "00000000";
    wait for 10 ns;
    end process;
end architecture;
    
        
