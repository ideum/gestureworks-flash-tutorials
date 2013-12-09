package 
{
	import com.gestureworks.core.GestureWorks; 
	import com.gestureworks.core.GestureWorksAIR; GestureWorksAIR;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWTouchEvent;
	import com.gestureworks.managers.Leap2DManager;
	import com.gestureworks.managers.MotionManager;
	import com.leapmotion.leap.events.LeapEvent;
	import com.leapmotion.leap.Pointable;
	import flash.display.Loader;
	import flash.events.TouchEvent;
	import flash.net.URLRequest;
	
	
	[SWF(width = "1280", height = "720", backgroundColor = "0xFFFFFF", frameRate = "30")]

	public class Main_AIR extends GestureWorks 
	{
		
		public function Main_AIR():void 
		{
			super();
			gml = "my_gestures.gml"
			fullscreen = true;
									
			//enable TUIO input
			tuio = true; 
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");	
			
			//default
			var tcp:TouchSprite = new TouchSprite();
			tcp.graphics.beginFill(0xCCCCCC);
			tcp.graphics.drawRect(0,0,400,300);			
			tcp.releaseInertia = true;
			tcp.gestureList = { "n-drag-inertia":true, "n-scale-inertia":true, "n-rotate-inertia":true };
			tcp.nativeTransform = true;
			addChild(tcp);						
		}

	}
	
}