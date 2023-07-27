library ieee;
use ieee.std_logic_1164.all;
 
entity somadorsimples is
    port(
        A : in std_logic;
        B : in std_logic;
        cin: in std_logic;
        S : out std_logic ;
        cout: out std_logic 
    );
    end somadorsimples;
    
architecture somar of somadorsimples is 
begin 
cout <= (A and B) or (A and cin) or (B and cin);
S <= (A xor B) xor cin;
end architecture;

