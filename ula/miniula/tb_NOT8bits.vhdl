library IEEE;
use IEEE.std_logic_1164.all;

entity tb_not8bits is
end entity tb_not8bits;

architecture cnot8bits of tb_not8bits is

    component not8bits is port(
                notX : in std_logic_vector(7 downto 0);

                notS : out std_logic_vector(7 downto 0)
    );
    end component;

signal notSx,notSs: std_logic_vector(7 downto 0);
begin

u_not8bits: not8bits port map (notSx,notSs);
u_tb: process
begin
    wait for 10 ns;
    notSx <= "11111111";
    wait for 10 ns;
    end process;
end architecture;
    
        
