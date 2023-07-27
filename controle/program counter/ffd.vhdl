-- library ieee;
-- use ieee.std_logic_1164.all;

-- entity ffd is
--     port(
--         d      : in std_logic;
--         clk  : in std_logic;
--         pr, cl : in std_logic;
--         q, nq  : out std_logic
--         );
-- end entity;

-- architecture ff of ffd is
--     signal s_k              : std_logic;   
--     signal s_snj , s_snk    : std_logic;
--     signal s_sns , s_snr    : std_logic;
--     signal s_sns2 , s_snr2  : std_logic;
--     signal s_eloS , s_eloR  : std_logic;
--     signal s_eloQ , s_elonQ : std_logic;
--     signal s_nClock         : std_logic;

-- begin
--     s_k <= not(d);

--     s_nClock <= not clk;
--     --s_snj
--     s_snj <= not(d and clk and s_elonQ);

--     --s_snk
--     s_snk <= not(s_k and clk and s_eloQ);

--     --s_sns
--     s_sns <= not(s_snj and pr and s_eloR);

--     --s_snr
--     s_snr <= not(s_snk and cl and s_eloS);

--     --s_sns2
--     s_sns2 <= s_sns nand s_nClock;

--     --s_snr2
--     s_snr2 <= s_snr nand s_nClock;

--     --s_eloS
--     s_eloS <= s_sns;

--     --s_eloR
--     s_eloR <= s_snr;

--     --s_eloQ
--     s_eloQ <= not(s_sns2 and s_elonQ and pr);

--     --s_elonQ
--     s_elonQ <= not(s_eloQ and s_snr2 and cl);

--     --Q ~Q
--     q <= s_eloQ;
--     nq <= s_elonQ;

-- end architecture;

library ieee;
use ieee.std_logic_1164.all; -- std_logic para detectar erros

entity ffd is
    port(
        d      : in std_logic;
        clk    : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic
    );
end entity;

architecture latch of ffd is
    component ffjk is
        port(
            j, k   : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        );
    end component;

    signal sq  : std_logic := '0'; -- opcional -> valor inicial
    signal snq : std_logic := '1';
    signal nj  : std_logic;
begin

    u_td : ffjk port map(d, nj, clk, pr, cl, q, nq);
    nj <= not(d);

end architecture;