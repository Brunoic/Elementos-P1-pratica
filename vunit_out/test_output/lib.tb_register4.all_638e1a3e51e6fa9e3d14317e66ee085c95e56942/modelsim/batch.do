onerror {quit -code 1}
source "/home/borg/elementos/Elementos-P1-pratica/vunit_out/test_output/lib.tb_register4.all_638e1a3e51e6fa9e3d14317e66ee085c95e56942/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
