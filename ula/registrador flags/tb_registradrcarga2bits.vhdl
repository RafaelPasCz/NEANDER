library ieee;
use ieee.std_logic_1164.all;
entity reg2bitstb is
end entity;

architecture teste of reg2bitstb is
    constant CLK_PERIOD : time := 20 ns;
    component regCarga2bit is
        port(
            d : in std_logic_vector(1 downto 0);
            clk : in std_logic;
            pr, cl : in std_logic;
            nrw : in std_logic;
            s : out std_logic_vector(1 downto 0)
            );
    end component;
    signal s_datain,s_saida : std_logic_vector(1 downto 0);
    signal s_cl, s_nrw : std_logic;
    signal s_clk: std_logic := '0';
    signal s_pr: std_logic := '1';
    
    begin
    u_reg2bits : regcarga2bit port map(s_datain,s_clk,s_pr,s_cl,s_nrw,s_saida);
        u_tb: process
        begin
            s_datain <= "00";
            -- s_pr <= '1';
            s_cl <= '0';
            s_nrw <= '0';
            wait for CLK_PERIOD;
            s_datain <= "00";
            -- s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '0';
            wait for CLK_PERIOD;
            s_datain <= "10";
            -- s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '1';
            wait for CLK_PERIOD;
            s_datain <= "01";
            -- s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '1';
            wait for CLK_PERIOD;
            s_datain <= "10";
            -- s_pr <= '1';
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