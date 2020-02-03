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

    	led <= io_swt_a_out;

end behavior;
		

