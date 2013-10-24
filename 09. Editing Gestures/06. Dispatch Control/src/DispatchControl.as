package  
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.geom.ColorTransform;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate="60")]
	
	public class DispatchControl extends GestureWorks 
	{
		public function DispatchControl():void 
		{
			gml = "dispatch-control.gml";
		}
		
		override protected function gestureworksInit():void 
		{
			trace("gestureWorksInit()");						

			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(0, 0, 300, 300);
			touchSprite.graphics.endFill();
			
			// center graphic in the middle of the stage
			touchSprite.x = stage.stageWidth / 2 - 150;
			touchSprite.y = stage.stageHeight / 2 - 150;
			
			// add touch sprite to display list 
			addChild(touchSprite);

			// add events 
			touchSprite.gestureList = { "n-hold":true };
			touchSprite.addEventListener(GWGestureEvent.HOLD, gestureHandler);
		}		
		
		private function gestureHandler(e:GWGestureEvent):void
		{
			var ct:ColorTransform = new ColorTransform();
			ct.color = Math.random() * 0xFFFFFF;
			e.target.transform.colorTransform = ct;			
		}
	}
	
}