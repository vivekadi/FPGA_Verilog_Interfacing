----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:58:47 11/28/2018 
-- Design Name: 
-- Module Name:    stepper - Behavioral 
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

entity stepper is
    Port ( clk,rst,dir : in  STD_LOGIC;
           row : in  STD_LOGIC_VECTOR (0 downto 3);
           sout : out  STD_LOGIC_VECTOR (0 downto 3));
end stepper;

architecture Behavioral of stepper is

signal clk_div:std_logic_vector(22 downto 0);
signal reg:std_logic_vector(3 downto 0);
signal speed:std_logic;



begin

process(clk)
begin
	if rising_edge(clk) then clk_div<=clk_div+1;
	end if;
end process;

process(row, clk_div)
begin
	case row is
	when "0001"=>speed<=clk_div(21);
	when "0010"=>speed<=clk_div(19);
	when "0100"=>speed<=clk_div(17);
	when "1000"=>speed<=clk_div(15);
	when others=>speed<=clk_div(19);
	end case;
end process;

process(clk_div)
begin
	if rst='1' then reg<="1001";
	elsif rising_edge(speed) then
		if dir='1' then
		reg<= reg(0) & reg(3 downto 1);
		else
		reg<= reg(2 downto 0) & reg(3);
		end if;
	end if;
	sout<=reg;
end process;


end Behavioral;

