datatype test = 
	testInt of int * int 
	| testStr of string
	| testVal


fun testType x = 
	case x of testInt (i1,i2) => i1 * i2
	    | testStr s => String.size s
	    | testVal => 3 * 4



val t = testType 3;

