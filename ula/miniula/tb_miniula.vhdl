
library ieee;
use ieee.std_logic_1164.all;

entity miniula_tb is
end entity;

architecture teste of miniula_tb is
    component miniula is
        port(
        x : in std_logic_vector(7 downto 0);
        y : inout std_logic_vector(7 downto 0);
        ula_op : in std_logic_vector(2 downto 0);
        nz : out std_logic_vector(1 downto 0);
        s : out std_logic_vector(7 downto 0)
        );
    end component;
    signal s_x,s_y,s_s: std_logic_vector(7 downto 0);
    signal s_ula_op: std_logic_vector(2 downto 0);
    signal s_nz: std_logic_vector(1 downto 0);
    begin
    u_miniula:miniula port map(s_x,s_y,s_ula_op,s_nz,s_s);
    u_tb: process
    begin
    s_x <= "01011000";
    s_y <= "01000110";
    s_ula_op <= "001";
    wait for 5 ns;
    s_x <= "11111111";
    s_y <= "00000000";
    s_ula_op <= "011";
    wait for 5 ns;
    s_x <= "11111111";
    s_y <= "00000000";
    s_ula_op <= "010";
    wait for 5 ns;
    s_x <= "11111111";
   -- s_y <= "01000110";
    s_ula_op <= "100";
    wait for 5 ns;
    --s_x <= "01011000";
    s_y <= "01000110";
    s_ula_op <= "000";
    wait for 5 ns;
    end process;
end architecture;
