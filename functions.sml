fun pow(x : int, y : int) = 
	if y = 0
	then 1
	else x * pow(x, y-1)

val x = pow(3, 2);

fun silly(pr : int * int) =
	if #1 pr > 7
	then pr
	else pr

val sil = silly((2,4));