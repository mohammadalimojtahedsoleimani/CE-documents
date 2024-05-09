library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TestBench_CLA is
end TestBench_CLA;

architecture behavior of TestBench_CLA is

    component Carry_Look_Ahead_Adder
        Port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Cin : in STD_LOGIC;
            Sum : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    -- Test inputs
    signal A, B: STD_LOGIC_VECTOR(3 downto 0);
    signal Cin: STD_LOGIC;
    signal Sum: STD_LOGIC_VECTOR(3 downto 0);
    signal Cout: STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Carry_Look_Ahead_Adder port map (
        A => A,
        B => B,
        Cin => Cin,
        Sum => Sum,
        Cout => Cout
    );

    -- Stimulus process to apply test vectors
    stimulus: process
    begin
        -- Apply a set of test vectors
        A <= "0000"; B <= "0000"; Cin <= '0'; wait for 10 ns;
        A <= "0001"; B <= "0011"; Cin <= '0'; wait for 10 ns;
        A <= "0101"; B <= "0101"; Cin <= '1'; wait for 10 ns;
        A <= "1111"; B <= "1111"; Cin <= '1'; wait for 10 ns;
        -- Complete the testing
        -- wait, then end the process
        wait;
    end process;

end behavior;
