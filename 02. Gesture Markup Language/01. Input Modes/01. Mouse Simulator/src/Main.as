package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.managers.Leap2DManager;
	import com.gestureworks.managers.MotionManager;
	import com.leapmotion.leap.events.LeapEvent;
	import com.leapmotion.leap.Pointable;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class Main extends GestureWorks 
	{
		
		public function Main():void 
		{
			super();
			gml = "my_gestures.gml"
									
			//enable mouse input
			simulator = true;
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");	
			
			var ts:TouchSprite = new TouchSprite();
			ts.graphics.beginFill(0xFF0000);
			ts.graphics.drawRect(0, 0, 400, 400);
			ts.gestureList = { "n-drag-inertia":true, "n-scale-inertia":true, "n-rotate-inertia":true };
			ts.nativeTransform = true;
			ts.releaseInertia = true;
			addChild(ts);
		}

	}
	
}