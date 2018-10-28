module DD = ForeignCode 

module Hello (Time : Mirage_time_lwt.S) = struct

  let start _time = UniK.start (fun _ -> Time.sleep_ns (Duration.of_sec 1)) ()


end
