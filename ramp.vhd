----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:48 11/28/2018 
-- Design Name: 
-- Module Name:    ramp - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ramp is
    Port ( clk,rst : in  STD_LOGIC;
           dac : out  STD_LOGIC_VECTOR (0 downto 7));
end ramp;

architecture Behavioral of ramp is

signal clk_div:std_logic_vector(3 downto 0);
signal count:std_logic_vector(0 to 7);

begin

process(clk)
begin
	if rising_edge(clk) then clk_div<=clk_div+1;
	end if;
end process;

process(clk_div(3))
begin
	if rst='1' then count<="00000000";
	elsif rising_edge(clk_div(3)) then
	count<=count+1;
	end if;
	dac<=count;
end process;

end Behavioral;

