import Aesop

abbrev Set := List Nat

def contains (s : Set) (n : Nat) : Prop :=
  match s with
  | [] => False
  | h :: t => n = h ∨ contains t n

def subset (s1 s2 : Set) : Prop :=
  ∀ (n : Nat), contains s1 n -> contains s2 n

theorem contains_app_iff {s1 s2 : Set} {n : Nat} :
    contains (s1 ++ s2) n ↔ contains s1 n ∨ contains s2 n := by
  induction s1 with
  | nil => simp [contains]
  | cons head tail tail_ih =>
      simp [contains]
      aesop

theorem subset_app : ∀ (s1 s1' s2 s2' : Set),
    subset s1 s1' -> subset s2 s2' ->
    subset (s1 ++ s2) (s1' ++ s2') := by
  simp [subset]
  intros _ _ _ _ _ _ _ h
  have h' := contains_app_iff.mp h
  apply contains_app_iff.mpr
  aesop
