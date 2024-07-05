library ieee;
use ieee.std_logic_1164.all;

entity registradorRDM is
    port(
        datain : in std_logic_vector (7 downto 0);
        clock : in std_logic;
        reset : in std_logic;
        RDM_rw : in std_logic;
        dataout : out std_logic_vector (7 downto 0)
        );
end entity;

architecture RDM of registradorRDM is
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
u_registradorRDM: regcarga8bit port map(datain,clock,'1',reset,RDM_rw,dataout);
end architecture;
