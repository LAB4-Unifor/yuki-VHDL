library verilog;
use verilog.vl_types.all;
entity SineWave is
    port(
        ctt             : in     vl_logic_vector(7 downto 0);
        offsetValue     : in     vl_logic_vector(31 downto 0);
        wave            : out    vl_logic_vector(7 downto 0)
    );
end SineWave;
