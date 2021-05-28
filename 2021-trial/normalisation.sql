-- d
-- Consider a table R(A, B, C, D, E) with the following dependencies:
-- AB -> CDE
-- A -> C
-- D -> B
-- A -> B
-- Relation is in 1st normal form, as A determines C (part of key determines something outside of the key)

-- Normalisation attempt:
-- New table: (A)BC
-- New table: (D)B
-- Old table: (AB)E

-- e
-- Consider a table R(A, B, C, D, E) with the following dependencies:
-- AB -> CD
-- A -> E
-- C -> A
-- ABC -> ADE

-- Normalisation attempt:
-- New table: (A)E in BCNF
-- Old table: (AB)CD in 3NF, as C determines A. This is unavoidable.