library ieee;
use ieee.std_logic_1164.all;
entity reg8bitstb is
end entity;

architecture teste of reg8bitstb is
    constant CLK_PERIOD : time := 20 ns;
    component regCarga8bit is
        port(
            d : in std_logic_vector(7 downto 0);
            clk : in std_logic;
            pr, cl : in std_logic;
            nrw : in std_logic;
            s : out std_logic_vector(7 downto 0)
            );
    end component;
    signal s_datain,s_saida : std_logic_vector(7 downto 0);
    signal s_pr, s_cl, s_nrw : std_logic;
    signal s_clk: std_logic := '0';
    
    begin
    u_reg8bits : regcarga8bit port map(s_datain,s_clk,s_pr,s_cl,s_nrw,s_saida);
        u_tb: process
        begin
            s_datain <= "00000000";
            s_pr <= '1';
            s_cl <= '0';
            s_nrw <= '0';
            wait for CLK_PERIOD;
            s_datain <= "00000000";
            s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '0';
            wait for CLK_PERIOD;
            s_datain <= "10000000";
            s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '1';
            wait for CLK_PERIOD;
            s_datain <= "00000001";
            s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '1';
            wait for CLK_PERIOD;
            s_datain <= "10000000";
            s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '0';
            wait for CLK_PERIOD;
        end process;

        p_clock_n : process
            begin
            s_clk <= not(s_clk);
            wait for CLK_PERIOD/2;
        end process;

end architecture;