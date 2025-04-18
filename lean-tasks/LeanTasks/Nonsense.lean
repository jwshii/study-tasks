inductive Blob where
  | bob : Blob
  | glob : Blob -> Blob

open Blob

inductive Fluff where
  | enuff : Fluff
  | huff  : Fluff -> Fluff -> Fluff
  | puff  : Blob -> Fluff

open Fluff

def morph_blob (b : Blob) : Blob :=
  match b with
  | bob => bob
  | glob b => morph_blob b

def morph_fluff (f : Fluff) : Fluff :=
  match f with
  | enuff => enuff
  | huff f1 f2 => huff (morph_fluff f1) (morph_fluff f2)
  | puff b => puff (morph_blob b)

theorem morph_blob_idem : ∀ (b : Blob),
    morph_blob (morph_blob b) = morph_blob b := by
  intros b
  induction b with
  | bob =>
      simp [morph_blob]
  | glob b' ih =>
      simp [morph_blob]
      assumption

theorem morph_fluff_idem : ∀ (f : Fluff),
    morph_fluff (morph_fluff f) = morph_fluff f := by
  intros f
  induction f with
  | enuff => simp [morph_fluff]
  | huff f1 f2 ih1 ih2 =>
      simp [morph_fluff]
      rw [ih1, ih2]
      constructor <;> simp
  | puff b =>
      simp [morph_fluff]
      apply morph_blob_idem
