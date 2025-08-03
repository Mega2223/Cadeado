@echo off

ghdl -a Cadeado5.vhd
ghdl -a Cadeado5Testbench.vhd

ghdl -e Cadeado5Testbench

echo Interrompa o programa o mais cedo possivel

ghdl -r Cadeado5Testbench --vcd=resposta_5estados_placa.vcd
