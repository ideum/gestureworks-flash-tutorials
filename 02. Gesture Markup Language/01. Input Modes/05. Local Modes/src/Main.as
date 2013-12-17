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
			touch.graphics.beginFill(0xFFFFFF);
			touch.graphics.drawRect(0, 0, 400, 400);
			touch.gestureList = { "n-drag-inertia":true, "n-rotate-inertia":true, "n-scale-inertia":true };
			touch.nativeTransform = true;
			addChild(touch);

			touch.localModes = true;
			touch.nativeTouch = true;
			
			
			//mouse input only
			var mouse:TouchSprite = new TouchSprite();
			mouse.x = 438;
			mouse.y = 160;			
			mouse.debugDisplay = true;
			mouse.graphics.beginFill(0x0000FF);
			mouse.graphics.drawRoundRect(0, 0, 400, 400, 20, 20);
			mouse.gestureList = { "n-drag-inertia":true, "n-rotate-inertia":true, "n-scale-inertia":true };
			mouse.nativeTransform = true;
			addChild(mouse);
			
			mouse.localModes = true;
			mouse.simulator = true;			
			

			//tuio input only			
			var tuio:TouchSprite = new TouchSprite();
			tuio.x = 852;
			tuio.y = 160;			
			tuio.debugDisplay = true;
			tuio.graphics.beginFill(0x00FF00);
			tuio.graphics.drawCircle(200,200,200);
			tuio.gestureList = { "n-drag-inertia":true, "n-rotate-inertia":true, "n-scale-inertia":true };
			tuio.nativeTransform = true;
			addChild(tuio);			

			tuio.localModes = true;
			tuio.tuio = true;									
		}

	}
	
}