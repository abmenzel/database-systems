-- d
-- Consider a tableR(A, B, C, D, E) with the following dependencies:
-- A -> CDE
-- B -> E
-- B -> A
-- CD -> E

-- Normalisation attempt:
-- B -> A -> CD -> E
-- Table 1: (B)A
-- Table 2: (A)CD
-- Table 3: (CD)E
-- All are now in BCNF

-- A -> C is unavoidable FD (true) --- Actually false, we only have unavoidable FD's if it is a trivial dependency or if it is a super key
-- The relation can be normalized to BCNF (true, only one)

-- e
-- Consider a tableR(A, B, C, D, E) with the following dependencies
-- AB -> CDE
-- B -> E
-- C -> A
-- E -> D

-- Candidate keys:
-- AB?
-- CB? -> AE -> D

-- Normalisation attempt:
-- Table 1: (CB)AE
-- Table 2: (E)D
-- Both in BCNF -- False, because AB in table 1 is also a key

-- Table 1: (AB)C (3rd normal form)
-- Table 2: (B)E (BCNF)
-- Table 3: (E)D (BCNF)
