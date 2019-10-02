------------------------------
-- Elementos de Sistemas
-- Avaliacao Pratica 1
--
-- 10/2019
--
-- Questão 2 - Cronometro
------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cronometro is
  port (
    enable : in std_logic;
    clk : in std_logic;
    a1,b1,c1,d1,e1,f1,g1 : out STD_LOGIC;
    a2,b2,c2,d2,e2,f2,g2 : out STD_LOGIC
    );
end entity;

architecture  rtl OF cronometro IS

  component BCDAdder is
    port(
      x,y      : in STD_LOGIC_VECTOR(3 downto 0);
      carryin  : in std_logic;
      s        : out STD_LOGIC_VECTOR(3 downto 0);
      carryout : out STD_LOGIC
      );
  end component;

  component Register4 is
    port(
      clock:   in STD_LOGIC;
      input:   in STD_LOGIC_VECTOR(3 downto 0);
      load:    in STD_LOGIC;
      output: out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;

  component sevenSeg is
    port (
      H : in  STD_LOGIC_VECTOR(3 downto 0);
      a,b,c,d,e,f,g : out STD_LOGIC );
  end component;
  
  signal RegOut1 : STD_LOGIC_VECTOR (3 downto 0);
  signal RegOut2 : STD_LOGIC_VECTOR (3 downto 0);
  signal BCDs1 : STD_LOGIC_VECTOR (3 downto 0);
  signal BCDs2 : STD_LOGIC_VECTOR (3 downto 0);
  signal BCDout : STD_LOGIC;
  

begin

	u1 : BCDAdder port map (Regout1,"0000",'1',BCDs1,BCDout);
	u2 : BCDAdder port map (Regout2,"0000",BCDout,BCDs2,open);
	u3 : Register4 port map (clk,BCDs1,'1',Regout1);
	u4 : Register4 port map (clk,BCDs2,'1',Regout2);
	u5 : sevenSeg port map (Regout1,a1,b1,c1,d1,e1,f1,g1);
	u6 : sevenSeg port map (Regout2,a2,b2,c2,d2,e2,f2,g2);


end architecture;
