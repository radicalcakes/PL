(* polymorphic data *)
datatype sgn = P | N | Z

fun multsign(x1, x2) = (* int * int -> sign *)
	let fun sign x = if x = 0 then Z else if x > 0 then P else N
	in 
		case(sign x1, sign x2) of
			(Z,_) => Z
		  | (_,Z) => Z
		  | (P,P) => P
		  | _ => N
	end