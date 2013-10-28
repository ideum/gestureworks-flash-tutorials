package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Loader;
	import flash.geom.ColorTransform;
	import flash.net.URLRequest;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Tilt extends GestureWorks
	{
		public function Tilt():void
		{
			gml = "tilt.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");		
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// add a bitmap image to the touch sprite
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../assets/gwLogo.png"));
			loader.x = -200;
			loader.y = -200;
			touchSprite.addChild(loader);
			
			// position touch sprite
			touchSprite.x = stage.stageWidth / 2;
			touchSprite.y = stage.stageHeight / 2;
			addChild(touchSprite);
			
			// add events 
			touchSprite.gestureList = { "tilt":true };
			
			// add tilt handler
			touchSprite.addEventListener(GWGestureEvent.TILT, onTilt);			
			function onTilt(event:GWGestureEvent):void{
				event.target.rotationX += event.value.tilt_dy;
				event.target.rotationY += event.value.tilt_dx;
			}
		
		}
	}
}