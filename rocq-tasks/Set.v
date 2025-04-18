From Coq Require Import List.
Import ListNotations.

Definition set := list nat.

Fixpoint contains (s : set) (n : nat) : Prop :=
  match s with
  | nil => False
  | h :: t => n = h \/ contains t n
  end.

Definition subset (s1 s2 : set) : Prop :=
  forall (n : nat), contains s1 n -> contains s2 n.

Lemma contains_app_iff : forall (s1 s2 : set) (n : nat),
  contains (s1 ++ s2) n <-> contains s1 n \/ contains s2 n.
Proof.
  split; induction s1; simpl; intuition.
Qed.

Theorem subset_app : forall (s1 s1' s2 s2' : set),
  subset s1 s1' -> subset s2 s2' ->
  subset (s1 ++ s2) (s1' ++ s2').
Proof.
  unfold subset. intros.
  apply contains_app_iff.
  apply contains_app_iff in H1.
  intuition.
Qed.