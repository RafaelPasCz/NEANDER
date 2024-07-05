-- mux 2x8

library ieee;
use ieee.std_logic_1164.all; -- std_logic para detectar erros
-- interface
entity mux2x8esp is
	port(
	c0 : in std_logic_vector(7 downto 0);
	c1 : in std_logic_vector(7 downto 0);
	sel: in std_logic;
	z  : out std_logic_vector(7 downto 0)
	);
end entity;
--arquitetura
architecture comuta of mux2x8esp is
	begin
	--atribuição condicional
	z <= c1 when sel = '1'  else (others => 'Z');
end architecture;
