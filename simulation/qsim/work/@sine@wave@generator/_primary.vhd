library verilog;
use verilog.vl_types.all;
entity SineWaveGenerator is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        set_clock       : in     vl_logic_vector(11 downto 0);
        sin             : out    vl_logic;
        not_sin         : out    vl_logic
    );
end SineWaveGenerator;
