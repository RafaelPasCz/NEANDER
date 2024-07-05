library ieee;
use ieee.std_logic_1164.all;

entity programcounter is
    port(
        barramento : inout std_logic_vector (7 downto 0);
        nbarrinc : in std_logic;
        pc_rw : in std_logic;
        clock : in std_logic;
        reset : in std_logic;
        endout : out std_logic_vector (7 downto 0)
        );
end entity;

architecture pc of programcounter is
    component somador8bits is
        port(
            Asum   : in  std_logic_vector (7 downto 0);
            Bsum   : in  std_logic_vector (7 downto 0);
            Cin    : in  std_logic;
            Sumado : out std_logic_vector (7 downto 0);
            Cout   : out std_logic
            );
    end component;

    component regcarga8bit is
        port(
            d : in std_logic_vector(7 downto 0);
            clk : in std_logic;
            pr, cl : in std_logic;
            nrw : in std_logic;
            s : out std_logic_vector(7 downto 0)
            );
    end component;
    
    signal s_mux2pc,s_pcatual,sadd,s_endpc2mem : std_logic_vector(7 downto 0);
    begin 
    u_somador : somador8bits port map ("00000001",s_pcatual,'0',sadd);
    u_regend  : regcarga8bit port map (s_mux2pc,clock,'1',reset,pc_rw,s_endpc2mem);
    endout <= s_endpc2mem;
    s_pcatual <= s_endpc2mem;
    s_mux2pc <= sadd when nbarrinc = '1' else barramento;
end architecture;