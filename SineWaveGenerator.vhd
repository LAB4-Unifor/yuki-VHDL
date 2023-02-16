 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SineWaveGenerator is
	port (
		clk, rst: in std_logic;
		set_clock: in std_logic_vector(7 downto 0);
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
<<<<<<< Updated upstream
			ctt : in std_logic_vector(7 downto 0);
			wave : out std_logic_vector(7 downto 0)
=======
			ctt : in std_logic_vector(7 downto 0); 
			offsetValue : in integer; -- input the offsetValue
			wave : out std_logic_vector(7 downto 0) 
>>>>>>> Stashed changes
		);
	end component SineWave;
	
	component comparador is
		port (
			input_minus, input_plus : in std_logic_vector(7 downto 0); 
			output_signal : out std_logic
		);
	end component comparador;
	
	-- Componente de regulagem do clock
	component divisor_de_clock is
		port(
<<<<<<< Updated upstream
			i_clk         : in  std_logic;
			i_rst         : in  std_logic;
			i_clk_divider : in  std_logic_vector(7 downto 0);
			o_clk         : out std_logic);
	
=======
			i_clk         : in  std_logic; -- clock input
			i_rst         : in  std_logic; -- reset pin (output to fiexed 0)
			i_clk_divider : in  std_logic_vector(11 downto 0); -- input value to divide base clock 
			o_clk         : out std_logic -- output clock
			);
>>>>>>> Stashed changes
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
	
	
<<<<<<< Updated upstream
	signal divisor_out,atraso_enable,sin_2 : std_logic;
	signal contador_1, contador_2,contador_3,moduladora_1,moduladora_2,triangular_out : std_logic_vector (7 downto 0);
=======
	signal divisor_to_portadora,divisor_to_mod,mod_atrasada : std_logic;
	
	signal contador_mod,contador_port,moduladora_out,not_moduladora,triangular_out : std_logic_vector (7 downto 0);
>>>>>>> Stashed changes
	
	begin
		
		--Divisor de Clock
		div_1 : divisor_de_clock 
			port map(clk,rst,set_clock,divisor_out);
		
		-- Atraso
		at : Atraso
			port map(clk,atraso_enable);
		
		-- contadores
		
<<<<<<< Updated upstream
		ct_1 : contador
			port map(divisor_out,rst,contador_1);
		
		ct_2 : contador
			port map(divisor_out,atraso_enable,contador_2);
=======
		ct_mod : contador
			port map(divisor_to_mod,rst,contador_mod);
>>>>>>> Stashed changes
			
		ct_3 : contador --contador da triangular
			port map(clk,rst,contador_3);
		
		--triangular
		tri : portadora
			port map(contador_3,triangular_out);
			
		--senoidal

<<<<<<< Updated upstream
		senoidal_1 : SineWave
			port map(contador_1,moduladora_1);
		
		senoidal_2 : SineWave
			port map(contador_2,moduladora_2);
=======
		pwm : SineWave
			port map(contador_mod,(-10), moduladora_out);
		
		not_pwm : SineWave
			port map(contador_mod,10, not_moduladora);
>>>>>>> Stashed changes
	
		
		-- comparadores
		comp_1 : comparador
			port map(moduladora_1,triangular_out,sin);
			
		comp_2 : comparador
<<<<<<< Updated upstream
			port map(moduladora_2,triangular_out,sin_2);
		
		--inversor
		nGate : NotGate
			port map (sin_2,not_sin);
=======
			port map(not_moduladora,triangular_out,not_sin);
		
		--inversor
		--nGate : NotGate
		--	port map (mod_atrasada,not_sin);
>>>>>>> Stashed changes


end threePWM;

