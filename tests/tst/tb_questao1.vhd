library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_questao1 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_questao1 is

component questao1 is  port (
	x : in  STD_LOGIC_VECTOR(4 downto 0);
	f : out STD_LOGIC	);
end component;

signal x : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
signal f : std_logic := '0';
signal s : std_logic;

begin

  u1 : questao1 port map(x, f);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    x <= "00000";
    wait for 200 ps;
    assert(f = '1')  report "Falha em teste: 1" severity error;

    x <= "11000";
    wait for 200 ps;
    assert(f = '1')  report "Falha em teste: 1" severity error;

    x <= "01000";
    wait for 200 ps;
    assert(f = '0')  report "Falha em teste: 1" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
