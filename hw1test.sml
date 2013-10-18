 (* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "homework1.sml";

(* test cases for problem 1 *)
val testone1 = is_older((1,2,3),(2,3,4)) = true

val testone2 = is_older((2009,2,2), (2009,2,3)) = true

val testone3 = is_older((2012,3,3), (2012,3,3)) = false

val testone4 = is_older((2012,3,3), (2012,2,1)) = false

val testone5 = is_older((2000,12,31),(2012,1,1)) = true;

(* test cases for problem 2 *)
val test2 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1

val testtwo3 = number_in_month([(2013,3,9),(2014,3,4),(1999,2,1),(2003,3,30)],3) = 3

val testtwo4 = number_in_month([(1,2,3),(4,5,6),(9,8,7)], 11) = 0

(* test cases for problem 3 *)
val test3 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3

val testthree2 = number_in_months([(2012,2,2),(9,3,9),(9,9,9),(123,4,8),(8,5,6),(1,3,3)],[1,2,4,5,9]) = 4

val testthree3 = number_in_months([(12,12,12)],[1]) = 0

(* test cases for problem 4 *)
val test4 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

val testfour2 = dates_in_month([(2012,2,2),(2011,9,1)],3) = []

val testfour3 = dates_in_month([(1,2,3),(4,5,6),(4,5,9)],5) = [(4,5,6),(4,5,9)]

(* test cases for problem 5 *)
val test5 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val testfive2 = dates_in_months([(1,2,3)],[4,5,6]) = []

(* test cases for problem 6 *)
val test6 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"

val testsix7 = get_nth(["some", "are", "here"], 3) = "here"

(* test cases for problem 7 *)
val test7 = date_to_string((2013, 6, 1)) = "June 1, 2013"

(* test cases for problem 8 *)
val test8 = number_before_reaching_sum(10, [1,2,3,4,5,5,9]) = 3

val testeight1 = number_before_reaching_sum(4, [1,1,3,4]) = 2

(* test cases for problem 9 *)
val test9 = what_month(70)

(* test cases for problem 10 *)
val test10 = month_range(31, 34) = [1,2,2,2]

(* test cases for problem 11 *)
val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31) 
