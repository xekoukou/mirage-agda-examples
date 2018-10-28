open Mirage

let packages = [
  package "zarith";
  package "uucp";
  package "uutf";
  package ~sublibs:["string"] "uunf";
  package ~sublibs:["lwt"] "logs";
]
   
let main =
  foreign
    ~packages:[package "duration"]
    "Unikernel.Hello" (time @-> job)

let () =
  register ~packages "hello" [main $ default_time]
