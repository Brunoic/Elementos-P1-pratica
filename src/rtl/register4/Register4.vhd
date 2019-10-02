-- Elementos de Sistemas
-- by Luciano Soares
-- Register4.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register4 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(3 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(3 downto 0)
	);
end entity;

architecture arch of Register4 is

	component BinaryDigit is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC;
			load:    in STD_LOGIC;
			output: out STD_LOGIC
		);
	end component;

begin



end architecture;
