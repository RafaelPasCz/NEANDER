library IEEE;
use IEEE.std_logic_1164.all;
entity tb_and8bits is
end entity tb_and8bits;

architecture cand8bits of tb_and8bits is

    component and8bits is port(
                X : in std_logic_vector(7 downto 0);
                Y : in std_logic_vector(7 downto 0);
                S : out std_logic_vector(7 downto 0)
    );
    end component;

signal Sx, Sy, Ss: std_logic_vector(7 downto 0);
begin

u_and8bits: and8bits port map (Sx,Sy,Ss);
u_tb: process
begin
    wait for 10 ns;
    Sx <= "11111111";
    Sy <= "11111111";
    wait for 10 ns;
    end process;
end architecture;
    
        
