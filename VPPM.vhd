


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 06:53:00 PM
-- Design Name: 
-- Module Name: VPPM - Behavioral
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

entity VPPM is
    Port ( inputo : in STD_LOGIC;
    clk : in std_logic;
    dimming: in std_logic_vector(9 downto 0);
    out_pulse :out std_logic
    --output: out std_logic_vector(9 downto 0)
    );
end VPPM;

architecture Behavioral of VPPM is

component mul
  Port ( 
in_pulse: in std_logic;
out_puls: out std_logic
);
end component;

signal input: std_logic;
signal output : std_logic_vector(9 downto 0);
signal clk1: std_logic;
signal flag : std_logic_vector(9 downto 0) := "0000000000" ;
signal temp : std_logic;
begin
input<= inputo after 50 ns;
process(input)
begin
    if (dimming="1111111111") then output<="1111111111";
    end if;
    
    if (dimming="0000000000") then output<="0000000000";
    end if;
    

    if dimming="1111111110" and input='1' then output<="1111111111";
    end if;
    if dimming="1111111110" and input='0' then output<="1111111110";
    end if;
    

    if dimming="1111111100" and input='1' then output<="1111111100";
        end if;
    if dimming="1111111100" and input='0' then output<="0011111111";
    end if;
    

    if dimming="1111111000" and input='1' then output<="1111111000";
           end if;
            if dimming="1111111000" and input='0' then output<="0001111111";
    end if;
    
    if dimming="1111110000" and input='1' then output<="1111110000";
    end if;
    if dimming="1111110000" and input='0' then output<="0000111111";
    end if;
    
    if dimming="1111100000" and input='1' then output<="1111100000";
           end if;
    if dimming="1111100000" and input='0' then output<="0000011111";
    end if;
    

    if dimming="1111000000" and input='1' then output<="1111000000";
                       end if;
    if dimming="1111000000" and input='0' then output<="0000001111";
    end if;
    


    if dimming="1110000000" and input='1' then output<="1110000000";
           end if;
    if dimming="1110000000" and input='0' then output<="0000000111";
    end if;
    

    if dimming="1100000000" and input='1' then output<="1100000000";
           end if;
    if dimming="1100000000" and input='0' then output<="0000000011";
    end if;
    

    if dimming="1000000000" and input='1' then output<="1000000000";
         end if;
    if dimming="1000000000" and input='0' then output<="0000000001";
         end if;                                                                                                    

end process;


x: mul port map(clk,clk1);

process(clk1,flag)
begin
if(clk1='1' and clk1'event) then
if (flag="0000000000") then
temp<=output(9);
flag<="0000000001";end if;
if (flag="0000000001") then
temp<=output(8);
flag<="0000000011";end if;
if (flag="0000000011") then
temp<=output(7);
flag<="0000000111";end if;
if (flag="0000000111") then
temp<=output(6);
flag<="0000001111";end if;
if (flag="0000001111") then
temp<=output(5);
flag<="0000011111";end if;
if (flag="0000011111") then
temp<=output(4);
flag<="0000111111";end if;
if (flag="0000111111") then
temp<=output(3);
flag<="0001111111";end if;
if (flag="0001111111") then
temp<=output(2);
flag<="0011111111";end if;
if (flag="0011111111") then
temp<=output(1);
flag<="0111111111";end if;
if (flag="0111111111") then
temp<=output(0);
flag<="0000000000";end if;

end if;
end process;

out_pulse <= temp;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2017 04:21:13 PM
-- Design Name: 
-- Module Name: 1-2 - Behavioral
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

entity mul is
  Port ( 
  in_pulse: in std_logic;
  out_puls: out std_logic
  );
end mul;

architecture Behavioral of mul is
--variable I : integer range 0 to 2000000000;
signal q1 : std_logic;
signal q2 : std_logic;
signal q3 : std_logic;
signal q4 : std_logic;
signal q5 : std_logic;
signal q6 : std_logic;
signal q7 : std_logic;
signal q8 : std_logic;
signal q9 : std_logic;
begin

process(in_pulse)
begin
q1<= in_pulse after  5 ns;
q2<= in_pulse after 10 ns;
q3<= in_pulse after 15 ns;
q4<= in_pulse after 20 ns;
q5<= in_pulse after 25 ns;
q6<= in_pulse after 30 ns;
q7<= in_pulse after 35 ns;
q8<= in_pulse after 40 ns;
q9<= in_pulse after 45 ns;

end process;
out_puls <= in_pulse xor q1 xor q2 xor q3 xor q4 xor q5 xor q6 xor q7 xor q8 xor q9 ; 
end Behavioral;










