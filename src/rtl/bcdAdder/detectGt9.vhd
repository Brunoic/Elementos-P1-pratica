---------------------------------------------------------------------------------------------
--  SIMULADO PROVA PRÁTICA ELEMENTOS DE SISTEMAS
--
--  QUESTAO 2 - BCD ADDER
--
--  a) Implemente um adder de 4 bits (detectGt9.vhd) que soma dois vetores de
--  4 bits cada (X e Y). Esse adder tem duas saídas: o valor da soma e o carry.
--
--  você deve utilizar os fulladders (fulladder.vhd), já fornecidos
--
---------------------------------------------------------------------------------------------


Library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all ;

entity detectGt9 is

	port(
		x       : in STD_LOGIC_VECTOR(3 downto 0);
    carryin : in Std_logic;
		adjust  : out STD_LOGIC
	);
end entity;

architecture rtl of detectGt9 is


begin

  adjust <= '1' when carryin = '1' else
            '1' when x > "1001" else
            '0';

end architecture;
