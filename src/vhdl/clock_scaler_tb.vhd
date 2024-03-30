----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2024 11:40:28 AM
-- Design Name: 
-- Module Name: clock_scaler_tb - Behavioral
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

entity clock_scaler_tb is
--  Port ( );
end clock_scaler_tb;

architecture Behavioral of clock_scaler_tb is
signal  clk_tb    : std_logic := '0';
signal  rst_tb      : std_logic := '0';
signal  clk_en_tb   : std_logic := '0';
constant clk_period : time := 1 ns;

component clock_scaler is
    Port ( clk : in STD_LOGIC;
           rst  : in STD_LOGIC;
           clken : out STD_LOGIC);    
end component;

begin

clk_tb <= not clk_tb after (clk_period/2);
rst_tb <= not rst_tb after (clk_period*25);

clock_scaler_dut : clock_scaler port map(clk => clk_tb,rst => rst_tb,clken  => clk_en_tb);

end Behavioral;
