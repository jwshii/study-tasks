From Coq Require Import List.
Import ListNotations.
From Study Require Import Perm.

Lemma Permutation_concat: forall {A : Type} (P Q : list (list A)),
  Permutation P Q ->
  Permutation (concat P) (concat Q).
Proof.
Admitted.