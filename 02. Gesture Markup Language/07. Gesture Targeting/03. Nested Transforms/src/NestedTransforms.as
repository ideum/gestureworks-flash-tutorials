package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "60")]

	public class NestedTransforms extends GestureWorks
	{
		
		public function NestedTransforms():void 
		{
			super();
			gml = "manipulate.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//create the root parent touch container
			var parent:TouchSprite = new TouchSprite();
			
			// add a bitmap image to the touch sprite
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../../assets/gwLogo.png"));

			parent.addChild(loader);
			// center graphic in the middle of the stage
			
			parent.x = stage.stageWidth / 2 - 200;
			parent.y = stage.stageHeight / 2 - 200;
			
			//allow children to recieve touch events
			parent.mouseChildren = true;
			
			// enable gestures 
			parent.gestureList = { "manipulate": true };
			
			//enable native transformations
			parent.nativeTransform = true;
			
			addChild(parent);
			//-------------------------------------------------------
			
			//create child of root parent touch container
			var child:TouchSprite = new TouchSprite();
			
			// add a bitmap image to the touch sprite
			var loader2:Loader = new Loader();
			loader2.load(new URLRequest("../../../../assets/gwLogo1.png"));
			child.addChild(loader2);
			
			//enable native transformations
			child.nativeTransform = true;
			
			//allow children to recieve touch events
			child.mouseChildren = true;
			
			// enable gestures 
			child.gestureList = { "manipulate": true };
			
			// center graphic in the middle of the stage
			child.scale = .8;
			
			parent.addChild(child);
			
			//-------------------------------------------------------
			
			//create the grandchild of root touch container
			var grandchild:TouchSprite = new TouchSprite();
			
			// add a bitmap image to the touch sprite
			var loader3:Loader = new Loader();
			loader3.load(new URLRequest("../../../../assets/gwLogo2.png"));
			grandchild.addChild(loader3);
			
			//allow children to recieve touch events
			grandchild.mouseChildren = true;
			
			// enable gestures 
			grandchild.gestureList = { "manipulate": true };
			
			//enable native transformations
			grandchild.nativeTransform = true;

			// center graphic in the middle of the stage
			grandchild.scale = .6;

			child.addChild(grandchild);
		}
		
	}
	
}