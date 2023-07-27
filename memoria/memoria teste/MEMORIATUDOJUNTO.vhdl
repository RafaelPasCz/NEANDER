library IEEE;
use IEEE.std_logic_1164.all;

entity memoriajunto is
    port(
        end_PC : in std_logic_vector (7 downto 0);
        end_barr : in std_logic_vector (7 downto 0);
        nbartpc : in std_logic;
        RDM_rw : in std_logic;
        REM_rw : in std_logic;
        mem_RW : in std_logic;
        reset : in std_logic;
        clock : in std_logic;
        interface_barramento: inout std_logic_vector(7 downto 0)
        );
end entity;

--u_regREM : registradorREM port map(s_mux2rem,clock,reset,REM_rw,s_rem2mem);
--u_as_ram : as_ram port map(s_rem2mem,s_mem2rdm,mem_rw,reset);
--u_regRDM : registradorRDM port map(s_mem2rdm,clock,reset,RDM_rw,interface_barramento);


architecture meme of memoriajunto is
    component  registradorREM is
        port(
            endin : in std_logic_vector (7 downto 0);
            clock : in std_logic;
            reset : in std_logic;
            REM_rw : in std_logic;
            endout : out std_logic_vector (7 downto 0)
            );
    end component;

    component as_ram is
        port(
            addr  : in    std_logic_vector(7 downto 0);
            data  : inout std_logic_vector(7 downto 0);
            notrw : in    std_logic;
            reset : in    std_logic
            );
    end component;

    component registradorRDM is
        port(
            datain : in std_logic_vector (7 downto 0);
            clock : in std_logic;
            reset : in std_logic;
            RDM_rw : in std_logic;
            dataout : out std_logic_vector (7 downto 0)
            );
    end component;
    signal s_mux2rem, s_rem2mem, s_mem2rdm,s_rdm2barr: std_logic_vector(7 downto 0);
    begin
        u_regREM : registradorREM port map(s_mux2rem,clock,reset,REM_rw,s_rem2mem);
        u_as_ram : as_ram port map(s_rem2mem,s_mem2rdm,mem_RW,reset);
        u_regRDM : registradorRDM port map(s_mem2rdm,clock,reset,RDM_rw,s_rdm2barr);
        s_mux2rem <= end_PC when nbartpc = '1' else (end_barr);
        s_mem2rdm <= interface_barramento when mem_RW = '1' else (others => 'Z');
        interface_barramento <= s_rdm2barr when mem_RW = '0' else (others => 'Z');
end architecture;