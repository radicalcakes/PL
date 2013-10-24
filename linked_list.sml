
(* bad style for list *)
datatype my_int_list = Empty
					 | Cons of int * my_int_list


val x = Cons(4, Cons(23, Cons(2008, empty)));

fun append_my_list(xs,ys) =
	case xs of
		Empty => ys
	  | Cons(x, xs') => Cons(x, append_my_list(xs', ys))


fun sum_list xs =
	case xs of
		[] => 0
	  | x::xs' => x + sum_list xs'


fun append(xs, ys) =
	case xs of
		[] => ys
	  | x::xs' => x :: append(xs', ys) 