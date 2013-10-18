(* challenge problems *)

(* 1. compares first date with second and returns true if first date
 is older. *)
fun is_older(date1 : int * int * int, date2 : int * int * int) =
	if #1 date1 <= #1 date2
	then #2 date1 < #2 date2 orelse #3 date1 < #3 date2
	else false 


(* 2. takes a list of dates and a month (i.e., an int) and returns
 how many dates in the list are in the given month. 
 fn : (int * int * int) list * int -> int *)
fun number_in_month(dates : (int * int * int) list, month : int) = 
	(* recursively go through tail of list, checking the head of each step,
	each head should then have the 2nd item checked with month *)
	if null dates
	then 0
	else if #2 (hd dates) = month
	(* func is type int, so add 1 *)
	then 1 + number_in_month(tl dates, month)
	else number_in_month(tl dates, month)


(* 3. takes a list of dates and a list of months (i.e., an int list)
 and returns the number of dates in the list of dates that are in any of the months in the list of months.
 Assume the list of months has no number repeated.
 fn : (int * int * int) list * int list -> int *)
fun number_in_months(dates : (int * int * int) list, months : int list) =
	if null months
	then 0
	else number_in_month(dates, hd months) + number_in_months(dates, tl months)


(* 4. takes a list of dates and a month (i.e., an int) and returns a
list holding the dates from the argument list of dates that are in the month. The returned list should
contain dates in the order they were originally given.
 val dates_in_month = fn : (int * int * int) list * int -> (int * int * int) list*)
fun dates_in_month(dates : (int * int * int) list, month : int) =
	if null dates
	then dates
	else if #2 (hd dates) = month
	then hd dates :: dates_in_month(tl dates, month)
	else dates_in_month(tl dates, month)


(* 5. takes a list of dates and a list of months (i.e., an int list)
and returns a list holding the dates from the argument list of dates that are in any of the months in
the list of months. Assume the list of months has no number repeated. Hint: Use your answer to the
previous problem and SML's list-append operator (@) 
val dates_in_months = fn : (int * int * int) list * int list -> (int * int * int) list *)
fun dates_in_months(dates : (int * int * int) list, months : int list) = 
	if null months
	then []
	else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)


(* 6.  takes a list of strings and an int n and returns the n
th element of the
list where the head of the list is 1st. Do not worry about the case where the list has too few elements:
your function may apply hd or tl to the empty list in this case, which is okay. 
val get_nth = fn : string list * int -> string *)
fun get_nth(words : string list, i : int) =
	(* used a lib function, could use condition/recursion and check if i=0 instead, but this
	is the easy/lazy way. *)
	List.nth(words, i - 1)


(* 7.  takes a date and returns a string of the form January 20, 2013
(for example). Use the operator ^ for concatenating strings and the library function Int.toString
for converting an int to a string. For producing the month part, do not use a bunch of conditionals.
Instead, use a list holding 12 strings and your answer to the previous problem. For consistency, put a
comma following the day and use capitalized English month names: January, February, March, April,
May, June, July, August, September, October, November, December 
val date_to_string = fn : int * int * int -> string *)
fun date_to_string(date : (int * int * int)) =
	let 
		val months = ["January", "February", "March", "April", "May", "June", "July"
						,"August", "September", "October", "November", "December"] 
		val month = get_nth(months, #2 date)
	in
		month ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
	end


(* 8. takes an int called sum, which you can assume 
is positive, and an int list, which you can assume contains all positive numbers, and returns an int.
You should return an int n such that the First n elements of the list add to less than sum, but the first
n + 1 elements of the list add to sum or more. Assume the entire list sums to more than the passed in
value; it is okay for an exception to occur if this is not the case.
val number_before_reaching_sum = fn : int * int list -> int *)
fun number_before_reaching_sum(sum : int, nums : int list) = 
	if sum <= 0
	(* n + 1, therefore, need to start at -1 to offset*)
	then ~1
	else 
		let val n = 0
		in
		    1 + number_before_reaching_sum(sum - hd nums, tl nums)
		end 


(* 9. takes a day of year (i.e., an int between 1 and 365) and returns
what month that day is in (1 for January, 2 for February, etc.). Use a list holding 12 integers and your
answer to the previous problem val what_month = fn : int -> int *)
fun what_month(day : int) =
	let
		val months = [31,30,31,30,31,30,31,31,30,31,30,31]
	in
		(* add one, because number_before_reaching_sum *)
		1 + number_before_reaching_sum(day, months)
	end


(* 10. takes two days of the year day1 and day2 and returns an int list
[m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month
of day day2. Note the result will have length day2 - day1 + 1 or length 0 if day1>day2. 
val month_range = fn : int * int -> int list *)
fun month_range(days : (int * int)) = 
	if #1 days > #2 days
	then []
	else 
		let
	    	val day = #1 days
		in
		    what_month(day) :: month_range((day + 1, #2 days))
		end


(* 11. Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It
evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list.
val oldest = fn : (int * int * int) list -> (int * int * int) option *)
fun oldest(dates : (int * int * int) list) =
	if null dates
	then NONE
	else 
		let
		    fun min_date(dates : (int * int * int) list) =
		    	if null(tl dates)
		    	then hd dates
		    	else
		    		let
		    			val tl_dates = min_date(tl dates)
		    		in
		    			if is_older(hd dates, tl_dates)
		    			then hd dates
		    			else tl_dates
		    		end
		in
		    SOME(min_date dates)
		end