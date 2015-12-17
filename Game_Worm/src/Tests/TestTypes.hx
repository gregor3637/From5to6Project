package Tests;

/**
 * ...
 * @author Mihail Mitov
 */

class TestTypes {
	public static var GOOD:Array<WWW> = [ WWW.Apple, WWW.Alcohol, WWW.Kiwi];
	public static var BAD:Array<WWW> = [ WWW.Apple, WWW.Alcohol, WWW.Kiwi];
	public static var NEUTRAL:Array<WWW> = [WWW.Snow];
	public static var BONUS:Array<WWW> = [WWW.Snow];
	
}

@:enum
abstract WWW(String) {
	var Apple   = "true, img/Cell_Blue.png";
	var Grapes  = "true, img/Cell_Green.png";
	var Kiwi    = "true, img/Cell_Grey.png";
	
	var Sandwich = "false, img/Cell_Purple.png";
	var Alcohol  = "false, img/Cell_Red.png";
	var Meat     = "false, img/Cell_Yellow.png";
	
	var Snow     = "false, img/Cell_Yellow.png";

	var Bonus    = "false, img/Cell_Yellow.png";
	
}
 


