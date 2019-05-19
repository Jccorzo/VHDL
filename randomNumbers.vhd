
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY RNG IS
GENERIC(
         numerosAleatorios: integer:= 2000;

         CLK_PERIOD : time := 1 ns;         

         -- Semillas para cada variable
         SEED1: STD_LOGIC_VECTOR(17 DOWNTO 0):= "000000000000000001";
         SEED2: STD_LOGIC_VECTOR(21 DOWNTO 0):= "0000000000000000000010";
         SEED3: STD_LOGIC_VECTOR(46 DOWNTO 0):= "00000000000000000000000000000000000000000000001";
          -- Valor máximo permitido(vmp)
         vmpTime : STD_LOGIC_VECTOR(17 DOWNTO 0):= "101010001011111000" ;
         vmpAmount : STD_LOGIC_VECTOR(21 DOWNTO 0):= "1001110011001110011100" ;
         vmpV1 : STD_LOGIC_VECTOR(46 DOWNTO 0):= "10110101111001100010000011110100100000000000000";

          -- Valor minimo permitido(vlp)
         vlpV1 : STD_LOGIC_VECTOR(46 DOWNTO 0):= "00000000000000000000000000000000000000011001100";

          --Valor maximo fraude
         vmfTime : STD_LOGIC_VECTOR(17 DOWNTO 0):= "101001100101101100" ;
         vmfAmount : STD_LOGIC_VECTOR(21 DOWNTO 0):= "0000110011111001101011" ;
         vmfV1 : STD_LOGIC_VECTOR(46 DOWNTO 0):= "10110100110011110010011010101011011100100000000";

          --Valor minimo fraude
         vlfTime : STD_LOGIC_VECTOR(17 DOWNTO 0):= "000000000110010110" ;
         vlfAmount : STD_LOGIC_VECTOR(21 DOWNTO 0):= "0000000000000000000000" ;
         vlfV1 : STD_LOGIC_VECTOR(46 DOWNTO 0):= "00000000000000000000110110100101111101010010000"
       );

PORT (Clk, RST: INOUT STD_LOGIC;
	    QT: buffer STD_LOGIC_VECTOR(17 DOWNTO 0);
      QA: buffer STD_LOGIC_VECTOR(21 DOWNTO 0);
      QV1: buffer STD_LOGIC_VECTOR(46 DOWNTO 0);
      porcentajeDeFraudes: OUT REAL
      );
END RNG;

ARCHITECTURE Behavior OF RNG IS

-- Parametrización de vectores
type randomVectorTime is array (0 to numerosAleatorios) of std_logic_vector(17 downto 0);
type randomVectorAmount is array (0 to numerosAleatorios) of std_logic_vector(21 downto 0);
type randomVectorV1 is array (0 to numerosAleatorios) of std_logic_vector(46 downto 0);
-- Declaración de Vectores
SIGNAL vectorTime : randomVectorTime;
SIGNAL vectorAmount : randomVectorAmount;
SIGNAL vectorV1 : randomVectorV1;
-- Contadores que limitan la cantidad de números aleatorios generados por variables
SIGNAL Contador2: integer:= 0;
SIGNAL Contador3: integer:= 0;
SIGNAL Contador4: integer:= 0;
-- Contador para recorrer los vectores
SIGNAL Contador5: integer:= 0;
-- Contadores para identificar cuando uno de los números generados entra dentro del rango fraude
SIGNAL numeroDeFraudes: integer:= 0;
--SIGNAL porcentajeDeFraudes: real:= 0.0;

BEGIN
   
Clock: process
begin

Clk <='0';
wait for CLK_PERIOD/2;

Clk <='1';
wait for CLK_PERIOD/2;

        if Contador5 > numerosAleatorios then
        wait;
        
        end if;
        
end process;

   
   RESET: process
begin

RST <='1';
wait for 0.6 ns;

RST <='0';
wait;

