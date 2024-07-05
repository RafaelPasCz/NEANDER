library ieee;
use ieee.std_logic_1164.all;
entity decod is 
    port(
        instrin : in std_logic_vector(7 downto 0);
        nop     : out std_logic;
        sta     : out std_logic;
        lda     : out std_logic;
        add     : out std_logic;
        sor     : out std_logic;
        sand    : out std_logic;
        snot    : out std_logic;
        jmp     : out std_logic;
        jn      : out std_logic;
        jz      : out std_logic;
        hlt     : out std_logic
        );
end entity;

architecture decodar of decod is
    begin
    nop <= not(instrin(7)) and not(instrin(6)) and not(instrin(5)) and not(instrin(4));
    sta <= not(instrin(7)) and not(instrin(6)) and not(instrin(5)) and (instrin(4));
    lda <= not(instrin(7)) and not(instrin(6)) and instrin(5) and not(instrin(4));
    add <= not(instrin(7)) and not(instrin(6)) and instrin(5) and instrin(4);
    sor <= not(instrin(7)) and instrin(6) and not(instrin(5)) and not(instrin(4));
    sand <= not(instrin(7)) and instrin(6) and not(instrin(5)) and instrin(4);
    snot <= not(instrin(7)) and instrin(6) and instrin(5) and not(instrin(4));
    jmp <= instrin(7) and not(instrin(6)) and not(instrin(5)) and not(instrin(4));
    jn <= instrin(7) and not(instrin(6)) and not(instrin(5)) and instrin(4);
    jz <= instrin(7) and not(instrin(6)) and instrin(5) and not(instrin(4));
    hlt <= instrin(7) and instrin(6) and instrin(5) and instrin(4);
end architecture;