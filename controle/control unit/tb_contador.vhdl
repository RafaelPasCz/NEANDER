library ieee;
use ieee.std_logic_1164.all;

entity tbcontador is
end entity;

architecture teste of tbcontador is
    constant CLK_PERIOD : time := 20 ns;
    component contador3bit is
        port(
            clk : in std_logic;
            reset : in std_logic;
            s : out std_logic_vector(2 downto 0)
            );
    end component;
    signal s_s : std_logic_vector(2 downto 0);
    signal s_clk: std_logic := '0';
    signal s_reset : std_logic;
    begin
    u_contador : contador3bit port map(s_clk,s_reset,s_s);
    u_tb : process
        begin
            s_reset <= '0';
            wait for CLK_PERIOD;
            s_reset <= '1';
            wait for CLK_PERIOD;
            s_reset <= '1';
            wait for CLK_PERIOD;
            s_reset <= '1';
            wait for CLK_PERIOD;
            s_reset <= '1';
            wait for CLK_PERIOD;
            s_reset <= '1';
            wait for CLK_PERIOD;
            s_reset <= '1';
            wait for CLK_PERIOD;
            s_reset <= '1';
            wait for CLK_PERIOD;
            s_reset <= '1';
            wait for CLK_PERIOD;
        end process;

    p_clock_n : process
        begin
            s_clk <= not(s_clk);
            wait for CLK_PERIOD/2;
        end process;
end architecture;