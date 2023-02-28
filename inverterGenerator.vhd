library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


	-- ESTA ENTIDADE RECEBERA UMA COMUNICAÇÃO SERIAL PARA SETAR OS VALORES ADEQUADOS
	-- ENTRADA SERIAL EM UM VETOR DE 16 BITS 
	-- 1 BIT -> STOP
	-- 1 BIT -> REVERSE_ENABLE   
	-- 14 BIT -> MOTOR_SPEED
	
	type sl_array_t is record
		std_logic;
	end record
--type sl_array_t is array(1 to 6) of std_logic;
--	type slv_array_t is array(1 to 6) of std_logic_vector;
entity inverterGenerator is
	
	port(
	clk, rst: in std_logic;
		reverseEnable_vector : in sl_array_t;
		set_clock : in slv_array_t(13 downto 0); -- sine wave frequency dividers
		pwm_output_U, pwm_output_V, pwm_output_W : out sl_array_t; -- pwm 
		not_pwm_output_U, not_pwm_output_V, not_pwm_output_W : out sl_array_t --inverted pwm
	);

end inverterGenerator;

architecture inverter of inverterGenerator is

	component driverSPWMGenerator is
		port (
			clk, rst, reverseEnable: in std_logic;
			set_clock: in std_logic_vector(13 downto 0); -- sine wave frequency divider
			pwm_output_U,pwm_output_V,pwm_output_W: out std_logic; -- pwm 
			not_pwm_output_U,not_pwm_output_V,not_pwm_output_W: out std_logic --inverted pwm
		);
	end component driverSPWMGenerator;
	
	
	begin
	
	--driver_generator : for i in 1 to 6 generate
	
		driver_1 : driverSPWMGenerator
			port map(clk, rst, 
			reverseEnable_1, 
			set_clock_1, 
			pwm_output_1_U, 
			pwm_output_1_V,
			pwm_output_1_W,
			not_pwm_output_1_U,
			not_pwm_output_1_V,
			not_pwm_output_1_W);

		driver_2 : driverSPWMGenerator
			port map(clk, rst, 
			reverseEnable_1, 
			set_clock_1, 
			pwm_output_1_U, 
			pwm_output_1_V,
			pwm_output_1_W,
			not_pwm_output_1_U,
			not_pwm_output_1_V,
			not_pwm_output_1_W);
			
		driver_3 : driverSPWMGenerator
			port map(clk, rst, 
			reverseEnable_1, 
			set_clock_1, 
			pwm_output_1_U, 
			pwm_output_1_V,
			pwm_output_1_W,
			not_pwm_output_1_U,
			not_pwm_output_1_V,
			not_pwm_output_1_W);

		driver_4 : driverSPWMGenerator
			port map(clk, rst, 
			reverseEnable_1, 
			set_clock_1, 
			pwm_output_1_U, 
			pwm_output_1_V,
			pwm_output_1_W,
			not_pwm_output_1_U,
			not_pwm_output_1_V,
			not_pwm_output_1_W);

		driver_5 : driverSPWMGenerator
			port map(clk, rst, 
			reverseEnable_1, 
			set_clock_1, 
			pwm_output_1_U, 
			pwm_output_1_V,
			pwm_output_1_W,
			not_pwm_output_1_U,
			not_pwm_output_1_V,
			not_pwm_output_1_W);
			
		driver_6 : driverSPWMGenerator
			port map(clk, rst, 
			reverseEnable_1, 
			set_clock_1, 
			pwm_output_1_U, 
			pwm_output_1_V,
			pwm_output_1_W,
			not_pwm_output_1_U,
			not_pwm_output_1_V,
			not_pwm_output_1_W);
		
end inverter;

