module Proper.Clause(
  Atom, negation, lit, nLit, literal,
  Clause, clause, concatClause) where

import Data.Set as S

import Proper.Utils

data Atom a =
  Lit a |
  NLit a
  deriving (Eq, Ord, Show)
  
negation :: Atom a -> Atom a
negation (Lit n) = NLit n
negation (NLit n) = Lit n

literal :: Atom a -> Atom a
literal (Lit n) = Lit n
literal (NLit n) = Lit n

lit name = Lit name
nLit name = NLit name

type Clause c = Set (Atom c)

concatClause :: (Ord c) => Clause c -> Clause c -> Clause c
concatClause c1 c2 = S.union c1 c2

clause :: (Ord a) => [Atom a] -> Clause a
clause atoms = S.fromList atoms