package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;
	
	public class MyDisplay extends Sprite 
	{ 
		
		public function MyDisplay() 
		{
			super();
			
			init();
		}
		
		private function init ():void {
			
			var myTouchSprite:TouchSprite = new TouchSprite();
			var Loader0:Loader = new Loader();
				Loader0.load(new URLRequest("library/assets/cave_art.jpg"));
			myTouchSprite.addChild(Loader0);
			
			myTouchSprite.x = 50;
			myTouchSprite.y = 50;
			myTouchSprite.rotation = 45;
			myTouchSprite.scaleX = 0.5;
			myTouchSprite.scaleY = 0.5;
			addChild(myTouchSprite);
			
			myTouchSprite.gestureEvents = true;
			myTouchSprite.gestureList = { "n-drag":true };
			myTouchSprite.addEventListener(GWGestureEvent.DRAG, gestureDragHandler);							
		}
		
		// drag gesture handler
		private function gestureDragHandler(event:GWGestureEvent):void
		{	
			event.target.x += event.value.drag_dx;
			event.target.y += event.value.drag_dy;
		}

	}
}