library ieee;
use ieee.std_logic_1164.all;

entity neander is
    port(
        clk : in std_logic;
        reset : in std_logic
        );
end entity;

architecture neanderizar of neander is
    component unidadedecontrole is
        port(
            barramento : inout std_logic_vector (7 downto 0);
            nbarrinc : in std_logic;
            pcnrw : in std_logic;
            rinrw : in std_logic;
            nz : std_logic_vector(1 downto 0);
            reset : in std_logic;
            clk : in std_logic;
            barr_controle : out std_logic_vector (10 downto 0);
            endout_pc : out std_logic_vector (7 downto 0)
            );
    end component;

    component memoriajunto is
        port(
            end_PC : in std_logic_vector (7 downto 0);
            end_barr : inout std_logic_vector (7 downto 0);
            nbartpc : in std_logic;
            RDM_rw : in std_logic;
            REM_rw : in std_logic;
            mem_RW : in std_logic;
            reset : in std_logic;
            clock : in std_logic;
            interface_barramento: inout std_logic_vector(7 downto 0)
            );
    end component;

    component ulona is
        port(
            barramento : inout std_logic_vector (7 downto 0);
            mem_rw : in std_logic;
            ac_rw : in std_logic;
            ula_op: in std_logic_vector(2 downto 0);
            cl : in std_logic;
            clock: in std_logic;
            interface_flags: out std_logic_vector(1 downto 0)
            );
    end component;
    signal s_barramento, s_endout : std_logic_vector (7 downto 0);
    signal s_barrctrl   : std_logic_vector (10 downto 0);
    signal s_nz         : std_logic_vector (1 downto 0);
    signal s_ula_op: std_logic_vector (2 downto 0);
    begin
        s_ula_op(2) <= s_barrctrl(8);
        s_ula_op(1) <= s_barrctrl(7);
        s_ula_op(0) <= s_barrctrl(6);

        -- nbarrinc 10
        -- nbarrpc  9
        -- ula_op 8
        -- ula_op 7 
        -- ula_op 6
        -- pc_nrw 5 
        -- ac_nrw 4
        -- mem_nrw 3
        -- rem_nrw 2
        -- rdm_nrw 1
        -- ri_nrw  0
    u_unidadecontrole : unidadedecontrole port map (s_barramento, s_barrctrl(10), s_barrctrl(5), s_barrctrl(0), s_nz,reset, clk ,s_barrctrl,s_endout);
    u_memoriajunto : memoriajunto port map (s_endout, s_barramento, s_barrctrl(9), s_barrctrl(1), s_barrctrl(2), s_barrctrl(3), reset,clk,s_barramento);
    u_ula : ulona port map (barramento => s_barramento,mem_rw => s_barrctrl(3), ac_rw => s_barrctrl(4), ula_op(2) => s_barrctrl(8), ula_op(1) => s_barrctrl(7), ula_op(0) => s_barrctrl(6), cl => reset, clock => clk, interface_flags => s_nz);
end architecture;