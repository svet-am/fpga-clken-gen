----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2024 11:28:03 AM
-- Design Name: 
-- Module Name: clock_scaler - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_scaler is
    Port ( clk : in STD_LOGIC;
           rst  : in STD_LOGIC;
           clken : out STD_LOGIC);
end clock_scaler;

architecture Behavioral of clock_scaler is
    constant CLKEN_SCALER    :   integer := 10;

begin

clken_gen : process(clk)
    variable offset_counter :   integer range 0 to CLKEN_SCALER := 0;
begin
    if rising_edge (clk) then
        if (rst = '1') then
            offset_counter := 0;
        end if;
        
        if (offset_counter = (CLKEN_SCALER-1)) then
            clken <= '1';
        else
            clken <= '0';
        end if;
        
    end if;
    
    if falling_edge (clk) then
        if (offset_counter = (CLKEN_SCALER-1)) then
            offset_counter := 0;

        else
            offset_counter := offset_counter + 1;
            
        end if;
    end if;
    
end process clken_gen;


end Behavioral;
