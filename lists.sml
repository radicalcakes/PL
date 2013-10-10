(* sums a list *)
(* takes type list *)
fun sum_list(xs : int list) = 
	if null xs
	then 0
	else hd xs + sum_list(tl xs)

(* immediate tester func *)
val test_sum = sum_list([1,2,3]);

fun list_product(xs : int list) = 
	if null xs
	then 1
	else hd xs * list_product(tl xs)

val test_prod = list_product([2,4,2]);

(*takes int and returns int list*)
fun countdown(x : int) = 
	if x = 0
	then []
	(* cons list *)
	else x :: countdown(x-1)

val test_countdown = countdown(5);

fun append(xs : int list, ys : int list) =
	if null xs
	then ys
	(* this recursively breaks down the list by taking the tail of the xs list *)
	else hd xs :: append((tl xs), ys)

val test_append = append([1,2,3], [4,5,6]);

(* this sums a list of tuples *)
fun sum_tuple_list(ls : (int * int) list) =
	if null ls
	then 0
	else #1 (hd ls) + #2 (hd ls) + sum_tuple_list(tl ls)

(* should return 13 *)
val test_sum_tuple = sum_tuple_list([(1,2),(3,4),(1,2)])