 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SineWaveGenerator is
	port (
		clk, rst: in std_logic;
		set_clock: in std_logic_vector(11 downto 0);
		sin,not_sin: out std_logic
	);
end SineWavegenerator;

architecture threePWM of SineWaveGenerator is 
	
	component contador is
		port (
			clk, rst: in std_logic;
			q: out std_logic_vector(7 downto 0)
		);
	end component contador;
	
	component portadora is 
		port (
			ctt : in std_logic_vector(7 downto 0);
			wave : out std_logic_vector(7 downto 0)
		);
		
	end component portadora;
	
	component SineWave is 
		port (
			ctt : in std_logic_vector(7 downto 0);
			wave : out std_logic_vector(7 downto 0)
		);
	end component SineWave;
	
	component comparador is
		port (
			input_minus, input_plus : in std_logic_vector(7 downto 0);
			output_signal : out std_logic
		);
	end component comparador;
	
	component divisor_de_clock is
		port(
			i_clk         : in  std_logic;
			i_rst         : in  std_logic;
			i_clk_divider : in  std_logic_vector(11 downto 0);
			o_clk         : out std_logic
			);
	
	end component divisor_de_clock;
	
	component Atraso is
		port(
			clk : in std_logic;
			inverse_enable_out : out std_logic
		);
	end component Atraso;
	
	component NotGate is
		port(
			input: in std_logic;
			not_output : out std_logic 
		);
	end component NotGate;
	
	
	signal divisor_to_portadora,divisor_to_mod,atraso_enable,mod_atrasada : std_logic;
	
	signal contador_mod, contador_not_mod,contador_port,moduladora_out,not_moduladora,triangular_out : std_logic_vector (7 downto 0);
	
	begin
		
		--Divisor de Clock
		divisor_portadora : divisor_de_clock
			port map (clk,rst,"000000001101",divisor_to_portadora);
			
		divisor_moduladora : divisor_de_clock
			port map (clk,rst,"101000101101",divisor_to_mod);	
		
		-- Atraso
		at : Atraso
			port map(clk,atraso_enable);
		
		-- contadores
		
		ct_mod : contador
			port map(divisor_to_mod,rst,contador_mod);
		
		ct_not_mod : contador
			port map(divisor_to_mod,atraso_enable,contador_not_mod);
			
		ct_port : contador --contador da triangular
			port map(divisor_to_portadora,rst,contador_port);
		
		--triangular
		tri : portadora
			port map(contador_port,triangular_out);
			
		--senoidal

		pwm : SineWave
			port map(contador_mod,moduladora_out);
		
		not_pwm : SineWave
			port map(contador_not_mod,not_moduladora);
	
		
		-- comparadores
		comp_1 : comparador
			port map(moduladora_out,triangular_out,sin);
			
		comp_2 : comparador
			port map(not_moduladora,triangular_out,mod_atrasada);
		
		--inversor
		nGate : NotGate
			port map (mod_atrasada,not_sin);


end threePWM;

