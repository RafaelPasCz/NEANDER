library ieee;
use ieee.std_logic_1164.all;

entity tb_regcarga is
end entity;

architecture test of tb_regcarga is
    constant CLK_PERIOD : time := 20 ns;

    component regcarga is
        port(
            d : in std_logic;
            clk : in std_logic;
            pr, cl : in std_logic;
            nrw : in std_logic;
            s : out std_logic
            );
    end component;

    signal s_datain,s_pr,s_cl,s_nrw,s_dataout: std_logic;
    signal s_clk : std_logic := '0';
    begin
    u_regcarga: regcarga port map(s_datain,s_clk,s_pr,s_cl,s_nrw,s_dataout);
        u_rg: process
        begin
        --0
            s_datain <= '0';
            s_pr <= '1';
            s_cl <= '0';
            s_nrw <= '0';
            wait for CLK_PERIOD;
            s_datain <= '0';
            s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '0';
            wait for CLK_PERIOD;
            s_datain <= '1';
            s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '1';
            wait for CLK_PERIOD;
            s_datain <= '0';
            s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '1';
            wait for CLK_PERIOD;
            s_datain <= '1';
            s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '0';
            wait for CLK_PERIOD;
            s_datain <= '0';
            s_pr <= '1';
            s_cl <= '1';
            s_nrw <= '1';
            wait for CLK_PERIOD;

        end process;
        p_clock_n : process
            begin
    
            s_clk <= not(s_clk);
            wait for CLK_PERIOD/2;
    
        end process;

end architecture;