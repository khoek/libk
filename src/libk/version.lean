namespace k

def revision : ℕ := 0

def is_available : bool := revision > 0

meta def assert_available : tactic unit :=
  if is_available then return () else tactic.fail "klean not available!"

end k