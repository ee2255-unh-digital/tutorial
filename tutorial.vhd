--------------------------------------------
-- Module Name: tutorial
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tutorial is
port (
		io_swt_a : inout std_logic_vector(7 downto 0);
		clk_in : in std_logic;
		led : out std_logic_vector(7 downto 0)
	);
end tutorial;

architecture behavior of tutorial is

	signal led_int : std_logic_vector(7 downto 0) := "00000000";
	signal io_swt_a_out : std_logic_vector(7 downto 0);

	component pulldown
		port (
        	in_swt : inout std_logic_vector(7 downto 0);
        	clk : in std_logic;
			swt_state : out std_logic_vector(7 downto 0)
		);
	end component;

	begin

		swta_pd: pulldown port map(io_swt_a, clk_in, io_swt_a_out);

    	led <= led_int;
        
		led_int(0) <= io_swt_a_out(0);
		led_int(1) <= '0';
		--led_int(1) <= io_swt_a(1) and not(io_swt_a(2));
		--led_int(2) <= io_swt_a(2) and io_swt_a(3);
		--led_int(3) <= led_int(1) or led_int(3);
		--led_int(7 downto 4) <= io_swt_a(7 downto 4);

end behavior;
		

