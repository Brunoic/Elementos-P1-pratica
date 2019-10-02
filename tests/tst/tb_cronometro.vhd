-- Elementos de Sistemas
-- developed by Luciano Soares
-- tb_cronometro.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_cronometro is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_cronometro is

	component cronometro is
		port(
    enable : in std_logic;
    clk : in std_logic;
    a1,b1,c1,d1,e1,f1,g1 : out STD_LOGIC;
    a2,b2,c2,d2,e2,f2,g2 : out STD_LOGIC
		);
	end component;


   signal enable : std_logic;
   signal inClock : std_logic := '0';
   signal a1,b1,c1,d1,e1,f1,g1 :  STD_LOGIC;
   signal a2,b2,c2,d2,e2,f2,g2 :  STD_LOGIC;

     signal LEDS1, LEDS2 : STD_LOGIC_VECTOR(6 downto 0);

begin


	mapping: cronometro port map(enable, inClock,
                               a1, b1, c1, d1, e1, f1, g1,
                               a2, b2, c2, d2, e2, f2, g2);

	inClock <= not inClock after 100 ps;


  LEDS1 <= g1 & f1 & e1 & d1 & c1 & b1 & a1;
  LEDS2 <= g2 & f2 & e2 & d2 & c2 & b2 & a2;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    wait for 4 ps;
		assert(LEDS1 = "1000000" and LEDS2 = "1000000")  report "Falha em teste: 0" severity error;

		-- Teste: 0
    wait until inClock'event and inClock='0';
		assert(LEDS1 = "1111001" and LEDS2 = "1000000")  report "Falha em teste: 0" severity error;

    wait until inClock'event and inClock='0';
    wait until inClock'event and inClock='0';
    wait until inClock'event and inClock='0';
    wait until inClock'event and inClock='0';
    wait until inClock'event and inClock='0';
    wait until inClock'event and inClock='0';
    wait until inClock'event and inClock='0';
    wait until inClock'event and inClock='0';
		assert(LEDS1 = "0011000" and LEDS2 = "1000000")  report "Falha em teste: 0" severity error;

    wait until inClock'event and inClock='0';
		assert(LEDS1 = "1000000" and LEDS2 = "1111001")  report "Falha em teste: 0" severity error;

	  test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
