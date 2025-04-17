universe u
variable {α : Type u}

inductive Perm : List α -> List α -> Prop
  | nil : Perm [] []
  | cons (x : α) (l1 l2 : List α) : Perm l1 l2 -> Perm (x :: l1) (x :: l2)
  | swap (x y : α) (l : List α) : Perm (y :: x :: l) (x :: y :: l)
  | trans {l₁ l₂ l₃ : List α} : Perm l₁ l₂ → Perm l₂ l₃ → Perm l₁ l₃

axiom Perm.refl {l : List α} : Perm l l

axiom Perm.symm {l₁ l₂ : List α} (h : Perm l₁ l₂) : Perm l₂ l₁

axiom Perm.reverse (l : List α) :
  Perm (List.reverse l) l

axiom Perm.length_eq {l₁ l₂ : List α} (p : Perm l₁ l₂) :
  (List.length l₁) = (List.length l₂)

axiom Perm.append_right {l₁ l₂ : List α} (t₁ : List α) (p : Perm l₁ l₂) :
 Perm (l₁ ++ t₁) (l₂ ++ t₁)

axiom Perm.append_left {t₁ t₂ : List α} (l : List α) :
  Perm t₁ t₂ → Perm (l ++ t₁) (l ++ t₂)

axiom Perm.append_cons (a : α) {l₁ l₂ r₁ r₂ : List α} (p₁ : Perm l₁ l₂) (p₂ : Perm r₁ r₂) :
  Perm (l₁ ++ a :: r₁) (l₂ ++ a :: r₂)

axiom Perm.append {l₁ l₂ t₁ t₂ : List α} (p₁ : Perm l₁ l₂) (p₂ : Perm t₁ t₂):
  Perm (l₁ ++ t₁) (l₂ ++ t₂)

axiom Perm.append_comm {l₁ l₂ : List α} :
  Perm (l₁ ++ l₂) (l₂ ++ l₁)

axiom Perm.append_middle {l₁ l₂ l₃ l₄ : List α} (l : List α) (p : Perm (l₁ ++ l₂) (l₃ ++ l₄)) :
  Perm (l₁ ++ l ++ l₂) (l₃ ++ l ++ l₄)

axiom Perm.middle {a : α} {l₁ l₂ : List α} :
  Perm (l₁ ++ a :: l₂) (a :: (l₁ ++ l₂))

axiom Perm.cons_append_cons {l l₁ l₂ : List α} (a : α) (p : Perm l (l₁ ++ l₂)) :
  Perm (a :: l) (l₁ ++ a :: l₂)

axiom Perm.cons_middle (a : α) {l1 l2 l1' l2' : List α} (p : Perm (l1 ++ l2) (l1' ++ l2')) :
  Perm (l1 ++ a :: l2) (l1' ++ a :: l2')
