module Util where 
import Data.Map (Map, (!))
import qualified Data.Map as Map
import System.Random
import Data.Char


baseCT :: Char
baseCT = '@'

baseIAPA :: Char
baseIAPA = '#'

baseBMT :: Char
baseBMT = 'o'

baseBPC :: Char
baseBPC = '*'


{-Caracter que representa Terreno-}
terreno :: Char
terreno = '_'

{-Tiro Perdido-}
wShot :: Char
wShot = 'X'


{- --------------------------------------------
   Funções de número aleatório
   ---------------------------------------------}


{-Gera um número aleatório até 10-}
myRandom :: IO Int
myRandom = randomRIO (fromInteger(1),fromInteger(10))

myRandom' :: Int -> IO Int
myRandom' max = randomRIO (fromInteger(0),max)

{-Gera um número aleatório par até 10-}
evenRandom :: IO Int
evenRandom = do
	x <- myRandom
	if (even x)
		then return x
		else evenRandom

{-Gera um número aleatório ímpar até 10-}
oddRandom :: IO Int
oddRandom = do
	x <- myRandom
	if (odd x)
		then return x
		else oddRandom
		
{-Nomes das bases-}
baseNome :: Int -> String
baseNome 0 = "CT (tamanho: 1)."
baseNome 1 = "IAPA (tamanho: 2)."
baseNome 2 = "BMT (tamanho: 3)."
baseNome 3 = "BPC (tamanho: 4)."

{-Tamanho da base, em relação ao id do baseNome-}
baseSize :: Int -> Int
baseSize = (+1)

{-Orientação da base no tabuleiro-}
vertical :: Char
vertical = 'v'

showPosicao :: Int -> String
showPosicao n | n == 0 = " "
				| n == 1 = show(baseCT)
				| n == 2 = show(baseIAPA)
				| n == 3 = show(baseBMT)
				| n == 4 = show(baseBPC)

