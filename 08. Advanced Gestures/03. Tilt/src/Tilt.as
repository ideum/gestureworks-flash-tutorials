package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.geom.ColorTransform;
	
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
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(-250, -250, 500, 500);
			touchSprite.graphics.endFill();
			
			// align graphic
			touchSprite.x = ((stage.stageWidth) / 2) + 225
			touchSprite.y = ((stage.stageHeight) / 2);
			
			// add touch sprite to display list 
			addChild(touchSprite);
			
			// add events 
			touchSprite.gestureList = {"tilt":true};
			touchSprite.addEventListener(GWGestureEvent.TILT, onTilt);
			
			function onTilt(event:GWGestureEvent):void
			{
				trace("tilt");
				trace("tilt_dsx:", event.value.tilt_dx);
				trace("tilt_dsy:", event.value.tilt_dy);	
				event.target.rotationX += event.value.tilt_dy;
			}
		
		}
	}
}