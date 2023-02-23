library verilog;
use verilog.vl_types.all;
entity driverSPWMGenerator_vlg_check_tst is
    port(
        not_pwm_output_1: in     vl_logic;
        not_pwm_output_2: in     vl_logic;
        not_pwm_output_3: in     vl_logic;
        pwm_output_1    : in     vl_logic;
        pwm_output_2    : in     vl_logic;
        pwm_output_3    : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end driverSPWMGenerator_vlg_check_tst;
