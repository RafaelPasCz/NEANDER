library ieee;
use ieee.std_logic_1164.all;

entity unidadedecontrole is
    port(
        barramento : in std_logic_vector (7 downto 0);
        nbarrinc : in std_logic;
        pcnrw : in std_logic;
        rinrw : in std_logic;
        nz : std_logic_vector(1 downto 0);
        reset : in std_logic;
        clk : in std_logic;
        barr_controle : out std_logic_vector (10 downto 0)
        );
end entity;

architecture controle of unidadedecontrole is
    component programcounter is
        port(
            barramento : in std_logic_vector (7 downto 0);
            nbarrinc   : in std_logic;
            pc_rw      : in std_logic;
            clock      : in std_logic;
            reset      : in std_logic;
            endout     : out std_logic_vector (7 downto 0)
            );
    end component;

    component registradorri
        port(
            datain : in std_logic_vector (7 downto 0);
            clock : in std_logic;
            reset : in std_logic;
            ri_rw : in std_logic;
            dataout : out std_logic_vector (7 downto 0)
            );
    end component;

    component decod is 
        port(
            instrin : in std_logic_vector(7 downto 0);
            instrout :out std_logic_vector(10 downto 0)
            );
    end component;

    component controlunit is
        port(
            mux_op   : in std_logic_vector (10 downto 0);
            nz       : in std_logic_vector (1 downto 0);
            reset    : in std_logic;
            clk      : in std_logic;
            s        : out std_logic_vector (10 downto 0)
            );
    end component;
    signal s_barr, s_instrin : std_logic_vector (7 downto 0);
    signal s_instrout : std_logic_vector (10 downto 0);
    --signal s_nz : std_logic_vector(1 downto 0);
    begin
        u_programcounter : programcounter port map(barramento,nbarrinc,pcnrw,clk,reset);
        u_registradorri : registradorri port map(barramento,clk,reset,rinrw,s_instrin);
        u_decodificador : decod port map(s_instrin,s_instrout);
        u_controulunit : controlunit port map (s_instrout,nz,reset,clk,barr_controle);
    end architecture;
