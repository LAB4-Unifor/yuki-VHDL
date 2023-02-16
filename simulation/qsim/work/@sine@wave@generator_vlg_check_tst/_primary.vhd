library verilog;
use verilog.vl_types.all;
entity SineWaveGenerator_vlg_check_tst is
    port(
        not_sin         : in     vl_logic;
        sin             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end SineWaveGenerator_vlg_check_tst;
