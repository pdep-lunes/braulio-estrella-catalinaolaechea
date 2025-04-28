module Lib () where

import Text.Show.Functions ()

doble :: Int -> Int
doble x = x * 2

type poder = (Personajes , Personajes)
data Personajes = Unpersonaje {
     nombre :: String,
     poderBasico :: Poder,
     superPoder :: String, 
     superPoderActivo :: Bool,
     cantidadDeVida :: Int
}
--personajes:
Espina :: Personajes
Espina = Unpersonaje{
    superPoder = "granada de espinas de 5 metros de radio",
    superPoderActivo = True,
    cantidadDeVida = 4800
}

Pamela :: Personajes
Espina = Unpersonaje{
    nombre = "Espina",
    poderBasico ="lluvia de tuercas sanadoras",
    superPoder = "torreta curativa (full soporte)",
    superPoderActivo = False,
    cantidadDeVida = 9600 
}

-- bolaEspinosa: le quita 1000 puntos de vida a quien sea su contrincante (¡no debe quedar un número negativo!)
restarVida :: Int -> Int -> Int
restarVida vidaPersonaje cantidadArestar = vidaPersonaje - cantidadArestar

bolaEspinosa :: Info_personajes -> Info_personajes
bolaEspinosa = restarVida 1000.cantidadDeVida

--lluviaDeTuercas: pueden ser sanadoras o dañinas. Las primeras le suman 800 puntos de vida a su colega y las segundas le disminuyen a la mitad la vida de quien sea su contrincante. En cualquier otro caso, no le pasa nada al personaje.
lluviaDeTuercas :: Int -> String -> Int
lluviaDeTuercas cantidadVidaPersonaje Tipo =
    | Tipo == "sanadoras" = (cantidadVidaPersonaje + 800)
    | Tipo == "dañinas" = (cantidadVidaPersonaje - (cantidadVidaPersonaje/2))

lluviaDeTuercas2 :: Int -> String -> Int
lluviaDeTuercas2 cantidadVidaPersonaje "sanadoras" = (cantidadVidaPersonaje + 800)
lluviaDeTuercas2 cantidadVidaPersonaje "dañinas" = (cantidadVidaPersonaje - (cantidadVidaPersonaje/2))
lluviaDeTuercas2 cantidadVidaPersonaje _ = "no existe tal super poder"
