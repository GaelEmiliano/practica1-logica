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

-- dadas dos cadenas, regresa el prefijo común más largo
commonPrefix :: String -> String -> String
commonPrefix [] _ = []
commonPrefix _ [] = []
commonPrefix (x : xs) (y : ys)
  | x == y = x : commonPrefix xs ys
  | otherwise = []

-- common suffix
commonSuffix :: [String] -> String
commonSuffix [] = ""
commonSuffix cadenas = reverse (foldl1 commonPrefix (map reverse cadenas))

-- intersection 
interseccion :: (Eq a) => [a] -> [a] -> [a]
interseccion _ [] = []
interseccion xs (y : ys)
  | y `elem` xs = y : interseccion xs ys
  | otherwise = interseccion xs ys

-- ackerman
ackerman :: Integer -> Integer -> Integer
ackerman m n
  | m == 0 = n + 1
  | m > 0 && n == 0 = ackerman (m - 1) 1
  | m > 0 && n > 0 = ackerman (m - 1) (ackerman m (n - 1))

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
bTreeInsert elemento Empty = Node elemento Empty Empty
bTreeInsert elemento (Node raiz izquierda derecha)
  | elemento <= raiz = Node raiz (bTreeInsert elemento izquierda) derecha
  | otherwise = Node raiz izquierda (bTreeInsert elemento derecha)

-- bTreeSearch
bTreeSearch :: (Ord a) => a -> BTree a -> Bool
bTreeSearch elemento Empty = False
bTreeSearch elemento (Node raiz izquierda derecha)
  | elemento == raiz = True
  | elemento < raiz = bTreeSearch elemento izquierda
  | otherwise = bTreeSearch elemento derecha

-- bTreeMap
bTreeMap :: (a -> b) -> BTree a -> BTree b
bTreeMap _ Empty = Empty
bTreeMap lambda (Node raiz izquierda derecha) = Node (lambda raiz) (bTreeMap lambda izquierda) (bTreeMap lambda derecha)

-- bTreeHeight
bTreeHeight :: BTree a -> Int
bTreeHeight Empty = 0
bTreeHeight (Node _ izquierda derecha) = 1 + max (bTreeHeight izquierda) (bTreeHeight derecha)

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
