library ieee;
use ieee.std_logic_1164.all;
entity cadeadotestbench is
end cadeadotestbench;

architecture testbench of cadeadotestbench is
	signal clock: std_logic_vector(1 downto 0);
	signal X: std_logic_vector(0 downto 0);
	signal HEX0, HEX1, HEX2:  std_logic_vector(6 downto 0);
	signal test_sequence : std_logic_vector(0 to 10)
	:= "01110101100";
	constant PERIOD : time := 100 ns;
	component Cadeado5 is
		port(
			KEY: in std_logic_vector(1 downto 0); 
			SW: in std_logic_vector(0 downto 0); 
			HEX0, HEX1, HEX2: out std_logic_vector(6 downto 0)
		);
	end component;
begin
	u1: Cadeado5 port map(clock, X, HEX0, HEX1, HEX2);
	-- This process applies reset and
	-- then applies the test sequence to input X
	apply_inputs: process
	variable temp: std_logic;
	begin
		-- reset <= '1';
		X <="0";
		-- ensure that inputs are applied
		-- away from the active clock edge
		wait for 5*PERIOD/4;
		-- reset <= '0';
		for i in 0 to 10 loop
			temp := test_sequence(i);
			if temp = '1' then
				X <= "1";
			else
				X <= "0";
			end if;
			wait for PERIOD;
		end loop;
		wait; --wait forever
	end process;
	-- This process provides the clock pulses
	generate_clock: process
	begin
		clock <= "11";
		wait for PERIOD/2;
		clock <= "00";
		wait for PERIOD/2;
	end process;
end testbench;