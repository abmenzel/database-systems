-- d
-- Consider a tableR(A, B, C, D, E) with the following dependencies:
-- DE -> ABC
-- A -> DE
-- D -> B

-- Relation is in 1st normal form

-- Candidate keys:
-- (A) -> DE -> ABC

-- Normalisation attempt:
-- Table 1: (DE)AC (3rd normal form)
-- Table 2: (D)B (BCNF)

-- Normalizing to 3NF/BCNF results in exactly two relations (true)
-- AC -> B is unavoidable


-- e
-- Consider a tableR(A, B, C, D, E) with the following dependencies:
-- ABC -> DE
-- C -> C
-- C -> D
-- E -> AB

-- Normalisation attempt:
-- Table 1: (EC)ABD (BCNF)
-- Wrong because C -> D (1st normal form)  

-- Correct normalisation:
-- Table 1: (C)D (BCNF)
-- Table 2: (ABC)E (3rd normal form)
