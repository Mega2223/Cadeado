library ieee;
use ieee.std_logic_1164.all;

entity Cadeado5 is
	port(
		SW: in std_logic_vector(0 downto 0); -- so entra 1 bit
		HEX0, --esse eh o mais a direita se eu nao me engano
		HEX1,
		HEX2: out std_logic_vector(6 downto 0)
		-- escrever 'FOI' quando desbloquear, so preciso de 3 displays pra isso
		-- para os demais vou colocar os estados como A, B, C .. etc.
		-- pois esse eh o nome interno dos estados
   );
end Cadeado5;

architecture behavior of Cadeado5 is
	type state_type is (A, B, C, D, E);
	signal state, next_state : state_type;
begin
	output_fun: process (SW, state)
	begin
		case state is
			when A =>
				HEX0 <= "0001000"; --a
				HEX1 <= "0000000";
				HEX2 <= "0000000";
			when B =>
				HEX0 <= "0000011"; --b
				HEX1 <= "0000000";
				HEX2 <= "0000000";
			when C =>
				HEX0 <= "1000110"; --c
				HEX1 <= "0000000";
				HEX2 <= "0000000";
			when D =>
				HEX0 <= "0100001"; --d
				HEX1 <= "0000000";
				HEX2 <= "0000000";
			when E =>
				HEX0 <= "0000000"; -- F
				HEX1 <= "0000000"; -- O
				HEX2 <= "0000000"; -- I
		end case;
	end process;
	state_fun: process(SW,state)
	begin
		case state is
			when A =>
				if SW = "1" then
					next_state <= B;
				else
					next_state <= A;
				end if;
				
			when B =>
				if SW = "1" then
					next_state <= C;
				else
					next_state <= A;
				end if;
			
			when C =>
				if SW = "1" then
					next_state <= C;
				else
					next_state <= D;
				end if;
			
			when D =>
				if SW = "1" then
					next_state <= E;
				else
					next_state <= A;
				end if;
			
			when E =>
				if SW = "1" then
					next_state <= B;
				else
					next_state <= A;
				end if;
			
		end case;
	end process;
end;
