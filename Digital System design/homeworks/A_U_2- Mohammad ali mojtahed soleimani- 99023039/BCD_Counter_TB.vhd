library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCD_Counter_TB is
-- Testbench has no ports
end BCD_Counter_TB;

architecture behavior of BCD_Counter_TB is
    -- Component Declaration
    component BCD_Counter
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            Dir : in STD_LOGIC;
            count : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    -- Test Signals
    signal tb_clk : STD_LOGIC := '0';
    signal tb_reset : STD_LOGIC := '0';
    signal tb_Dir : STD_LOGIC := '0';
    signal tb_count : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Clock process
    clk_process : process
    begin
        tb_clk <= '0';
        wait for 10 ns;  -- Clock period of 20 ns
        tb_clk <= '1';
        wait for 10 ns;
    end process;


    -- Instantiate the Unit Under Test (UUT)
    uut: BCD_Counter port map (
        clk => tb_clk,
        reset => tb_reset,
        Dir => tb_Dir,
        count => tb_count);

    -- Test Stimulus Process
    stim_proc: process
    begin
        -- Initialize Inputs
        tb_reset <= '1';  -- Assert reset initially
        wait for 40 ns;
        tb_reset <= '0';  -- De-assert reset
        wait for 20 ns;

        -- Test Count Up
        tb_Dir <= '1';  -- Set direction to up
        wait for 220 ns;  -- Allow enough time to observe the count

        -- Test Count Down
        tb_Dir <= '0';  -- Change direction to down
        wait for 220 ns;  -- Allow enough time to observe the count

        -- Finish simulation
        wait;
    end process;

end behavior;
