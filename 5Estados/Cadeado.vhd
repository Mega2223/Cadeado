library ieee;
use ieee.std_logic_1164.all;

entity Cadeado is
   port(
		CLK,
		RESET,
		X: in std_logic;
		Z: out std_logic
   );
end Cadeado;

architecture process_1 of Cadeado is
	type state_type is (A, B, C, D, E);
	signal state, next_state : state_type;
begin
	output_fun: process (X, state)
	begin
		case state is
			when A =>
				Z <= '0';
			when B =>
				Z <= '0';
			when C =>
				Z <= '0';
			when D =>
				Z <= '0';
			when E =>
				Z <= '1';
		end case;
	end process;
	next_state_fun: process (X,state)
	begin
		case state is
			when A =>
				if X = '1' then
					next_state <= B;
				else
					next_state <= A;
				end if;
				
			when B =>
				if X = '1' then
					next_state <= C;
				else
					next_state <= A;
				end if;
			
			when C =>
				if X = '1' then
					next_state <= C;
				else
					next_state <= D;
				end if;
			
			when D =>
				if X = '1' then
					next_state <= E;
				else
					next_state <= A;
				end if;
			
			when E =>
				if X = '1' then
					next_state <= B;
				else
					next_state <= A;
				end if;
			
		end case;
	end process;
	state_reg_fun: process(CLK,RESET)
	begin
		if RESET = '1' then
			state <= A;
		elsif CLK'event and CLK = '1' then
			state <= next_state;
		end if;
		
	end process;
end;