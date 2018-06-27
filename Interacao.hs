module Interacao where
import Util
import Data.Array
{--import Data.Map (Map, (!))--}
import qualified Data.Map as Map

{-Comando para dar scape no terminal-}

cleanScreen :: IO()
cleanScreen = putStr "\ESC[2J"

{-Imprime as strings de uma lista de string-}

showLines :: [String] -> IO()
showLines [] = return ()
showLines s = do 
	putStrLn (head s)
	showLines (tail s)

{-Exibe mensagem inicial do jogo-}

tela_principal :: IO ()
tela_principal = do
	cont <- readFile ".msg"
	showLines (take 23 (lines cont))

{-Mensagem de derrota-}

showDerrota :: IO()
showDerrota = do
	cont <- readFile ".msg"
	showLines (take 24 (drop 22 (lines cont)))
	
{-Mensagem de Vitoria-}
showVitoria :: IO()
showVitoria = do
	cont <- readFile ".msg"
	showLines (take 40 (drop 38 (lines cont)))


{-Retorna a string com a visão do usuário do
  tabuleiro-}
showTabuleiro :: Array (Int,Int) Int -> Int -> Int -> String
showTabuleiro m i j |(j == 1)&&(i < 10) = show(i) ++ " |" ++ (showPosicao (m ! (i,j))) ++ showTabuleiro m i (j+1)
					|(j == 1)&&(i >= 10)&&(i <= 12) = show(i)++"|" ++ (showPosicao (m ! (i,j))) ++ showTabuleiro m i (j+1)
					|(j > 1)&&(j < 12)&&(i <= 12) = "|" ++ (showPosicao (m ! (i,j))) ++ showTabuleiro m i (j+1) 
					|(j == 12)&&(i < 12) = "|" ++ (showPosicao (m ! (i,j))) ++"|" ++ "\n" ++ showTabuleiro m (i+1) 1
					| (j== 12)&&(i == 12) = "|"++(showPosicao (m ! (i,j)))++"|"

{--Retorna a string com a visão final do tabuleiro--}
showTabuleiroFinal :: Array (Int,Int) Int -> Int -> Int -> String
showTabuleiroFinal m i j |(j == 1)&&(i < 10) = show(i) ++ " |" ++ (showPosicaoFinal (m ! (i,j))) ++ showTabuleiroFinal m i (j+1)
					|(j == 1)&&(i >= 10)&&(i <= 12) = show(i)++"|" ++ (showPosicaoFinal (m ! (i,j))) ++ showTabuleiroFinal m i (j+1)
					|(j > 1)&&(j < 12)&&(i <= 12) = "|" ++ (showPosicaoFinal (m ! (i,j))) ++ showTabuleiroFinal m i (j+1) 
					|(j == 12)&&(i < 12) = "|" ++ (showPosicaoFinal (m ! (i,j))) ++"|" ++ "\n" ++ showTabuleiroFinal m (i+1) 1
					| (j== 12)&&(i == 12) = "|"++(showPosicaoFinal (m ! (i,j)))++"|"