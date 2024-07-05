library ieee;
use ieee.std_logic_1164.all;

entity tbnotuc is
    end entity;
    
    architecture teste of tbnotuc is
        component notuc is
            port(
                b        : in std_logic_vector(2 downto 0);
                nbarrinc : out std_logic;
                nbarrpc  : out std_logic;
                ula_op   : out std_logic_vector(2 downto 0);
                pc_nrw   : out std_logic;
                ac_nrw   : out std_logic;
                mem_nrw  : out std_logic;
                rem_nrw  : out std_logic;
                rdm_nrw  : out std_logic;
                ri_nrw   : out std_logic
                );
        end component;
        signal s_b,s_ula_op : std_logic_vector(2 downto 0);
        signal s_nbarrinc, s_nbarrpc, s_pc_nrw, s_ac_nrw, s_mem_nrw, s_rem_nrw, s_rdm_nrw, s_ri_nrw : std_logic; 
        begin
        u_ldauc : notuc port map (s_b, s_nbarrinc, s_nbarrpc, s_ula_op, s_pc_nrw, s_ac_nrw, s_mem_nrw, s_rem_nrw, s_rdm_nrw, s_ri_nrw);
        u_tb    : process
            begin
                s_b <= "000";
                wait for 1 ns;
                s_b <= "001";
                wait for 1 ns;
                s_b <= "010";
                wait for 1 ns;
                s_b <= "011";
                wait for 1 ns;
                s_b <= "100";
                wait for 1 ns;
                s_b <= "101";
                wait for 1 ns;
                s_b <= "110";
                wait for 1 ns;
                s_b <= "111";
                wait for 1 ns;
            end process;
    end architecture;