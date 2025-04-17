
Inductive blob : Type :=
| bob   : blob
| glob  : blob -> blob.

Inductive fluff : Type :=
| enuff : fluff
| huff  : fluff -> fluff -> fluff
| puff  : blob -> fluff.

Fixpoint morph_blob (b : blob) : blob :=
  match b with
  | bob => bob
  | glob b => morph_blob b
  end.

Fixpoint morph_fluff (f : fluff) : fluff :=
  match f with
  | enuff => enuff
  | huff f1 f2 => huff (morph_fluff f1) (morph_fluff f2)
  | puff b => puff (morph_blob b)
  end.

Theorem morph_fluff_idem :
  forall f, morph_fluff (morph_fluff f) = morph_fluff f.
Proof.
Admitted.