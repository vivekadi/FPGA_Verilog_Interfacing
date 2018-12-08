----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:32:36 11/28/2018 
-- Design Name: 
-- Module Name:    square - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity square is
    Port ( clk,rst : in  STD_LOGIC;
           dac : out  STD_LOGIC_VECTOR (0 downto 7));
end square;

architecture Behavioral of square is

signal clk_div: std_logic_vector(3 downto 0);
signal count: std_logic_vector(0 to 8);

begin

process(clk)
begin
	if rising_edge(clk) then clk_div<=clk_div+'1';
	end if;
end process;

process(clk_div(3))
begin
	if rst='1' then count<="000000000";
	elsif rising_edge(clk_div(3)) then
	count<=count+'1';
		if count(0)='1' then
		dac<="111111111";
		else
		dac<="000000000";
		end if;
	end if;
end process;

end Behavioral;

