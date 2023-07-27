library ieee;
use ieee.std_logic_1164.all;

entity testbenchpc is
end entity;

architecture teste of testbenchpc is
    constant CLK_PERIOD : time := 20 ns;
    component programcounter is
        port(
        barramento : in std_logic_vector (7 downto 0);
        nbarrinc : in std_logic;
        pc_rw : in std_logic;
        clock : in std_logic;
        reset : in std_logic;
        endout : out std_logic_vector (7 downto 0)
            );
    end component;

    signal s_barr,s_endout : std_logic_vector (7 downto 0);
    signal s_nbarrinc,s_pc_rw,s_reset : std_logic;
    signal s_clk: std_logic := '0';
    begin
    u_pcounter : programcounter port map(s_barr,s_nbarrinc,s_pc_rw,s_clk,s_reset,s_endout);
    u_tb: process
        begin
            wait for CLK_PERIOD;
            s_nbarrinc <= '0';
            s_barr <= "00000001";
            s_pc_rw <= '1';
            s_reset <= '1';
            wait for CLK_PERIOD;
            s_nbarrinc <= '1';
            s_barr <= "00000001";
            s_pc_rw <= '0';
            s_reset <= '1';
            wait for CLK_PERIOD;
        end process;


    p_clock_n : process
            begin
                s_clk <= not(s_clk);
                wait for CLK_PERIOD/2;
        end process;

end architecture;

