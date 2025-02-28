import Mathlib.NumberTheory.Basic

lemma sqrt2irrational_lemma_0 {m : ℕ} {n : ℕ} (h_0 : m.Coprime n) : m ^ 2 ≠ 2 * n ^ 2 := by sorry
lemma sqrt2irrational_lemma_1 {m : ℕ} {n : ℕ} (h_0 : m.Coprime n) (h_1 : m ^ 2 = 2 * n ^ 2) : Even (m ^ 2) := by sorry
lemma sqrt2irrational_lemma_2 {m : ℕ} (h_2 : Even (m ^ 2)) : Even m := by sorry
lemma sqrt2irrational_lemma_3 {m : ℕ} (h_3 : Even m) : ∃ k, m = 2 * k := by sorry
lemma sqrt2irrational_lemma_4 {m : ℕ} {n : ℕ} {k : ℕ} (h_4 : m = 2 * k) (h_1 : m ^ 2 = 2 * n ^ 2) : 4 * k ^ 2 = 2 * n ^ 2 := by sorry
lemma sqrt2irrational_lemma_5 {n : ℕ} {k : ℕ} (h_5 : 4 * k ^ 2 = 2 * n ^ 2) : n ^ 2 = 2 * k ^ 2 := by sorry
lemma sqrt2irrational_lemma_6 {n : ℕ} {k : ℕ} (h_6 : n ^ 2 = 2 * k ^ 2) : Even (n ^ 2) := by sorry
lemma sqrt2irrational_lemma_7 {n : ℕ} (h_7 : Even (n ^ 2)) : Even n := by sorry
lemma sqrt2irrational_lemma_8 {m : ℕ} {n : ℕ} (h_3 : Even m) (h_8 : Even n) : 2 ∣ m ∧ 2 ∣ n := by sorry
lemma sqrt2irrational_lemma_9 {m : ℕ} {n : ℕ} (h_9 : 2 ∣ m) (h_10 : 2 ∣ n) : ¬(Nat.Coprime m n) := by sorry
lemma sqrt2irrational_lemma_10 {n : ℕ} {m : ℕ} (h_13 : ¬(Nat.Coprime m n)) (h_0 : m.Coprime n) : false := by sorry
lemma sqrt2irrational_lemma_11 {m : ℕ} {n : ℕ} (h_0 : m.Coprime n) (l_0 : m ^ 2 = 2 * n ^ 2 → false) : m ^ 2 ≠ 2 * n ^ 2 := by sorry
lemma sqrt2irrational_lemma_12 {m : ℕ} {n : ℕ} (h_0 : m.Coprime n) (h_1 : m ^ 2 = 2 * n ^ 2) : false := by sorry
lemma sqrt2irrational_lemma_13 {m : ℕ} {n : ℕ} {k : ℕ} (h_0 : m.Coprime n) (h_1 : m ^ 2 = 2 * n ^ 2) (h_4 : m = 2 * k) (h_12 : ∃ k, m = 2 * k) : false := by
  apply sqrt2irrational_lemma_10
  rotate_left
  exact h_0
  apply sqrt2irrational_lemma_9
  sorry
  sorry


theorem sqrt2irrational {m n : ℕ} (coprime_mn : m.Coprime n) : m ^ 2 ≠ 2 * n ^ 2 := by

  have (h : m ^ 2 = 2 * n ^ 2 → False) :  m ^ 2 ≠ 2 * n ^ 2 := by
    intro false
    apply h false
  apply this

  intro sqr_eq
  have : 2 ∣ m := by
    sorry
  obtain ⟨k, meq⟩ := dvd_iff_exists_eq_mul_left.mp this
  have : 2 * (2 * k ^ 2) = 2 * n ^ 2 := by
    rw [← sqr_eq, meq]
    ring
  have : 2 * k ^ 2 = n ^ 2 :=
    sorry
  have : 2 ∣ n := by
    sorry
  have : 2 ∣ m.gcd n := by
    sorry
  have : 2 ∣ 1 := by
    sorry
  norm_num at this


