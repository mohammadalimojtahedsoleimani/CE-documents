library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Define the test bench entity
entity TestBench_CLA is
-- Testbench does not have any ports
end TestBench_CLA;

architecture behavior of TestBench_CLA is
    -- Component Declaration for the Carry Adder
    component carry_adder
        Port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            Cin   : in  STD_LOGIC;
            S     : out STD_LOGIC;
            G     : out STD_LOGIC
        );
    end component;

    -- Signals for interfacing with the component
    signal tb_A, tb_B, tb_Cin : STD_LOGIC := '0';
    signal tb_S, tb_G : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: carry_adder port map (
        A => tb_A,
        B => tb_B,
        Cin => tb_Cin,
        S => tb_S,
        G => tb_G
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test all input combinations
        tb_A <= '0'; tb_B <= '0'; tb_Cin <= '0';
        wait for 10 ns;
        tb_A <= '0'; tb_B <= '0'; tb_Cin <= '1';
        wait for 10 ns;
        tb_A <= '0'; tb_B <= '1'; tb_Cin <= '0';
        wait for 10 ns;
        tb_A <= '0'; tb_B <= '1'; tb_Cin <= '1';
        wait for 10 ns;
        tb_A <= '1'; tb_B <= '0'; tb_Cin <= '0';
        wait for 10 ns;
        tb_A <= '1'; tb_B <= '0'; tb_Cin <= '1';
        wait for 10 ns;
        tb_A <= '1'; tb_B <= '1'; tb_Cin <= '0';
        wait for 10 ns;
        tb_A <= '1'; tb_B <= '1'; tb_Cin <= '1';
        wait for 10 ns;

        -- Complete the simulation
        wait;
    end process;

end behavior;

