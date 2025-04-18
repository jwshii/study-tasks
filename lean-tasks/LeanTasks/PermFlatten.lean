import LeanTasks.Perm
import Aesop

theorem flatten : ∀ α (P Q : List (List α)),
    Perm P Q -> Perm (List.flatten P) (List.flatten Q) := by
  intros α P Q h
  induction h with
  | nil => exact Perm.refl
  | cons x l1 l2 a a_ih =>
      simp
      exact Perm.append_left x a_ih
  | swap x y l =>
      simp [<- List.append_assoc]
      refine Perm.append_right l.flatten Perm.append_comm
  | trans h h' a_ih a_ih' =>
      exact Perm.trans a_ih a_ih'
