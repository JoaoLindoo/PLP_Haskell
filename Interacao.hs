module Interacao where
import Util
import Data.Map (Map, (!))
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
showTabuleiro :: Map (Int,Int) Char -> (Int,Int) -> String
showTabuleiro m t@(i,j)
	{-Imprimindo as bordas esquerdas-}
	| j == 0    = if (i < 11)
					then 
						(show2Dig (i-1)) ++ " │ " ++ (showTabuleiro m (i,j+1))
						else
							""
	{-Imprimindo as bodas direitas-}
	| j == 11   = if (i > 10)
					then " │\n"
					else (" │\n" ++ showTabuleiro m (i+1,0))
	{-Imprimindo os tiros-}
	| otherwise = if (Map.notMember t m)
					{-Imprimindo água-}
					then (terreno: showTabuleiro m (i,j+1))
					else do
						if (m ! (i,j) == base)
						 {-Escondendo bases -}
						 then (terreno : showTabuleiro m (i,j+1))
						 else if (m ! (i,j) == wShot)
						 	{-Tiro perdido-}
						 	then (wShot : " " ++ showTabuleiro m (i,j+1))
						 	{-Tiro realizado na base-}
						 	else (sShot : " " ++ showTabuleiro m (i,j+1))

