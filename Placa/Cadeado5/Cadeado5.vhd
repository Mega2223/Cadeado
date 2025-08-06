library ieee;
use ieee.std_logic_1164.all;

entity Cadeado5 is -- Implementacao modelo de Moore
	port(
		KEY: in std_logic_vector(1 downto 0); -- o nosso "clock", muda o estado do cadeado, o segundo botao eh o nosso RESET
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
				HEX1 <= "1111111";
				HEX2 <= "1111111";
			when B =>
				HEX0 <= "0000011"; --b
				HEX1 <= "1111111";
				HEX2 <= "1111111";
			when C =>
				HEX0 <= "1000110"; --c
				HEX1 <= "1111111";
				HEX2 <= "1111111";
			when D =>
				HEX0 <= "0100001"; --d
				HEX1 <= "1111111";
				HEX2 <= "1111111";
			when E =>
				HEX0 <= "1111001"; -- I
				HEX1 <= "1000000"; -- O 
				HEX2 <= "0001110"; -- F
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
	next_fun: process(KEY)
	variable temp: state_type;
	begin
		if KEY(1) = '0' then -- reset
			state <= A;
		elsif rising_edge(KEY(0)) then
			state <= next_state;
		end if;
	end process;
end;
