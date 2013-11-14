package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import flash.display.Loader;
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
			// THERE ARE TOUCH GESTURES AND MOTION IN THE GERSTURE LIBRARY
			gml="library/gml/my_gestures.gml"					
			fullscreen = true;	
			// INITIALIZE LEAP INTO 3D MODE BY DEFAULT
			leap3D = true;
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");	
			
			var myTouchSprite:TouchSprite = new TouchSprite();
				var Loader0:Loader = new Loader();
					Loader0.load(new URLRequest("library/assets/landscape.jpg"));
				myTouchSprite.addChild(Loader0);
				myTouchSprite.scale = .5;
			addChild(myTouchSprite);
			
			myTouchSprite.debugDisplay = true;  //TURN ON THE MOTION POINT VISUALIZER
			
			myTouchSprite.nativeTransform = false; // MUST BE MANUALLY SET TO FALSE
			myTouchSprite.affineTransform = true; // ENSURES THAT SCALING/ZOOM IS ABOUT THE CENTER OF THE INTERACTION CLUSTER 
			myTouchSprite.gestureEvents = true; // ACTIVATES THE OBJECT GESTURE EVENT PIPELINE 
			
			myTouchSprite.motionEnabled = true; // ENABLES THE TOUCH SPRITE TO PROCESS MOTION GESTURES
			myTouchSprite.touchEnabled  = true; // ENSURES THE TOUCH SPRITE TO PROCESS TOUCH GESTURES (ON BY DEFAULT)
			myTouchSprite.transform3d = false; // ENSURES THAT THE 3D MOTION INTERACTION POINTS ARE PROJECTED INTO THE 2D STAGE
			
			
			myTouchSprite.motionClusterMode = "global";	// CONFIGURES THE TOUCH SPRITE TO GLOBALLY COLLECT ALL 3D MOTION INTERACTION POINTS FROM THE SKELETAL MODEL	
			
			// IN THIS EXAMPLE THERE IS A TOUCH GESTURE AND A MOTION GESTURE PRIMATIVE
				// 1. THE 1 POINT PINCH TO DRAG/PAN 3D MOTION GESTURE ENABLES THE IMAGE TO PAN ON WHEN A SINGLE HAND IS USED TO CREATE A PINCH POINT AND MOVED IN THE SAME PLANE AS THE DISPLAY SCREEN
				// 2. THE 1 TRIGGER PINCH TO DRAG/PAN 3D MOTION GESTURE ENABLES THE IMAGE TO PAN ON WHEN A SINGLE HAND IS USED TO CREATE A TRIGGER POINT AND MOVED IN THE SAME PLANE AS THE DISPLAY SCREEN
				// 3. THE 2 POINT PINCH TO SCALE 3D MOTION GESTURE ENABLES THE IMAGE TO UNDERGO A SCALING WHEN TWO HANDS ARE USED TO CREATE PINCH POINTS AND DRAWN SLOWLY APPART 				
				// NOTE THAT TRIGGER AND PINCH POINTS ARE MUTUALLY EXCLISIVE 3D MOTION GESTURES AS THE TRIGGER POSTURE REQUIRES A DIFFERENT POSE FROM THE PINCH 3D MOTION GESTURE
				// THIS ENSURES THAT THESE GESTURES CAN BE USED INTERCHANGEABLY BASED ON ERGONOMIC PRFERENCES OR THE TRACKING CAPABILITIES OF THE 3D MOTION INPUT DEVICE 
			
			myTouchSprite.gestureList = { "n-manipulate-boundary":true,
								"3dmotion-1-pinch-2dtranslate":true,
								"3dmotion-1-trigger-2dtranslate":true,
								"3dmotion-2-pinch-2dscale":true								
								};			
								
			//TOUCH GESTURE LISTENER					
			myTouchSprite.addEventListener(GWGestureEvent.MANIPULATE, touchManipulate);			
								
			// MOTION GESTURE LISTENERS
			myTouchSprite.addEventListener(GWGestureEvent.MOTION_DRAG, gestureMotionDragHandler);
			myTouchSprite.addEventListener(GWGestureEvent.MOTION_SCALE, gestureMotionScaleHandler);
					
		}
		
		private function touchManipulate(event:GWGestureEvent):void {
			event.target.x += event.value.dx;
			event.target.y += event.value.dy;
			event.target.scale += event.value.dsx;;
		}
		
		private function gestureMotionDragHandler(event:GWGestureEvent):void
		{				
			event.target.x += event.value.dx;
			event.target.y += event.value.dy;
		}
		
		private function gestureMotionScaleHandler(event:GWGestureEvent):void
		{
			event.target.scale += event.value.dsx;
		}
		
	}
	
}