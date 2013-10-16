package  
{
	import com.gestureworks.events.GWTouchEvent;
	import com.gestureworks.events.GWTransformEvent;
	import starling.events.TouchEvent;
	import flash.events.Event;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import com.gestureworks.core.VirtualTouchObject;
	
	public class StarlingTouchObject extends VirtualTouchObject
	{		
		public function StarlingTouchObject(target:*) 
		{
			super(target);
			transform.matrix = target.transformationMatrix;	
		}
		
		public function updateTransform():void
		{
			target.transformationMatrix = transform.matrix;

		}
		
	}

}