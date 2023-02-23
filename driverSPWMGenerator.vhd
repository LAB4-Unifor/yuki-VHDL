library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity driverSPWMGenerator is

	-- "clk" clock input
	-- "rst" stop command
	-- "set_clock" frequency divider setup
	-- "pwm_output_#" direct pwm output
	-- "not_pwm_output_#" inverse pwm output with delay
	port (
		clk, rst, reverseEnable: in std_logic;
		set_clock: in std_logic_vector(13 downto 0); -- sine wave frequency divider
		pwm_output_1,pwm_output_2,pwm_output_3: out std_logic; -- pwm 
		not_pwm_output_1,not_pwm_output_2,not_pwm_output_3: out std_logic --inverted pwm
	);
end driverSPWMGenerator;


architecture driverGen of driverSPWMGenerator is
	
	-- pwm sine generator
	component SineWaveGenerator is
		port (
			clk, rst: in std_logic;
			set_clock: in std_logic_vector(13 downto 0);
			delayValue: in integer;
			sin,not_sin: out std_logic
		);
	end component SineWavegenerator;
	
	
	signal delayValue_1,delayValue_2,delayValue_3 : integer;
	
	begin
		
		-- delay for phase 8 bit (120° = 86) integer 
		delayValue_1 <= (0);
		delayValue_2 <= (85) when reverseEnable = '0' else (171); -- conditional statement for switching phase generation order
		delayValue_3 <= (170) when reverseEnable = '0' else (86); -- conditional statement for switching phase generation order
	
		--phase generator 1
		phase_1 : SineWaveGenerator
		port map (clk,rst,set_clock,delayValue_1,pwm_output_1,not_pwm_output_1);
		
		--phase generator 2
		phase_2 : SineWaveGenerator
		port map (clk,rst,set_clock,delayValue_2,pwm_output_2,not_pwm_output_2);
		
		--phase generator 3
		phase_3 : SineWaveGenerator
		port map (clk,rst,set_clock,delayValue_3,pwm_output_3,not_pwm_output_3);
		
end driverGen;

