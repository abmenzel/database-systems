-- d
-- Consider a tableR(A, B, C, D, E) with the following dependencies:
-- AB -> CDE
-- DE -> ABC
-- C -> AE

-- Normalisation attempt:
-- Table 1: (AB)DC
-- Table 2: (C)E

-- answers:
-- Normalizing results in two relations (true)
-- Relation can become BCNF without loss

-- correct:
-- Relation can become BCNF
-- ABC -> A is redundant


-- e
-- Consider a tableR(A, B, C, D, E) with the following dependencies:
-- AB -> CDE
-- C -> A
-- C -> D
-- D -> E

-- Normalisation attempt:
-- Table 1: (C)D (BCNF)
-- Table 2: (D)E (BCNF)
-- Table 3: (AB)C (3rd normal form)

