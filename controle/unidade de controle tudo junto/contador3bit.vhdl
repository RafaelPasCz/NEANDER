library ieee;
use ieee.std_logic_1164.all; -- std_logic para detectar erros

entity contador3bit is
    port(
        clk : in std_logic;
        reset : in std_logic;
        s : out std_logic_vector(2 downto 0)
        );
end entity;

architecture contar of contador3bit is
    component fft is
        port(
            t  : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
            );
    end component;
    signal s_t,s_s: std_logic_vector(2 downto 0);
    begin
        u_fft0: fft port map(s_t(0),clk,'1',reset,s_s(0));
        u_fft1: fft port map(s_t(1),clk,'1',reset,s_s(1));
        u_fft2: fft port map(s_t(2),clk,'1',reset,s_s(2));
        s <= s_s;
        s_t(0) <= '1';
        s_t(1) <= s_s(0);
        s_t(2) <= s_s(1) and s_s(0);
end architecture;