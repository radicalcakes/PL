(* simple expression tree language *)

datatype exp = 
	Constant of int 
	| Negate of exp
	| Add of exp * exp
	| Multiply of exp * exp


fun eval e =
	case e of
		Constant i => i 
	  | Negate e2 => ~ (eval e2)
	  					(* fun needs to be recursive*)
	  | Add(e1, e2) => (eval e1) + (eval e2)
	  | Multiply(e1, e2) => (eval e1) * (eval e2)


(*doesn't compute answer, but counts how many additions are in exp*)
fun number_of_adds e =  (* exp -> int *)
	case e of
		Constant i => 0
	  | Negate e2 => number_of_adds e2
	  | Add(e1, e2) => 1 + number_of_adds e1 + number_of_adds e2
	  | Multiply(e1, e2) => number_of_adds e1 + number_of_adds e2

(* finds the max, can use Int.max *)
fun max_constant e =
	let fun max_of_two(e1, e2) =
			Int.max(max_constant e1,max_constant e2)
	in
		case e of
			Constant i => i
		  | Negate e2 => max_constant e2
		  | Add(e1, e2) => max_of_two(e1, e2)
		  | Multiply(e1, e2) => max_of_two(e1, e2)
	end


(*example expression tree*)
val example_exp : exp = Add(Constant 24, Negate(Constant(12)));

(* eval expression tree to answer *)
val example_ans : int = eval example_exp;

val example_adds = number_of_adds(Multiply(example_exp, example_exp));

val test_exp = Add(Constant 19, Negate(Constant(4)));

val ans = max_constant test_exp;
