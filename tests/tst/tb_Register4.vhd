-- Elementos de Sistemas
-- developed by Luciano Soares
-- tb_Register4.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_Register4 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_Register4 is

	component Register4 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(3 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(3 downto 0)
		);
	end component;

	signal inClock : std_logic := '0';
	signal inInput : STD_LOGIC_VECTOR(3 downto 0);
	signal inLoad : STD_LOGIC;
	signal outOutput : STD_LOGIC_VECTOR(3 downto 0);

begin

	mapping: Register4 port map(inClock, inInput, inLoad, outOutput);

	inClock <= not inClock after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

		-- Teste: 0
		inInput <= "0001"; inLoad <= '1';
    wait until inClock'event and inClock='0';
		assert(outOutput = "0001")  report "Falha em teste: 0" severity error;

		-- Teste: 1
		inInput <= "1110"; inLoad <= '0';
    wait until inClock'event and inClock='0';
		assert(outOutput = "0001")  report "Falha em teste: 1" severity error;

		-- Teste: 2
		inInput <= "1110"; inLoad <= '1';
    wait until inClock'event and inClock='0';
		assert(outOutput = "1110")  report "Falha em teste: 2" severity error;

		-- Teste: 3
		inInput <= "1111"; inLoad <= '0';
    wait until inClock'event and inClock='0';
		assert(outOutput = "1110")  report "Falha em teste: 2" severity error;


	  test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
