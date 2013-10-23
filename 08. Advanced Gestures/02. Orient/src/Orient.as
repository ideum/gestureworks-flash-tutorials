package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Orient extends GestureWorks
	{
		public function Orient():void
		{
			gml = "orient.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
					
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0x00FF00);
			touchSprite.graphics.drawRect(0, 0, 500, 500);
			touchSprite.graphics.endFill();
			
			// center graphic in the middle of the stage
			touchSprite.x = (stage.stageWidth - 100) / 2;
			touchSprite.y = (stage.stageHeight - 500) / 2;
			
			// add touch sprite to display list 
			touchSprite.debugDisplay = true;
			addChild(touchSprite);
			
			// add events 
			touchSprite.affineTransform = true
			touchSprite.nativeTransform = true;
			touchSprite.gestureList = {"orient": true};
			touchSprite.addEventListener(GWGestureEvent.ORIENT, gestureHandler);
			
			function gestureHandler(e:GWGestureEvent):void
			{
				trace(e.value.orient_thumbID);
			}
		}
	
	}

}