module Observe = struct
  external _f: ('a -> unit) -> ('a Callbag.t -> unit [@bs]) = "callbag-observe"
  [@@bs.module]

  let f g a = (_f g) a [@bs]
end

let interval: int CallbagFromObs.observable' = [%raw {|
  {
    subscribe: (observer) => {
      let i = 0;
      setInterval(() => observer.next(i++), 1000);
    }
  }
|}]

let _ =
  interval 
  |> CallbagFromObs.from_obs
  |> Observe.f Js.log

