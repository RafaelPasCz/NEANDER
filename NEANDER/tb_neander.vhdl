library ieee;
use ieee.std_logic_1164.all;

entity tbneander is
end entity;

architecture teste of tbneander is
    constant CLK_PERIOD : time := 20 ns;
    component neander is
        port(
        clk : in std_logic;
        reset : in std_logic
        );
    end component;
    signal s_clk: std_logic := '0';
    signal s_reset : std_logic;
    begin
        u_neander : neander port map(s_clk,s_reset);
        u_tb : process
        begin
            s_reset <= '0';
            wait for CLK_PERIOD;
            s_reset <= '1';
            wait;
        end process;
        p_clock_n : process
            begin
            s_clk <= not(s_clk);
            wait for CLK_PERIOD/2;
        end process;

end architecture;