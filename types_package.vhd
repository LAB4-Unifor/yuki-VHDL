library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



package types_package is
	type sl_array_t is array(1 to 6) of std_logic;
	type slv_array_t is array(1 to 6) of std_logic_vector(13 downto 0);
end package types_package;