library ieee;
use ieee.std_logic_1164.all;
entity registradorRI is
    port(
        datain : in std_logic_vector (7 downto 0);
        clock : in std_logic;
        reset : in std_logic;
        ri_rw : in std_logic;
        dataout : out std_logic_vector (7 downto 0)
        );
end entity;

architecture RI of registradorRI is
    component regcarga8bit is
        port(
            d : in std_logic_vector(7 downto 0);
            clk : in std_logic;
            pr, cl : in std_logic;
            nrw : in std_logic;
            s : out std_logic_vector(7 downto 0)
            );
    end component;
begin
u_registradorRDM: regcarga8bit port map(datain,clock,'1',reset,ri_rw,dataout);
end architecture;