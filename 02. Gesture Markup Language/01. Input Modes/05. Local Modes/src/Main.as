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
	import flash.text.TextField;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "60")]

	public class Main extends GestureWorks 
	{
		
		public function Main():void 
		{
			super();
			fullscreen = true;
			
			gml = "my_gestures.gml"		
			simulator = true;
			tuio = true;
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");	
			
			//touch input only
			var touch:TouchSprite = new TouchSprite();
			touch.x = 26;
			touch.y = 160;
			touch.debugDisplay = true;
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../../assets/lake-vuoksa.jpg"));
			touch.addChild(loader)
			addChild(touch);
			
			touch.gestureList = { "n-drag-inertia":true, "n-rotate-inertia":true, "n-scale-inertia":true };
			touch.nativeTransform = true;
			touch.releaseInertia = true;

			touch.localModes = true;
			touch.nativeTouch = true;
			
			
			//mouse input only
			var mouse:TouchSprite = new TouchSprite();
			mouse.x = 438;
			mouse.y = 160;			
			mouse.debugDisplay = true;
			loader = new Loader();
			loader.load(new URLRequest("../../../../assets/michael-otto.jpg"));
			mouse.addChild(loader)
			addChild(mouse);

			mouse.gestureList = { "n-drag-inertia":true, "n-rotate-inertia":true, "n-scale-inertia":true };
			mouse.nativeTransform = true;
			mouse.releaseInertia = true;

			mouse.localModes = true;
			mouse.simulator = true;			


			//tuio input only			
			var tuio:TouchSprite = new TouchSprite();
			tuio.x = 852;
			tuio.y = 160;			
			tuio.debugDisplay = true;
			loader = new Loader();
			loader.load(new URLRequest("../../../../assets/neretva-river.jpg"));
			tuio.addChild(loader)
			addChild(tuio);		

			tuio.gestureList = { "n-drag-inertia":true, "n-rotate-inertia":true, "n-scale-inertia":true };
			tuio.nativeTransform = true;
			tuio.releaseInertia = true;			

			tuio.localModes = true;
			tuio.tuio = true;									
		}

	}
	
}