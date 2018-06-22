import Data.Map (Map, (!))
import qualified Data.Map as Map
import Data.Array
import System.Random
-- Author joao.soares
{- --------------------------------------------
   Funções de interação com terminal
   ---------------------------------------------}
{- Representa um Jogador com o seu tabuleiro -}
data Jogador = Jogador {tabuleiro :: Array (Int,Int) Int, bombas :: Int} deriving(Show)


{-Metodo que cria a matriz base de inteiro com valor zero-}
criarMatrizZero :: Int -> Int -> Array (Int,Int) Int
criarMatrizZero x n = array ((1,1),(x,n)) [((i,j),0)|i<-[1..x],j<-[1..n]]

{-Metodo que cria a objeto jogador com tabuleiro 12X12-}
criarJogador :: Int -> Jogador
criarJogador nBombas = Jogador (criarMatrizZero 12 12) nBombas 

{-Variavel que representar o jogado com tabuleiro vazio (apenas zero) e com 45 bombas para se jogar-}
jogador_base = criarJogador 45

{-atualiza o valor no tabuleiro do jogador (atualizacao feita a partir de uma soma), informando o numero da linha e coluna-}
atualizarTabuleiro :: Jogador -> Int -> Int -> Int -> Jogador
atualizarTabuleiro jogador linha coluna valor = Jogador (accum (+) (tabuleiro jogador) [((linha,coluna), valor)]) (bombas jogador)

{-Gera um numero Random mas a saida é um Inteiro IO-}
numeroRan :: Int -> Int -> IO Int
numeroRan v1 v2 = do
	nR <- randomRIO(v1, v2::Int)
	return (nR)
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
            
