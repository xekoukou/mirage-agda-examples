module UniK where

open import Prelude.IO
open import Prelude.Monad
open import Prelude.Unit
open import Prelude.Nat
open import Prelude.String


postulate
  info : String -> IO Unit

{-# FOREIGN OCaml
let info s world = Logs_lwt.info (fun f -> f (Scanf.format_from_string s "lofs"))
#-}

{-# COMPILE OCaml info = info #-}

loop : IO Unit → Nat → IO Unit
loop sleep zero = return unit
loop sleep (suc n) = do
  info "Hello from Agda."
  sleep
  loop sleep n


start : IO Unit → IO Unit
start sleep = loop sleep 4


{-# COMPILE OCaml start as val start : (unit -> unit Lwt.t) -> unit -> unit Lwt.t #-}
