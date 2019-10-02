library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4 is
	port (
			x:   in  STD_LOGIC_VECTOR(3 downto 0);
			y:   in  STD_LOGIC_VECTOR(3 downto 0);
			sel: in  STD_LOGIC;
			z:   out STD_LOGIC_VECTOR(3 downto 0));
end entity;

architecture arch of Mux4 is
begin

  z <= x when sel = '0' else
       y;

end architecture;
