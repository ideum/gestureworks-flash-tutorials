package 
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.managers.Leap2DManager;
	import com.gestureworks.managers.LeapManager;
	import com.gestureworks.managers.MotionManager;
	import com.leapmotion.leap.events.LeapEvent;
	import com.leapmotion.leap.Pointable;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class Main extends GestureWorks 
	{
	
		private var xMin:int = -1000;
		private var xMax:int = 1000;
		private var projectedX:Number;
		
		private var yMin:int = -1600;
		private var yMax:int = 1600;
		private var projectedY:Number;		
		
		public function Main():void 
		{
			super();
			gml="library/gml/my_gestures.gml"
						
			fullscreen = true;			
			leap3D = true;
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");	
			
			var myTouchSprite:TouchSprite = new TouchSprite();
			var Loader0:Loader = new Loader();
				Loader0.load(new URLRequest("library/assets/BRYCE JOINER.jpg"));
			myTouchSprite.addChild(Loader0);
			myTouchSprite.scale = .5;
			myTouchSprite.debugDisplay = true;
			addChild(myTouchSprite);
			
			//myTouchSprite.nativeTransform = true;
			myTouchSprite.nativeTransform = false;
			myTouchSprite.affineTransform = true;
			myTouchSprite.gestureEvents = true;
			
			myTouchSprite.motionEnabled = true;
			myTouchSprite.touchEnabled  = true; // DOES ACT OF ADDING GESTURELIST OVERRIDE ENABLING????
			
			myTouchSprite.motion3d = true; 
			myTouchSprite.transform3d = false; //NEED TO ENSURE NO 2D CLUSTER COOR TRANSFORM
			
			//motion cluster type
			//myTouchSprite.motionClusterMode = "local_strong";
			//myTouchSprite.motionClusterMode = "local_weak";
			myTouchSprite.motionClusterMode = "global";			
			
			
			myTouchSprite.gestureList = { "n-manipulate-boundary":true,
								"3dmotion-2-pinch-2dscale":true,
								"3dmotion-1-pinch-2dtranslate":false,
								"3dmotion-1-trigger-2dtranslate":true							
								};			
								
			//TOUCH GESTURE LISTENER					
			//myTouchSprite.addEventListener(GWGestureEvent.MANIPULATE, touchManipulate);			
								
			// MOTION GESTURE LISTENERS
			myTouchSprite.addEventListener(GWGestureEvent.MOTION_DRAG, gestureMotionDragHandler);
			myTouchSprite.addEventListener(GWGestureEvent.MOTION_SCALE, gestureMotionScaleHandler);
					
		}
		
		private function touchManipulate(event:GWGestureEvent):void {
			dragBoundaries(event.target, event.value.dx, event.value.dy);
			event.target.scale += event.value.dsx;;
		}
		
		private function gestureMotionDragHandler(event:GWGestureEvent):void
		{				
			dragBoundaries(event.target, event.value.dx, event.value.dy);
		}
		
		private function gestureMotionScaleHandler(event:GWGestureEvent):void
		{
			event.target.scaleX += event.value.dsx;
			event.target.scaleY += event.value.dsy;
		}
		
		private function dragBoundaries(tgt:*, deltaX:Number, deltaY:Number):void {
			projectedX = tgt.x + deltaX;
			projectedY = tgt.y + deltaY;
		
			if(projectedX <= 0 || deltaX < 0)
				tgt.x = projectedX;	
				
			if(projectedY <= 0 || deltaY < 0)
				tgt.y = projectedY;			
		}
		
	}
	
}