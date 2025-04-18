From Coq Require Import List.
Import ListNotations.
From Study Require Import Perm.

Theorem Permutation_concat: forall (A : Type) (P Q : list (list A)),
  Permutation P Q ->
  Permutation (concat P) (concat Q).
Proof.
  induction 1.
  - apply Permutation_refl.
  - simpl. apply Permutation_app_head. assumption.
  - simpl.
    repeat rewrite app_assoc.
    apply Permutation_app_tail. apply Permutation_app_comm.
  - eapply perm_trans; eauto.
Qed.