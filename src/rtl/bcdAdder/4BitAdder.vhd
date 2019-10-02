---------------------------------------------------------------------------------------------
--  SIMULADO PROVA PRÁTICA ELEMENTOS DE SISTEMAS
--
--  QUESTAO 2 - BCD ADDER
--
--  a) Implemente um adder de 4 bits (bitAdder4.vhd) que soma dois vetores de
--  4 bits cada (X e Y). Esse adder tem duas saídas: o valor da soma e o carry.
--
--  você deve utilizar os fulladders (fulladder.vhd), já fornecidos
--
---------------------------------------------------------------------------------------------



Library ieee;
use ieee.std_logic_1164.all;

entity bitAdder4 is

	port(
		x,y   : in STD_LOGIC_VECTOR(3 downto 0);
    carryin : in Std_logic;
		z     : out STD_LOGIC_VECTOR(3 downto 0);
    carryout : out STD_LOGIC
	);
end entity;

architecture rtl of bitAdder4 is

  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
      );
  end component;

  signal s: std_logic_vector(3 downto 0);

begin
	u0  : FullAdder port map ( x(0), y(0),  carryin, z(0), s(0));
	u1  : FullAdder port map ( x(1), y(1), s(0), z(1), s(1));
	u2  : FullAdder port map ( x(2), y(2), s(1), z(2), s(2));
	u3  : FullAdder port map ( x(3), y(3), s(2), z(3), s(3));

  carryout <= s(3);

end architecture;
