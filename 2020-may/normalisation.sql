-- d
-- Consider a tableR(A, B, C, D, E) with the following dependencies:
-- A -> BCDE
-- ABC -> E
-- E -> B
-- CD -> E

-- normalisation attempt
-- Table 1: (A)CD
-- Table 2: (CD)E
-- Table 3: (E)B
-- Now all are in BCNF

-- A is the only candidate key (true)
-- ABC -> E is a trivial functional dependency (true) --- Actually false, because E is not part of the left side.
-- Relation can be normalized to BCNF without losses (true) see above


-- e
-- Consider a table R(A, B, C, D, E) with the following dependencies:
-- A -> BCDE
-- B -> A
-- C -> A
-- D -> A

-- Normalisation attempt:
-- (B)A
-- (C)A
-- (D)A
-- (A)E

-- (A)BCDE <-- Correct relation is already in BCNF