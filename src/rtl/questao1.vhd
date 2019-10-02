------------------------------
-- Elementos de Sistemas
-- Avaliacao Pratica 1
--
-- 10/2019
--
-- Questão 1
------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Questao1 is
  port (
	x : in  STD_LOGIC_VECTOR(4 downto 0);
	f : out STD_LOGIC	);
end entity;


architecture  rtl OF Questao1 IS


component And1 is
	port ( 
			x:   in  STD_LOGIC;
			y:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end component;

component Not1 is
	port ( 
			x:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end component;

component Or3Way is
	port (
			x:   in  STD_LOGIC;
			y:   in  STD_LOGIC;
			z:   in  STD_LOGIC;
			q:   out  STD_LOGIC);
end component;

component Or2Way is
	port (
			x:   in  STD_LOGIC;
			y:   in  STD_LOGIC;
			q:   out  STD_LOGIC);

end component;


signal qor3 : STD_LOGIC;
signal qor2 : STD_LOGIC;
signal qnot : STD_LOGIC_VECTOR(3 downto 0);
signal qand : STD_LOGIC_VECTOR(3 downto 0);

begin	

	u1 : Or3Way port map (x(0),x(1),x(4),qor3);
	u2 : Not1 port map (x(2),qnot(0));
	u3 : Not1 port map (x(3),qnot(1));
	u4 : And1 port map (x(2),qnot(1),qand(0));
	u5 : And1 port map (x(3),qnot(0),qand(1));
	u6 : Or2Way port map (qand(0),qand(1),qor2);
	u7 : And1 port map (qor3,qor2,qand(2));
	u8 : Not1 port map (qor3,qnot(2));
	u9 : Not1 port map (qor2,qnot(3));
	u10: And1 port map (qnot(2),qnot(3),qand(3));
	u11: Or2Way port map (qand(2),qand(3),f);
	

end architecture;
