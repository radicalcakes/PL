fun silly2() =
	let
		val x = 1;
	in
		(let val x = 2 in x + 1 end) + (let val y = 4 in y end)
	end

val test_silly2 = silly2();

(* local scope count *)
fun countup(x : int) = 
	let
	    fun count(from : int) = 
	    	if from = x
	    	then x :: []
	    	else from :: count(from + 1)
	in
	    (* expression gets eval here *)
	    count(x)
	end

val countup_test = countup(10);


fun countdown(x : int) =
	let 
		fun count(to : int) =
			if to = 1
			then to :: []
			else to :: count(to - 1)
	in
		count(x)
	end


fun max_good(xs : int list) =
	if null xs
	then 0
	else if null (tl xs)
	then hd xs
	else
		let val tl_ans = max_good(tl xs)
		in 
			if hd xs > tl_ans
			then hd xs
			else tl_ans
		end

