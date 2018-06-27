{--import Data.Map (Map, (!))
import qualified Data.Map as Map--}
import Data.Array
import System.Random
import Util
import Interacao
{- --------------------------------------------
   Funções de interação com terminal
   ---------------------------------------------}
{- Representa um Jogador com o seu tabuleiro -}
data Jogador = Jogador {tabuleiro :: Array (Int,Int) Int, bombas :: Int, pontuacao :: Int} deriving(Show)


{-Metodo que cria a matriz base de inteiro com valor zero-}
criarMatrizZero :: Int -> Int -> Array (Int,Int) Int
criarMatrizZero x n = array ((1,1),(x,n)) [((i,j), 0)|i<-[1..x],j<-[1..n]]

{--verifica se existe base na vertical: receber a matriz m (12X12), a linha de alocacao i, o tamanho da base ext e a linha novamente para inserir --}
verificarVertical :: Array (Int,Int) Int -> Int -> Int -> Int -> Int -> Bool
verificarVertical m i j ext k | (j == 1)&&(i < (k+ext))&&(not((m ! (i,j)) == 0) || not((m ! (i,(j+1))) == 0)) = False
							  | (j > 1)&&(j < 12)&&(i < (k+ext))&&(not((m ! (i,j)) == 0) || not((m ! (i,(j+1))) == 0) || not((m ! (i,(j-1))) == 0)) = False
							  | (j == 12)&&(i < (k+ext))&&(not((m ! (i,j)) == 0) || not((m ! (i,(j-1))) == 0)) = False
							  | (i >= (k + ext)) = True 
							  | otherwise = True&&(verificarVertical m (i+1) j ext k)
{--verifica se existe base na horizontal: receber a matriz m (12X12), a linha de alocacao i, o tamanho da base ext e a coluna novamente para inserir --}
verificarHorizontal :: Array (Int,Int) Int -> Int -> Int -> Int -> Int -> Bool
verificarHorizontal m i j ext k | (i == 1)&&(j < (k + ext))&&(not((m ! (i,j)) == 0) || not((m ! (i+1,j)) == 0)) = False
								| (i > 1)&&(i < 12)&&(j < (k + ext))&&(not((m ! (i,j)) == 0) || not((m ! (i+1,j)) == 0) || not((m ! (i-1,j)) == 0)) = False
								| (i == 12)&&(i < (k + ext))&&(not((m ! (i,j)) == 0) || not((m ! (i-1,j)) == 0)) = False
								| (j >= (k + ext)) = True 
								| otherwise = True&&(verificarHorizontal m i (j+1) ext k)

{--Aloca CT com uma posicao--}
alocarCT :: Jogador -> IO Jogador
alocarCT j = do
	linha <- randomRIO (1,12::Int)
	coluna <- randomRIO (1,12::Int)
	putStrLn (show(linha))
	putStrLn (show(coluna))
	if not(verificarVertical (tabuleiro j) linha coluna 1 linha) then
		alocarCT j
	else
		return (Jogador (atualizarTabuleiro (tabuleiro j)  linha coluna 1) (bombas j) (pontuacao j))
		
{--Metodo responsavel por alocar todas as Bases--}
alocarBases :: Jogador -> IO Jogador
alocarBases j = do
	ct1 <- alocarCT j
	ct2 <- alocarCT ct1
	ct3 <- alocarCT ct2
	ct4 <- alocarCT ct3
	return ct4






{-Metodo que cria a objeto jogador com tabuleiro 12X12-}
criarJogador :: Int -> Int -> Jogador
criarJogador nBombas pont = Jogador (criarMatrizZero 12 12) nBombas pont
jogador1 = criarJogador 12 12

{-Variavel que representar o jogado com tabuleiro vazio (apenas zero) e com 45 bombas para se jogar-}
jogador_base = criarJogador 45

{-atualiza o valor no tabuleiro do jogador (atualizacao feita a partir de uma soma), informando o numero da linha e coluna-}
atualizarTabuleiro :: Array (Int,Int) Int -> Int -> Int -> Int -> Array (Int,Int) Int
atualizarTabuleiro m linha coluna valor = accum (+) m [((linha,coluna), valor)]

{-Gera um numero Random mas a saida é um Inteiro IO-}
numeroRan :: Int -> Int -> IO Int
numeroRan v1 v2 = do
	nR <- randomRIO(v1, v2::Int)
	return (nR)

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
        else showDerrota
            
