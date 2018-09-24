import system.io

-- Supress "xxx is noncomputable" errors when running on vanilla lean
noncomputable theory

-- Boilerplate for implementing extra IO functions
class vm_extra_io (m : Type → Type → Type) [monad_io m] :=
(nop   : io unit)
(greet : io unit)

@[instance] constant vm_extra_io_impl : vm_extra_io io_core

namespace k

-- Functions which use IO types go via a call like this. (Routed through the instance
-- of vm_extra_io.)
def greet : io unit := vm_extra_io.greet io_core

-- Functions which do not use IO types are just declared like this.
def find_separating_hyperplane {dim : ℕ} (a_vects : list (array dim ℕ))
    (b_vects : list (array dim ℕ)) : (array dim ℤ) × ℤ :=
  (mk_array dim 0, 0)
-- TODO use an honest, raw array-backed data type (the built-in array/parray isn't
-- do this and frankly that seems really pointless)

end k
