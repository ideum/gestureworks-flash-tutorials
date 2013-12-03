package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Multiply extends GestureWorks
	{
		public function Multiply():void
		{
			gml = "multiply-filter.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// add a bitmap image to the touch sprite
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../assets/gwLogo.png"));
			touchSprite.addChild(loader);
			
			// center object in the middle of the stage and add to display list
			touchSprite.x = stage.stageWidth / 2 - 200;
			touchSprite.y = stage.stageHeight / 2 - 200;			
			addChild(touchSprite);
			
			// enable events 
			touchSprite.gestureList = { "pivot": true, "n-drag":true, "n-rotate":true };
			
			//transform application
			touchSprite.nativeTransform = true;			
			
			//assign rotate with multiply filter
			touchSprite.gestureList = { "rotate-multiply": true };		
		}
	
	}

}