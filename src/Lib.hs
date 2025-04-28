module Lib () where

import Text.Show.Functions ()

doble :: Int -> Int
doble x = x * 2

data Personajes = Unpersonaje {
     nombre :: String,
     poderBasico :: Personajes -> Personajes,
     superPoder :: String, 
     superPoderActivo :: Bool,
     cantidadDeVida :: Int
}
--personajes:
Espina :: Personajes
Espina = Unpersonaje{
     nombre = "Espina"
     poderBasico = bolaEspinosa,
    superPoderActivo = True,
    cantidadDeVida = 4800
}

Pamela :: Personajes
Pamela = Unpersonaje{
    nombre = "Pamela",
    poderBasico = lluviaDeTuercas,
    superPoderActivo = False,
    cantidadDeVida = 9600 
}

-- bolaEspinosa: le quita 1000 puntos de vida a quien sea su contrincante (¡no debe quedar un número negativo!)
restarVida :: Int -> Int -> Int
restarVida vidaPersonaje cantidadArestar = max 0 (vidaPersonaje - cantidadArestar)

bolaEspinosa :: Personajes -> Personajes
bolaEspinosa = restarVida 1000.cantidadDeVida

--lluviaDeTuercas: pueden ser sanadoras o dañinas. Las primeras le suman 800 puntos de vida a su colega y las segundas le disminuyen a la mitad la vida de quien sea su contrincante. En cualquier otro caso, no le pasa nada al personaje.

lluviaDeTuercas :: Personajes -> Personajes
lluviaDeTuercas cantidadDeVida "sanadoras" = (cantidadDeVida + 800)
lluviaDeTuercas cantidadDeVida "dañinas" = (cantidadDeVida - (cantidadDeVida/2))
lluviaDeTuercas cantidadDeVida  _ = "no existe tal super poder"
