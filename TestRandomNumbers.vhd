library ieee; 
use ieee.std_logic_1164.all; 
 
 
entity Testbench is  
end Testbench; 
 
 
architecture Structural of Testbench is 
component part2 
PORT (Clk, RST: IN STD_LOGIC;
	QT: BUFFER STD_LOGIC_VECTOR(17 DOWNTO 0);
      QA: BUFFER STD_LOGIC_VECTOR(21 DOWNTO 0);
      QV1: BUFFER STD_LOGIC_VECTOR(46 DOWNTO 0);
      ZT: OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      ZA: OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
      ZV1: OUT STD_LOGIC_VECTOR(46 DOWNTO 0)
      );
end component; 
signal Clk: STD_LOGIC := '0';
SIGNAL RST: STD_LOGIC; 
SIGNAL QT: STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL QA: STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL QV1: STD_LOGIC_VECTOR(46 DOWNTO 0);
SIGNAL ZT: STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL ZA: STD_LOGIC_VECTOR(21 DOWNTO 0);
SIGNAL ZV1: STD_LOGIC_VECTOR(46 DOWNTO 0);





CONSTANT CLK_PERIOD : time := 1 ns;
begin  
ins: part2 port map( 
	Clk => Clk, 
    RST => RST,
    QT  => QT,
    QA   => QA,
    QV1   => QV1,
    ZT   => ZT,
    ZA   => ZA,
    ZV1   => ZV1); 

Clock: process
begin

Clk <='0';
wait for CLK_PERIOD/2;

Clk <='1';
wait for CLK_PERIOD/2;

end process;

RESET: process
begin

RST <='1';
wait for 0.6 ns;

RST <='0';
wait;

end process;
 
end architecture;