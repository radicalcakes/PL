datatype mytype = ThreeInts of int * int * int
				| Str of string
				| Cookie


(* mytype -> int *)
fun f(x : mytype) =
	case x of
		Cookie => 3
	  | Str s => 8
	  | ThreeInts(i1,i2,i3) => i1 + i2 + i3



datatype thien = FirstName 
			   | LastName 
			   | Age 
			   | Likes of string list


fun t(y : thien) =
	case y of
		FirstName => "thien"
	  | LastName => "Huynh"
	  | Age => "dfdf"
	  | Likes l => "cookies"

(* have to pass a list in, and then evals to "cookies" *)
(* keyword of makes sure you pass in an arg with that type *)

