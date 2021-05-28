-- d
-- Consider a tableR(A, B, C, D, E) with the following dependencies:
-- A -> BC
-- B -> D
-- C -> E

-- Normalisation attempt:
-- Table 1: (A)BC
-- Table 2: (B)D
-- Table 3: (C)E

-- Some super keys:
-- ABCDE
-- ABC
-- A -> BC -> ABCDE 

-- A is the only candidate key of R (true)
-- AC -> B is a trivial FD (false)
-- Normalizing results in exactly two relations (false)
-- he relation can be normalized to BCNF without losing functional dependencies(excluding trivial, unavoidable, and derivable dependencies) (true)


-- e
-- Consider a tableR(A, B, C, D, E) with the following dependencies:
-- DE -> ABC
-- A -> C
-- B -> D
-- Relation is in second normal form as A -> C is a transitive relation

-- Normalisation attempt:
-- Table 1: (DE)AB
-- Table 2: (A)C
-- This relation is in 3rd normal form, as we have that B -> D, which is unavoidable.