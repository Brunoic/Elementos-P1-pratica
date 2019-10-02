---------------------------------------------------------------------------------------------
--  SIMULADO PROVA PRÁTICA ELEMENTOS DE SISTEMAS
--
--  QUESTAO 2 - BCD ADDER
--
--  a) Implemente um adder de 4 bits (bitAdder4.vhd) que soma dois vetores de
--  4 bits cada (X e Y). Esse adder tem duas saídas: o valor da soma e o carry.
--
--  b) utilizando esse fulladder, implemente o somador ilustrado no diagrama a
--  seguir:
--
---------------------------------------------------------------------------------------------



Library ieee;
use ieee.std_logic_1164.all;

entity BCDAdder is
	port(
		x,y      : in STD_LOGIC_VECTOR(3 downto 0);
    carryin  : in std_logic;
		s        : out STD_LOGIC_VECTOR(3 downto 0);
    carryout : out STD_LOGIC
	);
end entity;

architecture rtl of BCDadder is

  component bitAdder4 is
    port(
      x   :  in STD_LOGIC_VECTOR(3 downto 0);
      y   :  in STD_LOGIC_VECTOR(3 downto 0);
      carryin : in STD_LOGIC;
      z   : out STD_LOGIC_VECTOR(3 downto 0);
      carryout : out STD_LOGIC
      );
  end component;

  component detectGt9 is
    port(
      x       : in STD_LOGIC_VECTOR(3 downto 0);
      carryin : in Std_logic;
      adjust  : out STD_LOGIC
      );
  end component;

  component mux4 is
    port(
      x,y     : in STD_LOGIC_VECTOR(3 downto 0);
      sel : in Std_logic;
      z       : out STD_LOGIC_VECTOR(3 downto 0)
      );
  end component;

  signal zadd1 : STD_LOGIC_VECTOR(3 downto 0);
  signal cadd1 : std_logic;
  signal zmux1 : STD_LOGIC_VECTOR(3 downto 0);
  signal adjust: std_logic;

begin

  u1 : bitAdder4 port map(x, y, carryin, zadd1, cadd1);
  u2 : detectGt9  port map(zadd1, cadd1, adjust);
  u3 : mux4       port map("0000", "0110", adjust, zmux1);
  u4 : bitAdder4 port map(zmux1, zadd1, '0', s, carryout);

end architecture;
