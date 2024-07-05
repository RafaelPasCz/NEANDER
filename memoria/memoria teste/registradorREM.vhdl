library ieee;
use ieee.std_logic_1164.all;

entity registradorREM is
    port(
        endin : in std_logic_vector (7 downto 0);
        clock : in std_logic;
        reset : in std_logic;
        REM_rw : in std_logic;
        endout : out std_logic_vector (7 downto 0)
        );
end entity;

architecture roger of registradorREM is
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
u_registradorREM: regcarga8bit port map(endin,clock,'1',reset,REM_rw,endout);
end architecture;