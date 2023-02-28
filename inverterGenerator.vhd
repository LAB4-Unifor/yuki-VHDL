library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.types_package.ALL;


	-- ESTA ENTIDADE RECEBERA UMA COMUNICAÇÃO SERIAL PARA SETAR OS VALORES ADEQUADOS
	-- ENTRADA SERIAL EM UM VETOR DE 16 BITS 
	-- 1 BIT -> STOP
	-- 1 BIT -> REVERSE_ENABLE   
	-- 14 BIT -> MOTOR_SPEED
	
	
entity inverterGenerator is

	port(
		clk, rst: in std_logic;
		reverse_enable : in sl_array_t;
		set_clock : in slv_array_t; -- sine wave frequency dividers
		pwm_output_U, pwm_output_V, pwm_output_W : out sl_array_t; -- pwm 
		not_pwm_output_U, not_pwm_output_V, not_pwm_output_W : out sl_array_t --inverted pwm
	);


end inverterGenerator;

architecture inverter of inverterGenerator is

	component driverSPWMGenerator is
		port (
			clk, rst, reverse_enable: in std_logic;
			set_clock: in std_logic_vector(13 downto 0); -- sine wave frequency divider
			pwm_output_U,pwm_output_V,pwm_output_W: out std_logic; -- pwm 
			not_pwm_output_U,not_pwm_output_V,not_pwm_output_W: out std_logic --inverted pwm
		);
	end component driverSPWMGenerator;
	
	
	begin
	
	driver_generator : for i in 1 to 6 generate
	
		driver_n : driverSPWMGenerator
			port map(
				clk, rst, 
				reverse_enable(i), 
				set_clock(i), 
				pwm_output_U(i), 
				pwm_output_V(i),
				pwm_output_W(i),
				not_pwm_output_U(i),
				not_pwm_output_V(i),
				not_pwm_output_W(i)
			);
			
	end generate driver_generator;
end inverter;

