-- | Práctica 1: Introducción a Haskell
-- Profesor: Manuel Soto Romero
-- Ayudante: Diego Méndez Medina
-- Ayudante: José Alejandro Pérez Marquez
-- Laboratorio: Erick Daniel Arroyo Martínez
-- Laboratorio: Erik Rangel Limón

module Intro where

import Data.Char (toLower)
import Data.List
import GHC.Generics

-- Determina si un carácter es una vocal
esVocal :: Char -> Bool
esVocal caracter = toLower caracter `elem` "aeiou"

-- first vowelsq
firstVowels :: String -> String
firstVowels cadena = vocales ++ consonantes
  where
    vocales = [c | c <- cadena, esVocal c]
    consonantes = [c | c <- cadena, not (esVocal c)]

-- Normaliza una cadena de texto: convierte a minúsculas y elimina caracteres no alfabéticos
normaliza :: String -> String
normaliza = quicksort . map toLower . filter (`elem` ['a' .. 'z'])

-- is anagram
isAnagram :: String -> String -> Bool
isAnagram cadena1 cadena2 = normaliza cadena1 == normaliza cadena2

-- common suffix
commonSuffix :: [String] -> String
commonSuffix = undefined

-- intersection 
interseccion :: (Eq a) => [a] -> [a] -> [a]
interseccion = undefined

-- ackerman
ackerman :: Integer -> Integer -> Integer
ackerman = undefined

-- quicksort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = [] -- Caso base lista vacía
quicksort (x : xs) = quicksort menores ++ [x] ++ quicksort mayores
  where
    menores = filter (<= x) xs
    mayores = filter (> x) xs

-- Definición de un árbol binario de búsqueda (BST)
data BTree a = Empty
             | Node a (BTree a) (BTree a)
             deriving (Show, Eq)

-- bTreeInsert
bTreeInsert :: (Ord a) => a -> BTree a -> BTree a
bTreeInsert = undefined

-- bTreeSearch
bTreeSearch :: (Ord a) => a -> BTree a -> Bool
bTreeSearch = undefined

-- bTreeMap
bTreeMap :: (a -> b) -> BTree a -> BTree b
bTreeMap = undefined

-- bTreeHeight
bTreeHeight :: BTree a -> Int
bTreeHeight = undefined

-- Ejemplo de arbol
bTree1 = Node 6 
            (Node 4 
                (Node 2 
                    (Node 1 Empty Empty) 
                    (Node 3 Empty Empty)
                ) 
                (Node 5 Empty Empty)
            ) 
            (Node 8 
                (Node 7 Empty Empty) 
                (Node 9 
                    Empty 
                    (Node 10 Empty Empty)
                )
            )

-- | Número de pruebas
pruebas :: Int
pruebas = 1000
