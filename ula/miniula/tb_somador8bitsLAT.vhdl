library ieee;
use ieee.std_logic_1164.all;

entity tb_somador8bits is
end entity;

architecture soma8bit of tb_somador8bits is
    component somador8bits is
        port(
            Asum   : in  std_logic_vector (7 downto 0);
            Bsum   : in  std_logic_vector (7 downto 0);
            Cin    : in  std_logic;
            Sumado : out std_logic_vector (7 downto 0);
            Cout   : out std_logic
        );
    end component;

    signal sAsum, sBsum, sSumado : std_logic_vector (7 downto 0);
    signal sCin, sCout : std_logic;

    begin
        u_soma8bit : somador8bits port map (
            sAsum, sBsum, sCin, sSumado, sCout
        );

        u_tb : process
        begin

        sAsum <= "00001101";
        sBsum <= "00111000";
        wait for 1 ns;









        


        wait;
        end process;

end architecture;
