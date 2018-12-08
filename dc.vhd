----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:37:00 11/28/2018 
-- Design Name: 
-- Module Name:    dc - Behavioral 
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

entity dc is
    Port ( clk,rst,dir: in  STD_LOGIC;
				rly: out STD_LOGIC;
           row : in  STD_LOGIC_VECTOR (0 downto 3);
           pwm : out  STD_LOGIC_VECTOR (0 downto 2)
			   );
			  
end dc;

architecture Behavioral of dc is

signal clk_div:std_logic_vector(15 downto 0);
signal count:std_logic_vector(0 to 7);
signal duty_cycle:integer range 0 to 255;
signal en:std_logic;

begin

process(clk)
begin
	if rising_edge(clk) then clk_div<=clk_div+1;
	end if;
end process;

en<=row(0) and row(1) and row(2) and row(3);
process(en)
begin
	if falling_edge(en) then
		case row is
		when"1110"=>duty_cycle<=255;
		when"1101"=>duty_cycle<=200;
		when"1011"=>duty_cycle<=150;
		when"0111"=>duty_cycle<=100;
		end case;
	end if;
end process;

process(clk_div(12))
begin
	if rst='1' then count<="00000000"; pwm<="01";
	elsif rising_edge(clk_div(12)) then
	count<=count+1;
		if(dir='0' and count<duty_cycle) then
			pwm<="11";
			rly<='0';
		elsif (dir='1' and count<duty_cycle) then
			rly<='1';
			pwm<="11";
		else
			pwm<="01";
		end if;
	end if;
end process;

end Behavioral;

