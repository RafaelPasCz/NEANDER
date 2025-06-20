library ieee;
use ieee.std_logic_1164.all;
entity decod is 
    port(
        instrin : in std_logic_vector(7 downto 0);
        instrout :out std_logic_vector(10 downto 0)
        -- nop     : out std_logic;
        -- sta     : out std_logic;
        -- lda     : out std_logic;
        -- add     : out std_logic;
        -- sor     : out std_logic;
        -- sand    : out std_logic;
        -- snot    : out std_logic;
        -- jmp     : out std_logic;
        -- jn      : out std_logic;
        -- jz      : out std_logic;
        -- hlt     : out std_logic
        );
end entity;

architecture decodar of decod is
    begin
        instrout <= "10000000000" when instrin ="00000000" else 
                    "01000000000" when instrin ="00010000" else 
                    "00100000000" when instrin ="00100000" else 
                    "00010000000" when instrin ="00110000" else 
                    "00001000000" when instrin ="01000000" else 
                    "00000100000" when instrin ="01010000" else 
                    "00000010000" when instrin ="01100000" else 
                    "00000001000" when instrin ="10000000" else 
                    "00000000100" when instrin ="10010000" else 
                    "00000000010" when instrin ="10100000" else 
                    "00000000001" when instrin ="11110000" else
                    (others => 'Z');
--    instrout(10) <= not(instrin(7)) and not(instrin(6)) and not(instrin(5)) and not(instrin(4));
--    instrout(9)  <= not(instrin(7)) and not(instrin(6)) and not(instrin(5)) and (instrin(4));
--    instrout(8)  <= not(instrin(7)) and not(instrin(6)) and instrin(5) and not(instrin(4));
--    instrout(7)  <= not(instrin(7)) and not(instrin(6)) and instrin(5) and instrin(4);
--    instrout(6)  <= not(instrin(7)) and instrin(6) and not(instrin(5)) and not(instrin(4));
--    instrout(5)  <= not(instrin(7)) and instrin(6) and not(instrin(5)) and instrin(4);
--    instrout(4)  <= not(instrin(7)) and instrin(6) and instrin(5) and not(instrin(4));
--    instrout(3)  <= instrin(7) and not(instrin(6)) and not(instrin(5)) and not(instrin(4));
--    instrout(2)  <= instrin(7) and not(instrin(6)) and not(instrin(5)) and instrin(4);
--    instrout(1)  <= instrin(7) and not(instrin(6)) and instrin(5) and not(instrin(4));
--    instrout(0)  <= instrin(7) and instrin(6) and instrin(5) and instrin(4);
end architecture;