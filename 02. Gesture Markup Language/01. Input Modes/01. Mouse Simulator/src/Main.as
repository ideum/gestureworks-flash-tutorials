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
			
			var myTouchSprite:TouchSprite = new TouchSprite();	
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../../assets/bee.jpg"));
			myTouchSprite.addChild(loader);
			myTouchSprite.debugDisplay = true;
			addChild(myTouchSprite);			
			
			myTouchSprite.gestureList = { "n-drag-inertia":true, "n-scale-inertia":true, "n-rotate-inertia":true };
			myTouchSprite.nativeTransform = true;
			myTouchSprite.releaseInertia = true;
		}

	}
	
}