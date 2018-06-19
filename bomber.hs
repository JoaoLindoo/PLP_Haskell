main :: IO()
main = do
    putStrLn "\nBem Vindo ao ano começo do fim , a gasolina está acabando e o mundo também só você poderá salva-lo e deter o virus mortal"
    putStrLn "Baseado em uma historia real. Se voce nao lembra foi por que o mundo ja foi salvo e sua linha do tempo mudou\n"
    name <- getLine
    putStrLn("Hey " ++ name ++ " ,you rock!")

menu_grafico :: IO() 
menu_grafico = do
    putStrLn "No ano de 2046, um grupo de cientista conseguem terminar o maior feito da humanidade “um botão de reiniciar” uma máquina do tempo. Motivo para ser comemorado pois a única salvação da terra é voltar no tempo e destruir todas as bases que contém o vírus que acabou com quase toda a população do planeta. Irineu foi o soldado qualificado para essa missão , voltando para o ano de 2014, após 5 anos preso nas instalações secretas da CIA conseguiu convencer o diretor da CIA alertando de diversos desastres antes mesmo de ter acontecido. Só que a arma biológica irá ser usada no ano de 2019 no dia 5 de março e faltando apenas um dia para impedir esses ataques , vão bombardear pontos exatos para a destruição dessas instalações e assim salvando a humanidade. \n Você deve escolher uma posição dada pelas letras e pelos numeros de 0 a 11. Se acertar uma base é retornado o número da base, se não será retornado um X. O jogo acaba quando a base de todas as bases do inimigo forem destruidas "

desenhar_interface :: IO()
desenhar_interface = do
        putStrLn"####################################################"
        putStrLn"########      bombardment of the virus      ########"
        putStrLn"####################################################"
        putStrLn"     A   B   C   D   E   F   G   H   I   J   L   M"
        putStrLn"----------------------------------------------------"
		
