library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_muxula is
end entity;

architecture teste of tb_muxula is
    component muxula is
    port
    (
    i000   : inout std_logic_vector(7 downto 0);
    i001   : in std_logic_vector(7 downto 0);
    i010   : in std_logic_vector(7 downto 0);
    i011   : in std_logic_vector(7 downto 0);
    i100   : in std_logic_vector(7 downto 0);
    ula_op : in std_logic_vector(2 downto 0);
    s      : out std_logic_vector(7 downto 0)
    );
    end component;
    signal si000,si001,si010,si011,si100,ss : std_logic_vector(7 downto 0);
    signal sulaop : std_logic_vector(2 downto 0);
    begin
    u_muxula: muxula port map(si000,si001,si010,si011,si100,sulaop,ss);
    u_tb: process
    begin
    wait for 5 ns;
    sulaop <= "000";
    si000   <= "00000001";
    si001   <= "00000010";
    si010   <= "00000100";
    si011   <= "00001000";
    si100   <= "00010000";
    wait for 5 ns;
    sulaop <= "001";
    si000   <= "00000001";
    si001   <= "00000010";
    si010   <= "00000100";
    si011   <= "00001000";
    si100   <= "00010000";
    wait for 5 ns;
    sulaop <= "010";
    si000   <= "00000001";
    si001   <= "00000010";
    si010   <= "00000100";
    si011   <= "00001000";
    si100   <= "00010000";
    wait for 5 ns;
    sulaop <= "011";
    si000   <= "00000001";
    si001   <= "00000010";
    si010   <= "00000100";
    si011   <= "00001000";
    si100   <= "00010000";
    wait for 5 ns;
    sulaop <= "100";
    si000   <= "00000001";
    si001   <= "00000010";
    si010   <= "00000100";
    si011   <= "00001000";
    si100   <= "00010000";
    wait for 5 ns;
    end process;
end architecture;