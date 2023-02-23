library verilog;
use verilog.vl_types.all;
entity SineWave_vlg_check_tst is
    port(
        wave            : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end SineWave_vlg_check_tst;
