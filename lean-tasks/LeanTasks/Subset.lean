abbrev Set := List Nat

def contains (s : Set) (n : Nat) : Prop :=
  match s with
  | [] => False
  | h :: t => n = h ∨ contains t n

def subset (s1 s2 : Set) : Prop :=
  ∀ (n : Nat), contains s1 n -> contains s2 n

theorem subset_app : ∀ (s1 s1' s2 s2' : Set),
    subset s1 s1' -> subset s2 s2' ->
    subset (s1 ++ s2) (s1' ++ s2') :=
  sorry
