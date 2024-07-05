library IEEE;
use IEEE.std_logic_1164.all;

entity miniula is
    port(
        x : in std_logic_vector(7 downto 0);
        y : in std_logic_vector(7 downto 0);
        ula_op : in std_logic_vector(2 downto 0);
        nz : out std_logic_vector(1 downto 0);
        s : out std_logic_vector(7 downto 0)
        );
end entity;

architecture roger of miniula is
    component not8bits is
        port(
            notX : in std_logic_vector(7 downto 0);

            notS : out std_logic_vector(7 downto 0)
            );
    end component;

    component or8bits is
        port(
            orX : in std_logic_vector(7 downto 0);
            orY : in std_logic_vector(7 downto 0);
            orS : out std_logic_vector(7 downto 0)
            );
    end component;

    component and8bits is
        port(
            andX : in std_logic_vector(7 downto 0);
            andY : in std_logic_vector(7 downto 0);
            andS : out std_logic_vector(7 downto 0)
            );
    end component;
    
    component somador8bits is
        port(
            Asum   : in  std_logic_vector (7 downto 0);
            Bsum   : in  std_logic_vector (7 downto 0);
            Cin    : in  std_logic;
            Sumado : out std_logic_vector (7 downto 0);
            Cout   : out std_logic
            );
    end component;

    component lda8bits is
        port(
            lday: in std_logic_vector(7 downto 0);
            ldas: out   std_logic_vector(7 downto 0)
            );
    end component;

    component muxula is
       port(
            i000   : in std_logic_vector(7 downto 0);
            i001   : in std_logic_vector(7 downto 0);
            i010   : in std_logic_vector(7 downto 0);
            i011   : in std_logic_vector(7 downto 0);
            i100   : in std_logic_vector(7 downto 0);
            ula_op : in std_logic_vector(2 downto 0);
            muxs      : out std_logic_vector(7 downto 0)
            );
    end component;
    signal s_not,s_and,s_or,s_lda,s_add,s_resultado: std_logic_vector(7 downto 0);
    signal s_nz : std_logic_vector(1 downto 0);
    begin
    u_not: not8bits port map(x,s_not);
    u_and: and8bits port map(x,y,s_and);
    u_or : or8bits port map(x,y,s_or);
    u_add : somador8bits port map(x,y,'0',s_add);
    u_lda : lda8bits port map(y,s_lda);
    u_muxula: muxula port map(s_lda,s_add,s_or,s_and,s_not,ula_op,s_resultado);
    nz(0) <= not(s_resultado(7) or s_resultado(6) or s_resultado(5) or s_resultado(4) or s_resultado(3) or s_resultado(2) or s_resultado(1) or s_resultado(0)); 
    nz(1) <= S_resultado(7);
    s <= s_resultado;
end architecture;