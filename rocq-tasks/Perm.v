From Coq Require Import List.
Import ListNotations.

Inductive Permutation {A : Type} : list A -> list A -> Prop :=
  | perm_nil : Permutation [] []
  | perm_skip : forall (x : A) (l l' : list A), Permutation l l' -> Permutation (x :: l) (x :: l')
  | perm_swap : forall (x y : A) (l : list A), Permutation (y :: x :: l) (x :: y :: l)
  | perm_trans : forall l l' l'' : list A,
                 Permutation l l' -> Permutation l' l'' -> Permutation l l''.

Axiom Permutation_refl : forall (A : Type) (l : list A),
  Permutation l l.

Axiom Permutation_sym : forall (A : Type) (l l' : list A),
   Permutation l l' -> Permutation l' l.

Axiom Permutation_rev : forall (A : Type) (l : list A),
Permutation l (rev l).

Axiom Permutation_length : forall (A : Type) (l l' : list A),
Permutation l l' -> length l = length l'.

Axiom Permutation_app_tail : forall (A : Type) (l l' tl : list A),
 Permutation l l' -> Permutation (l ++ tl) (l' ++ tl).

Axiom Permutation_app_head : forall (A : Type) (l tl tl' : list A),
 Permutation tl tl' -> Permutation (l ++ tl) (l ++ tl').

Axiom Permutation_app : forall (A : Type) (l m l' m' : list A),
 Permutation l l' -> Permutation m m' -> Permutation (l ++ m) (l' ++ m').

Axiom Permutation_add_inside : forall (A : Type) (a : A) (l l' tl tl' : list A),
  Permutation l l' -> Permutation tl tl' ->
  Permutation (l ++ a :: tl) (l' ++ a :: tl').

Axiom Permutation_app_comm : forall (A : Type) (l l' : list A),
  Permutation (l ++ l') (l' ++ l).

Axiom Permutation_app_middle : forall (A : Type) (l l1 l2 l3 l4 : list A),
  Permutation (l1 ++ l2) (l3 ++ l4) ->
  Permutation (l1 ++ l ++ l2) (l3 ++ l ++ l4).

Axiom Permutation_middle : forall (A : Type) (l1 l2 : list A) (a : A),
  Permutation (a :: l1 ++ l2) (l1 ++ a :: l2).

Axiom Permutation_cons_app : forall (A : Type) (l l1 l2 : list A) (a : A),
  Permutation l (l1 ++ l2) -> Permutation (a :: l) (l1 ++ a :: l2).

Axiom Permutation_cons_middle : forall (A : Type) (l1 l2 l3 l4 : list A) (a : A),
  Permutation (l1 ++ l2) (l3 ++ l4) ->
  Permutation (l1 ++ a :: l2) (l3 ++ a :: l4).