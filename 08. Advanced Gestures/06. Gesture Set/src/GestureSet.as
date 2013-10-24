package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class GestureSet extends GestureWorks
	{
		public function GestureSet():void
		{
			gml = "gesture-set.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");

			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(0, 0, 400, 400);
			touchSprite.graphics.endFill();
			
			// center graphic in the middle of the stage
			touchSprite.x = 650;
			touchSprite.y = (stage.stageHeight - 400) / 2;
			
			// add touch sprite to display list
			touchSprite.debugDisplay = true;
			addChild(touchSprite);
			
			// add events 
			touchSprite.affineTransform = true
			touchSprite.gestureList = {"stroke_letter_uppercase": true};
			touchSprite.addEventListener(GWGestureEvent.STROKE_LETTER, gestureHandler);
		}
		
		private function gestureHandler(e:GWGestureEvent):void
		{
			trace(e.value.id);
		}
	}

}