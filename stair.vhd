----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:49:34 11/28/2018 
-- Design Name: 
-- Module Name:    stair - Behavioral 
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

entity stair is
    Port ( clk,rst : in  STD_LOGIC;
           dac : out  STD_LOGIC_VECTOR (0 downto 7));
end stair;

architecture Behavioral of stair is

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
	count<=count+15;
	end if;
	dac<=count;
end process;


end Behavioral;

