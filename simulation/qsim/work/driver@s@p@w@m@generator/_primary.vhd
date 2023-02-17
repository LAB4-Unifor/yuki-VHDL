library verilog;
use verilog.vl_types.all;
entity driverSPWMGenerator is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        set_clock       : in     vl_logic_vector(13 downto 0);
        pwm_output_1    : out    vl_logic;
        pwm_output_2    : out    vl_logic;
        pwm_output_3    : out    vl_logic;
        not_pwm_output_1: out    vl_logic;
        not_pwm_output_2: out    vl_logic;
        not_pwm_output_3: out    vl_logic
    );
end driverSPWMGenerator;