end process;
   
   TIME: process
    begin
   		
        wait until Clk = '1';
        
        
      if Contador2 = numerosAleatorios   then
      wait;
      end if;
        
            	if RST = '1' then
                    QT <= SEED1;
                    else
                      QT(0) <= QT(17);
      QT(1) <= QT(0) XOR QT(2);
      QT(2) <= QT(1);
      QT(3) <= QT(2);
      QT(4) <= QT(3) XOR QT(2);
      QT(5) <= QT(4);
      QT(6) <= QT(5);
      QT(7) <= QT(6) XOR QT(2);
      QT(8) <= QT(7);
      QT(9) <= QT(8);
      QT(10) <= QT(9) XOR QT(2);
      QT(11) <= QT(10);
      QT(12) <= QT(11);
      QT(13) <= QT(12) XOR QT(2);
      QT(14) <= QT(13);
      QT(15) <= QT(14);
      QT(16) <= QT(15) XOR QT(2);
      QT(17) <= QT(16);
      
      --ZT <= QT;
      
      vectorTime(Contador2) <= QT;
      
      if QT > vmpTime then
      Contador2 <= Contador2;
      else
      Contador2 <= Contador2 + 1;
      end if;
      
                END IF;
            
    end process;
    
    
    
   AMOUNT: process
    begin
    
      	wait until Clk = '1';
        
      if Contador3 = numerosAleatorios then
      wait;
      end if;
           
            	if RST = '1' then
                    QA <= SEED2;
                    else
                      QA(0) <= QA(21);
      QA(1) <= QA(0) XOR QA(2);
      QA(2) <= QA(1);
      QA(3) <= QA(2);
      QA(4) <= QA(3) XOR QA(2);
      QA(5) <= QA(4);
      QA(6) <= QA(5);
      QA(7) <= QA(6) XOR QA(2);
      QA(8) <= QA(7);
      QA(9) <= QA(8);
      QA(10) <= QA(9) XOR QA(2);
      QA(11) <= QA(10);
      QA(12) <= QA(11);
      QA(13) <= QA(12) XOR QA(2);
      QA(14) <= QA(13);
      QA(15) <= QA(14);
      QA(16) <= QA(15) XOR QA(2);
      QA(17) <= QA(16);
      QA(18) <= QA(17);
      QA(19) <= QA(18);
      QA(20) <= QA(19);
      QA(21) <= QA(20);
      
      --ZA <= QA;
      vectorAmount(Contador3) <= QA;
      
      if QA > vmpAmount then
      Contador3 <= Contador3;
      else
      Contador3 <= Contador3 + 1;
      end if;
    
        END IF;
            
    end process;
    
    
    
       V1: process
    begin	
    
    wait until Clk = '1';
                   
      if Contador4 = numerosAleatorios then
      wait;
      end if;  
      
            	if RST = '1' then
                    QV1 <= SEED3;
                    else
      QV1(0) <= QV1(46);
      QV1(1) <= QV1(0) XOR QV1(2);
      QV1(2) <= QV1(1);
      QV1(3) <= QV1(2);
      QV1(4) <= QV1(3) XOR QV1(2);
      QV1(5) <= QV1(4);
      QV1(6) <= QV1(5);
      QV1(7) <= QV1(6) XOR QV1(2);
      QV1(8) <= QV1(7);
      QV1(9) <= QV1(8);
      QV1(10) <= QV1(9) XOR QV1(2);
      QV1(11) <= QV1(10);
      QV1(12) <= QV1(11);
      QV1(13) <= QV1(12) XOR QV1(2);
      QV1(14) <= QV1(13);
      QV1(15) <= QV1(14);
      QV1(16) <= QV1(15) XOR QV1(2);
      QV1(17) <= QV1(16);
      QV1(18) <= QV1(17);
      QV1(19) <= QV1(18);
      QV1(20) <= QV1(19);
      QV1(21) <= QV1(20);
       QV1(22) <= QV1(21);
      QV1(23) <= QV1(22) XOR QV1(2);
      QV1(24) <= QV1(23);
      QV1(25) <= QV1(24);
      QV1(26) <= QV1(25) XOR QV1(2);
      QV1(27) <= QV1(26);
      QV1(28) <= QV1(27);
      QV1(29) <= QV1(28) XOR QV1(2);
      QV1(30) <= QV1(29);
      QV1(31) <= QV1(30);
      QV1(32) <= QV1(31) XOR QV1(2);
      QV1(33) <= QV1(32);
      QV1(34) <= QV1(33);
      QV1(35) <= QV1(34) XOR QV1(2);
      QV1(36) <= QV1(35);
      QV1(37) <= QV1(36);
      QV1(38) <= QV1(37) XOR QV1(2);
      QV1(39) <= QV1(38);
      QV1(40) <= QV1(39);
      QV1(41) <= QV1(40);
      QV1(42) <= QV1(41);
      QV1(43) <= QV1(42);
      QV1(44) <= QV1(43);
      QV1(45) <= QV1(44);
      QV1(46) <= QV1(45);
      
      --ZV1 <= QV1;
      vectorV1(Contador4) <= QV1;
      
      if ((QV1 < vlpV1) OR (QV1 > vmpV1))  then
      Contador4 <= Contador4;
      else
      Contador4 <= Contador4 + 1;
      end if;
      
                END IF;
             
    end process;
    
    
    COMPARACION: process
    begin 
    
   		wait until Clk = '1' and Contador2 = numerosAleatorios and Contador3 = numerosAleatorios and Contador4 = numerosAleatorios;
    	
        if Contador5 = numerosAleatorios then
        porcentajeDeFraudes <= real(numeroDeFraudes*100)/real(numerosAleatorios);
        wait on porcentajeDeFraudes ;
        REPORT "EL NUMERO DE FRAUDES FUE DE: " & integer'image(numeroDeFraudes) &" DE UN TOTAL DE " & integer'image(numerosAleatorios) &" TRANSACCIONES SIMULADAS";
        REPORT "EL PORCENTAJE DE FRAUDES ENCONTRADOS ES DEL: " & real'image(porcentajeDeFraudes) &" %";
        wait;
        
        end if;
        
        if ((vectorTime(Contador5) > vlfTime AND vectorTime(Contador5) < vmfTime)AND(vectorAmount(Contador5) > vlfAmount AND vectoramount(Contador5) < vmfAmount)AND(vectorV1(Contador5) > vlfV1 AND vectorV1(Contador5) < vmfV1)) then
        numeroDeFraudes <= numeroDeFraudes + 1;
        else
        numeroDeFraudes <= numeroDeFraudes;
        end if;
                
        Contador5 <= Contador5 + 1;
        
    end process;

END Behavior;