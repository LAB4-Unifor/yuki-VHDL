library verilog;
use verilog.vl_types.all;
entity driverSPWMGenerator_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        set_clock       : in     vl_logic_vector(13 downto 0);
        sampler_tx      : out    vl_logic
    );
end driverSPWMGenerator_vlg_sample_tst;
