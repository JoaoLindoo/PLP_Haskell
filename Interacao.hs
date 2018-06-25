module Interacao where

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
