library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Define the test bench entity
entity Pattern_Finder_TB is
-- Testbench does not have any ports
end Pattern_Finder_TB;

architecture behavior of Pattern_Finder_TB is
    -- Component Declaration for the Pattern_Finder
    component Pattern_Finder
        Port ( 
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            input_pattern : in STD_LOGIC_VECTOR(2 downto 0);
            next_pattern : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Signals for interfacing with the component
    signal tb_clk : STD_LOGIC := '0';
    signal tb_reset : STD_LOGIC := '0';
    signal tb_input_pattern : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal tb_next_pattern : STD_LOGIC_VECTOR(2 downto 0);

begin
    -- Clock process
    clk_process: process
    begin
        while true loop
            tb_clk <= '0';
            wait for 10 ns;  -- Clock period is 20 ns
            tb_clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Instantiate the Unit Under Test (UUT)
    uut: Pattern_Finder port map (
        clk => tb_clk,
        reset => tb_reset,
        input_pattern => tb_input_pattern,
        next_pattern => tb_next_pattern
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the device
        tb_reset <= '1';
        wait for 25 ns; -- wait more than one clock cycle
        tb_reset <= '0';
        wait for 15 ns;

        -- Loop through pattern states
        tb_input_pattern <= "000";  -- Start at pattern "000"
        wait for 20 ns; -- wait for one cycle
        tb_input_pattern <= "011";
        wait for 20 ns;
        tb_input_pattern <= "110";
        wait for 20 ns;
        tb_input_pattern <= "101";
        wait for 20 ns;
        tb_input_pattern <= "111";
        wait for 20 ns;
        tb_input_pattern <= "000";  -- Wrap around
        wait for 20 ns;

        -- Finish the simulation
        wait;
    end process;
end behavior;
