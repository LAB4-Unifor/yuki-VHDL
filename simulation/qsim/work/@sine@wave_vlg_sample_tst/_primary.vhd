library verilog;
use verilog.vl_types.all;
entity SineWave_vlg_sample_tst is
    port(
        ctt             : in     vl_logic_vector(7 downto 0);
        offsetValue     : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end SineWave_vlg_sample_tst;
