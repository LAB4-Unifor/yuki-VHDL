library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


	-- ESTA ENTIDADE RECEBERÁ UMA COMUNICAÇAO SERIAL PARA SETAR OS VALORES ADEQUADOS
	-- ENTRADA SERIAL EM UM VETOR DE 16 BITS 
	-- 1 BIT -> STOP
	-- 1 BIT -> REVERSE_ENABLE   
	-- 14 BIT -> MOTOR_SPEED

entity inversorGenerator is
	
	port (
	
		clk, rst, reverseEnable: in std_logic;
		set_clock: in std_logic_vector(13 downto 0); -- sine wave frequency divider
		pwm_output_1,pwm_output_2,pwm_output_3: out std_logic; -- pwm 
		not_pwm_output_1,not_pwm_output_2,not_pwm_output_3: out std_logic --inverted pwm
	
	);
end inversorGenerator;

architecture inversor of inversorGenerator is

	component driverSPWMGenerator is
		port (
			clk, rst, reverseEnable: in std_logic;
			set_clock: in std_logic_vector(13 downto 0); -- sine wave frequency divider
			pwm_output_1,pwm_output_2,pwm_output_3: out std_logic; -- pwm 
			not_pwm_output_1,not_pwm_output_2,not_pwm_output_3: out std_logic --inverted pwm
		);
	end component driverSPWMGenerator;
	
	
	
	
	begin
	
		driver_1 : driverSPWMGenerator
			port map();

		driver_2 : driverSPWMGenerator
			port map();
			
		driver_3 : driverSPWMGenerator
			port map();

		driver_4 : driverSPWMGenerator
			port map();

		driver_5 : driverSPWMGenerator
			port map();
			
		driver_6 : driverSPWMGenerator
			port map();
		
end inversor;

