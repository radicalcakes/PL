(* datatype for cards *)

datatype suit = Club | Diamond | Heart | Spades

datatype rank = King | Queen | Jack | Ace | Num of int

(* can use the type or name *)
(* these are type synonyms *)
type card = suit * rank


fun is_queen_of_spades(c : card) =
	#1 c = Spades andalso #2 c = Queen


val c1 : card = (Heart, Num 1)

val c2 : suit * rank = (Heart, Jack)

val c3 = (Spades, Queen);