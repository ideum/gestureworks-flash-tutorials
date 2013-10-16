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
			
			var ts0:TouchSprite = new TouchSprite()
					var Loader0:Loader = new Loader();
					Loader0.load(new URLRequest("library/assets/lizard1.jpg"));
					Loader0.contentLoaderInfo.addEventListener(Event.COMPLETE, onloadComplete);
				ts0.addChild(Loader0);
				
				ts0.x = 200;
				ts0.y = 100;
				ts0.rotation = 45;
				ts0.scaleX = 0.5;
				ts0.scaleY = 0.5;

				ts0.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true };
				ts0.gestureEvents = true;
				ts0.addEventListener(GWGestureEvent.DRAG, gestureDragHandler);
				ts0.addEventListener(GWGestureEvent.ROTATE, gestureRotateHandler);
				ts0.addEventListener(GWGestureEvent.SCALE, gestureScaleHandler);
			addChild(ts0);
	
			var ts1:TouchSprite = new TouchSprite()
				var Loader1:Loader = new Loader();
					Loader1.load(new URLRequest("library/assets/lizard2.jpg"));
					Loader1.contentLoaderInfo.addEventListener(Event.COMPLETE, onloadComplete);
				ts1.addChild(Loader1);
				
				ts1.x = 100;
				ts1.y = 200;
				ts1.rotation = -20;
				ts1.scaleX = 0.8;
				ts1.scaleY = 0.8;

				ts1.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true };
				ts1.gestureEvents = true;
				ts1.addEventListener(GWGestureEvent.DRAG, gestureDragHandler);
				ts1.addEventListener(GWGestureEvent.ROTATE, gestureRotateHandler);
				ts1.addEventListener(GWGestureEvent.SCALE, gestureScaleHandler);
			addChild(ts1);
		}
		
		// load complete handler
		private function onloadComplete(event:Event):void
		{
			event.target.loader.x = -event.target.width / 2;
			event.target.loader.y = -event.target.height / 2;
		}
		
		// drag gesture handler
		private function gestureDragHandler(event:GWGestureEvent):void
		{	
			trace("g drag:		",event.value.drag_dx,event.value.drag_dy)
			event.target.x += event.value.drag_dx;
			event.target.y += event.value.drag_dy;
		}
		// rotate gesture handler
		private function gestureRotateHandler(event:GWGestureEvent):void
		{
			trace("g rot:		",event.value.rotate_dtheta)
			event.target.rotation += event.value.rotate_dtheta;
		}
		// scale gesture handler
		private function gestureScaleHandler(event:GWGestureEvent):void
		{
			trace("g scale:		",event.value.scale_dsx,event.value.scale_dsy)
			event.target.scaleX += event.value.scale_dsx;
			event.target.scaleY += event.value.scale_dsy;
		}
	}
}