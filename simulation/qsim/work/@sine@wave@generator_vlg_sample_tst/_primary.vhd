library verilog;
use verilog.vl_types.all;
entity SineWaveGenerator_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        set_clock       : in     vl_logic_vector(11 downto 0);
        sampler_tx      : out    vl_logic
    );
end SineWaveGenerator_vlg_sample_tst;
