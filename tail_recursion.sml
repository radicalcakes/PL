
(* tail recursive version of fact using accum *)
fun fact n =
	let
		fun aux(n,acc) =
			if n = 0
			then acc
			else aux(n-1, acc * n)
	in
		aux(n,1)
	end


(* tail recursive version of sum *)
(* int list -> int  takes list of int and return
	the sum of them. *)
fun sum xs =
	let
		fun aux(xs, acc) =
			case xs of
				[] => acc
			  | x::xs' => aux(xs', x + acc)
	in
		aux(xs,0)
	end


(* tail recursive of reversing a list *)
fun rev xs =
	let
		 fun aux(xs, acc) =
		 	case xs of
		 		[] => acc
		 	  | x::xs' => aux(xs', x::acc)
	in
		aux(xs,[])
	end

val x = fact 5;

val sum_ans = sum [1,2,3,4];