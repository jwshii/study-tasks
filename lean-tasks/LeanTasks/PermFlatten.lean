import LeanTasks.Perm

theorem flatten α (P Q : List (List α)) :
  Perm P Q -> Perm (List.flatten P) (List.flatten Q) := sorry
