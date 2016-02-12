package;
import openfl.events.Event;

/**
 * ...
 * @author Mihail Mitov
 */
class ElementLifeCycleEvent extends Event {
	public static inline var BORN:String = "born";
	public static inline var DIED:String = "died";

	public var dna:CollectableDNAVO;
    public function new(type:String, DNA:CollectableDNAVO, bubbles:Bool=false, cancelable:Bool=false) 
    {
        super(type, bubbles, cancelable);       
        dna = DNA;
    }
	
}