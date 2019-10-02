onerror {quit -code 1}
source "/home/borg/elementos/Elementos-P1-pratica/vunit_out/test_output/lib.tb_questao1.all_2f69fefbdcbb540262da4531d0e8df5d9311ff6d/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
