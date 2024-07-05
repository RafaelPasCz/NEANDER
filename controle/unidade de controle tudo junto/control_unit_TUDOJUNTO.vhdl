library ieee;
use ieee.std_logic_1164.all;

entity controlunit is
    port(
        mux_op   : in std_logic_vector (10 downto 0);
        nz       : in std_logic_vector (1 downto 0);
        reset    : in std_logic;
        clk      : in std_logic;
        s        : out std_logic_vector (10 downto 0)
        );
end entity;

architecture controle of controlunit is

    component stauc is
        port(
            b        : in std_logic_vector(2 downto 0);
            saida_cu : out std_logic_vector (10 downto 0)
            );
    end component;

    component oruc is
        port(
           b        : in std_logic_vector(2 downto 0);
           saida_cu : out std_logic_vector (10 downto 0)
            );
    end component;

    component notuc is
        port(
            b        : in std_logic_vector(2 downto 0);
            saida_cu : out std_logic_vector(10 downto 0)
            );
    end component;

    component nopuc is
        port(
            b        : in std_logic_vector(2 downto 0);
            saida_cu : out std_logic_vector(10 downto 0)
            );
    end component;

    component ldauc is
        port(
        b        : in std_logic_vector(2 downto 0);
        saida_cu : out std_logic_vector(10 downto 0)
        );
    end component;

    component jzuc is 
    port(
        b        : in std_logic_vector(2 downto 0);
        z        : in std_logic;
        saida_cu : out std_logic_vector (10 downto 0)
        );
    end component;

    component jnuc is
        port(
            b        : in std_logic_vector(2 downto 0);
            n        : in std_logic;
            saida_cu : out std_logic_vector (10 downto 0)
            );
    end component;

    component jmpuc is
        port(
        b        : in std_logic_vector(2 downto 0);
        saida_cu : out std_logic_vector(10 downto 0)
        );
    end component;
    
    component anduc is
        port(
            b        : in std_logic_vector(2 downto 0);
            saida_cu : out std_logic_vector(10 downto 0)
            );
    end component;
    
    component adduc is
        port(
        b        : in std_logic_vector(2 downto 0);
        saida_cu : out std_logic_vector(10 downto 0)
        );
    end component;

    component contador3bit is
        port(
            clk : in std_logic;
            reset : in std_logic;
            s : out std_logic_vector(2 downto 0)
            );
        end component;

        component hltuc is
            port(
               b        : in std_logic_vector(2 downto 0);
               saida_cu : out std_logic_vector (10 downto 0)
                );
        end component;
        

    signal s_hlt, s_sta, s_or, s_not, s_nop, s_lda, s_jz, s_jn, s_jmp, s_and, s_add : std_logic_vector(10 downto 0);
    signal s_b : std_logic_vector (2 downto 0);
    --signal s_nz : std_logic_vector (1 downto 0);
    begin
        u_contador : contador3bit port map(clk,reset,s_b);
        u_sta : stauc port map(s_b,s_sta);
        u_or : oruc port map(s_b, s_or);
        u_not : notuc port map(s_b, s_not);
        u_nop : nopuc port map(s_b, s_nop);
        u_lda : ldauc port map(s_b, s_lda);
        u_jz : jzuc port map(s_b, nz(0), s_jz);
        u_jn : jnuc port map(s_b, nz(1), s_jn);
        u_jmp : jmpuc port map(s_b, s_jmp);
        u_and : anduc port map(s_b, s_and);
        u_add : adduc port map(s_b, s_add);
        u_hlt : hltuc port map (s_b, s_hlt);

        s <= s_nop when mux_op =     "10000000000"
        else s_sta when mux_op =     "01000000000"
        else s_lda when mux_op =     "00100000000"
        else s_add when mux_op =     "00010000000"
        else s_or when mux_op =      "00001000000"
        else s_and when mux_op =     "00000100000"
        else s_not when mux_op =     "00000010000"
        else s_jmp when mux_op =     "00000001000"
        else s_jn when mux_op =      "00000000100"
        else s_jz when mux_op =      "00000000010"
        else s_hlt when mux_op =     "00000000001"; 

        end architecture;

