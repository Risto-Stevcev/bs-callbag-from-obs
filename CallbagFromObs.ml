(* An observable is any object that has a subscribe method of this type *)
type ('a, 'b) observable = (<subscribe: ('a -> unit) -> unit; ..> as 'b) Js.t
type 'a observable'  = ('a, <subscribe: ('a -> unit) -> unit>) observable

external from_obs: ('a, _) observable -> 'a Callbag.t = "callbag-from-obs"
[@@bs.module]
