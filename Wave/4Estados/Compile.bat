@echo off

ghdl -a Cadeado.vhd
ghdl -a CadeadoTestbench.vhd

ghdl -e CadeadoTestbench

echo Interrompa o programa o mais cedo possivel

ghdl -r CadeadoTestbench --vcd=resposta_4estados.vcd