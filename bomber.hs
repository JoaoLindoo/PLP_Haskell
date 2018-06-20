import Data.Map (Map, (!))
import qualified Data.Map as Map

{- --------------------------------------------
   Funções de interação com terminal
   ---------------------------------------------}

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
	showLines (take 21 (lines cont))


