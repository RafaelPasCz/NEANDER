library IEEE;
use IEEE.std_logic_1164.all;

entity ulona is
    port(
        barramento : inout std_logic_vector (7 downto 0);
        mem_rw : in std_logic;
        ac_rw : in std_logic;
        ula_op: in std_logic_vector(2 downto 0);
        cl : in std_logic;
        clock: in std_logic;
        interface_flags: out std_logic_vector(1 downto 0)
        );
end entity;

architecture ular of ulona is

    component regcarga8bit is
        port(
            d : in std_logic_vector(7 downto 0);
            clk : in std_logic;
            pr, cl : in std_logic;
            nrw : in std_logic;
            s : out std_logic_vector(7 downto 0)
            );
    end component;

    component miniula is
        port(
            x : in std_logic_vector(7 downto 0);
            y : in std_logic_vector(7 downto 0);
            ula_op : in std_logic_vector(2 downto 0);
            nz : out std_logic_vector(1 downto 0);
            s : out std_logic_vector(7 downto 0)
            );
    end component;

    component regcarga2bit is
        port(
            d : in std_logic_vector(1 downto 0);
            clk : in std_logic;
            pr, cl : in std_logic;
            nrw : in std_logic;
            s : out std_logic_vector(1 downto 0)
            );
    end component;
    signal s_ac2ula, s_ula2ac: std_logic_vector(7 downto 0);
    signal s_nz : std_logic_vector(1 downto 0);
    begin
    u_regcarga8: regcarga8bit port map(s_ula2ac,clock,'1',cl,ac_rw,s_ac2ula);
    u_regcarga2: regcarga2bit port map(s_nz,clock,'1',cl,ac_rw,interface_flags);
    u_ula: miniula port map(s_ac2ula,barramento,ula_op,s_nz,s_ula2ac);
    barramento <= s_ac2ula when mem_rw = '1' else (others => 'Z');
end architecture;
        

