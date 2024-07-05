library iEEE;
use ieee.std_logic_1164.all;

entity regcarga is
        port(
        d : in std_logic;
        clk : in std_logic;
        pr, cl : in std_logic;
        nrw : in std_logic;
        s : out std_logic
        );
end entity;

architecture reg1bit of regcarga is
        component ffd is
        port(
        d : in std_logic;
        clk : in std_logic;
        pr, cl : in std_logic;
        q, nq : out std_logic
        );
        end component;
        signal datain, dataout : std_logic;
       begin

        -- envio de dataout para saída s
        s <= dataout; 
        --multiplexador
        datain <= d when nrw = '1' else dataout;
        -- instância do reg
        u_reg : ffd port map(datain,clk,pr,cl,dataout);
end architecture; 
