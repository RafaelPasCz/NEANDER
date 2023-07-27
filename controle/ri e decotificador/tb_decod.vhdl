library ieee;
use ieee.std_logic_1164.all;

entity tbdecod is
end entity;

architecture tb of tbdecod is

    component decod is
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
    end component;
    signal  s_instrin : std_logic_vector(7 downto 0);
    signal s_nop,s_sta,s_lda,s_add,s_or,s_and,s_not,s_jmp,s_jn,s_jz,s_hlt : std_logic;
    begin
    u_decod: decod port map(s_instrin,s_nop,s_sta,s_lda,s_add,s_or,s_and,s_not,s_jmp,s_jn,s_jz,s_hlt);
    u_tb: process
        begin
            s_instrin <= "10000000";
            wait for 1 ns;
    end process;
end architecture;