package  
{
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
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
					Loader0.load(new URLRequest("library/assets/building1.jpg"));
				ts0.addChild(Loader0);
				ts0.x = 0;
				ts0.y = 0;
				ts0.rotation = 45;
				ts0.scaleX = 0.5;
				ts0.scaleY = 0.5;
				
				ts0.gestureEvents = true;
				ts0.affineTransform = true;
				ts0.nativeTransform = false;
				ts0.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true };
				ts0.addEventListener(GWGestureEvent.DRAG, gestureAffineDragHandler);
				ts0.addEventListener(GWGestureEvent.ROTATE, gestureAffineRotateHandler);
				ts0.addEventListener(GWGestureEvent.SCALE, gestureAffineScaleHandler);
			addChild(ts0);
	
			var ts1:TouchSprite = new TouchSprite()
				var Loader1:Loader = new Loader();
					Loader1.load(new URLRequest("library/assets/building2.jpg"));
				ts1.addChild(Loader1);
				ts1.x = 0;
				ts1.y = 0;
				ts1.rotation = -20;
				ts1.scaleX = 0.5;
				ts1.scaleY = 0.5;
				ts1.gestureEvents = true;
				ts1.affineTransform = true;
				ts1.nativeTransform = false;
				ts1.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true };
				ts1.addEventListener(GWGestureEvent.DRAG, gestureAffineDragHandler);
				ts1.addEventListener(GWGestureEvent.ROTATE, gestureAffineRotateHandler);
				ts1.addEventListener(GWGestureEvent.SCALE, gestureAffineScaleHandler);
			addChild(ts1);
		}
		
		// drag gesture handler
		private function gestureAffineDragHandler(event:GWGestureEvent):void
		{	
			trace("g drag:		",event.value.drag_dx,event.value.drag_dy)
			event.target.x += event.value.drag_dx;
			event.target.y += event.value.drag_dy;
		}
		// rotate gesture handler
		private function gestureAffineRotateHandler(event:GWGestureEvent):void
		{
			trace("g rot:		",event.value.rotate_dtheta)
			event.target.rotation += event.value.rotate_dtheta;
		}
		// scale gesture handler
		private function gestureAffineScaleHandler(event:GWGestureEvent):void
		{
			trace("g scale:		",event.value.scale_dsx,event.value.scale_dsy)
			event.target.scaleX += event.value.scale_dsx;
			event.target.scaleY += event.value.scale_dsy;
		}
	}
}