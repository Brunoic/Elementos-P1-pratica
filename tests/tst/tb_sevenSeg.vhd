library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_sevenSeg is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_sevenSeg is

component sevenSeg is 
  port (
    H : in  STD_LOGIC_VECTOR(3 downto 0);
    a,b,c,d,e,f,g : out STD_LOGIC);
end component;

signal H : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal a,b,c,d,e,f,g : STD_LOGIC;
signal LEDS : STD_LOGIC_VECTOR(6 downto 0);

begin

  LEDS <= g & f & e & d & c & b & a;

  u1 : sevenSeg port map(h, a, b, c, d, e, f, g);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    h <= "0000";
    wait for 200 ps;
    assert( leds = "1000000")  report "Falha em teste: 1" severity error;

    h <= "0010";
    wait for 200 ps;
    assert( leds = "0100100")  report "Falha em teste: 1" severity error;

    h <= "0100";
    wait for 200 ps;
    assert( leds = "0011001")  report "Falha em teste: 1" severity error;

    h <= "1000";
    wait for 200 ps;
    assert( leds = "0000000")  report "Falha em teste: 1" severity error;


    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
