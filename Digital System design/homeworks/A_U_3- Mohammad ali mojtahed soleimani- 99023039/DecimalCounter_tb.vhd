library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DecimalCounter_tb is
end DecimalCounter_tb;

architecture Behavioral of DecimalCounter_tb is
    constant NUM_DIGITS : integer := 4; -- Number of digits for testing
    signal clk     : STD_LOGIC := '0';
    signal rst     : STD_LOGIC := '0';
    signal en      : STD_LOGIC := '0';
    signal count   : STD_LOGIC_VECTOR((NUM_DIGITS*4)-1 downto 0);

    component DecimalCounter
        generic (
            NUM_DIGITS : integer
        );
        Port (
            clk     : in  STD_LOGIC;
            rst     : in  STD_LOGIC;
            en      : in  STD_LOGIC;
            count   : out STD_LOGIC_VECTOR((NUM_DIGITS*4)-1 downto 0)
        );
    end component;

begin

    UUT: DecimalCounter
        generic map (
            NUM_DIGITS => 4 -- Specify 4 digits
        )
        port map (
            clk => clk,
            rst => rst,
            en => en,
            count => count
        );

    -- Clock generation
    clk_process: process
    begin
        while True loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Apply reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait for 20 ns;
        
        -- Enable counting
        en <= '1';
        wait for 500 ns;
        
        -- Disable counting
        en <= '0';
        wait for 20 ns;
        
        wait;
    end process;

end Behavioral;

