library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_tff is
-- Testbench does not have any ports
end tb_tff;

architecture behavior of tb_tff is
    -- Component Declaration for the T Flip-Flop
    component carry_adder
        Port ( clk : in STD_LOGIC;
               async_reset : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    -- Signals for interfacing with the component
    signal tb_clk : STD_LOGIC := '0';
    signal tb_reset : STD_LOGIC := '0';
    signal tb_Q : STD_LOGIC;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the T Flip-Flop
    uut: carry_adder port map (
        clk => tb_clk,
        async_reset => tb_reset,
        Q => tb_Q
    );

    -- Clock process definitions
    clk_process : process
    begin
        while true loop
            tb_clk <= '0';
            wait for clk_period/2;
            tb_clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 1: Reset the flip-flop
        tb_reset <= '1';
        wait for 25 ns;
        tb_reset <= '0';
        wait for 25 ns;

        -- Test 2: Allow some clock pulses to toggle the flip-flop
        tb_reset <= '0';
        wait for 100 ns;

        -- Test 3: Assert reset while clock is running
        tb_reset <= '1';
        wait for 20 ns;
        tb_reset <= '0';
        wait for 100 ns;

        -- End of testing
        wait;
    end process;
end behavior;
