library ieee;
use ieee.std_logic_1164.all;

entity tbcontrolunit is
end entity;

architecture teste of tbcontrolunit is
    constant CLK_PERIOD : time := 20 ns;
    component controlunit is
        port(
            mux_op   : in std_logic_vector (10 downto 0);
            nz       : in std_logic_vector (1 downto 0);
            reset    : in std_logic;
            clk      : in std_logic;
            s        : out std_logic_vector (10 downto 0)
            );
    end component;
    signal s_mux_op, s_s : std_logic_vector (10 downto 0);
    signal s_nz : std_logic_vector (1 downto 0);
    signal s_reset: std_logic;
    signal s_clk: std_logic := '0';
    begin
        u_controlunit : controlunit port map(s_mux_op,s_nz,s_reset,s_clk,s_s);
        u_tb : process
            begin
            s_reset <= '0';
            wait for CLK_PERIOD;
            s_reset <= '0';
            wait for CLK_PERIOD;
            s_reset <= '1';
            s_mux_op <= "00000000001";
            s_nz <= "01";
            wait for CLK_PERIOD * 7;
            end process;
        p_clock_n : process
            begin
            s_clk <= not(s_clk);
            wait for CLK_PERIOD/2;
        end process;
end architecture;