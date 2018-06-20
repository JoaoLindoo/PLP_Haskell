import Data.Map (Map, (!))
import qualified Data.Map as Map

-- Author joao.soares
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

{- Main -}    
main :: IO()
main = do
    tela_principal
    putStrLn "Bem Vindo ao ano começo do fim , a gasolina está acabando e o mundo também só você poderá salva-lo e deter o virus mortal"
    putStrLn "Baseado em uma historia real. Se voce nao lembra foi por que o mundo ja foi salvo e sua linha do tempo mudou"
    putStrLn "[1] Pronto para a simulação :"
    a <- getLine
    
    if(a == "1")
        then putStrLn "Inicia o jogo"
        else putStrLn "------------------\n FIM DO MUNDO !\n------------------"
            
