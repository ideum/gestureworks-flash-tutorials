package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
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
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(0, 0, 400, 400);
			touchSprite.graphics.endFill();			
			touchSprite.x = stage.stageWidth/2 - 200;
			touchSprite.y = stage.stageHeight/2 -200;
			addChild(touchSprite);			
			touchSprite.nativeTransform = true;
			
			//assign rotate with multiply filter
			touchSprite.gestureList = { "rotate-multiply": true };		
		}
	
	}

}