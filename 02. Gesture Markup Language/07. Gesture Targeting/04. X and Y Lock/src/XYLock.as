package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "60")]

	public class XYLock extends GestureWorks
	{
		
		public function XYLock():void 
		{
			super();
			gml = "x-y-lock.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Create parent containers and set their positions
			var yLockContainer:TouchSprite = new TouchSprite()	
			yLockContainer.x = 250
			yLockContainer.y = 250;			
			
			var xLockContainer:TouchSprite = new TouchSprite()	
			xLockContainer.x = 850
			xLockContainer.y = 250;
			
			//Configure containers to allow children to receive interaction points
			yLockContainer.mouseChildren = true;
			xLockContainer.mouseChildren = true;
			
			
			//Add the manipulate gesture to the containers and set
			//nativeTransform equal to true so that GestureWorks handles
			//the transforms natively.
			yLockContainer.affineTransform = true;
			yLockContainer.nativeTransform = true;
			yLockContainer.gestureList = { "manipulate":true};					
			addChild(yLockContainer);
			
			xLockContainer.affineTransform = true;
			xLockContainer.nativeTransform = true;
			xLockContainer.gestureList = { "manipulate":true};					
			addChild(xLockContainer);
			
			//create belt children,set their styling and set their positions
			var yLockBelt:TouchSprite = new TouchSprite()
			yLockBelt.graphics.lineStyle(4, 0x333333);
			yLockBelt.graphics.beginFill(0x999999);
			yLockBelt.graphics.drawRect( -150, 0, 500, 200);		
			
			var xLockBelt:TouchSprite = new TouchSprite()
			xLockBelt.graphics.lineStyle(4, 0x333333);
			xLockBelt.graphics.beginFill(0x999999);
			xLockBelt.graphics.drawRect(0, -150, 200, 500);
			
			//Lock the belt childrens' axis and add a drag gesture
			//Set nativeTransform to true to allow GestureWorks to handle
			//the drag gesture transforms natively
			yLockBelt.y_lock = true; 
			yLockBelt.nativeTransform = true;
			yLockBelt.gestureList = { "n-drag":true };
			yLockContainer.addChild(yLockBelt);
			
			xLockBelt.x_lock = true; 
			xLockBelt.nativeTransform = true;
			xLockBelt.gestureList = { "n-drag":true };
			xLockContainer.addChild(xLockBelt);
			
			
			//Use getLogo method to add images to the belt children
			var logo1:TouchSprite = getLogo("gwLogo.png");			
			xLockBelt.addChild(logo1);	
		
			var logo2:TouchSprite = getLogo("gwLogo1.png");					
			yLockBelt.addChild(logo2);		
			
			// Add a touch enabled frame to the parent containers
			var xFrame_width:int = 40;
			var xFrame:TouchSprite = new TouchSprite();
			xFrame.graphics.lineStyle(xFrame_width, 0x6666CC, 0.6);
			xFrame.graphics.drawRect( -xFrame_width/2, -xFrame_width/2, 200+xFrame_width, 200+xFrame_width); 
			xLockContainer.addChild(xFrame)		
			
			var yFrame_width:int = 40;
			var yFrame:TouchSprite = new TouchSprite();
			yFrame.graphics.lineStyle(yFrame_width, 0x6666CC, 0.6);
			yFrame.graphics.drawRect( -yFrame_width/2, -yFrame_width/2, 200+yFrame_width, 200+yFrame_width);
			yLockContainer.addChild(yFrame)	
		}
		
		private function getLogo(img:String):TouchSprite {
			var logo:TouchSprite = new TouchSprite();
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../../assets/" + img));
			logo.scale = 0.5;
			logo.addChild(loader);
			return logo;
		}	
		
	}
	
}