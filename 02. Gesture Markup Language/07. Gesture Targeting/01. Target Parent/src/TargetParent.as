package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class TargetParent extends GestureWorks
	{
		public function TargetParent():void
		{
			gml = "target-parent.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");

			//create parent/child pair without parent targeting
			var parent1:TouchSprite = new TouchSprite();
			parent1.graphics.lineStyle(4, 0x3333);
			parent1.graphics.beginFill(0x999999);
			parent1.graphics.drawRect(0, 0, 300, 300);
			parent1.x = 100;
			parent1.y = 50;			
			addChild(parent1);			
			parent1.mouseChildren = true;
			parent1.gestureList = { "n-drag":true };			
			parent1.nativeTransform = true;						
			
			var child1:TouchSprite = new TouchSprite();
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../assets/gwLogo.png"));
			child1.addChild(loader);			
			child1.scale = .5;
			child1.x = 50;			
			child1.y = 50;
			parent1.addChild(child1);			
			child1.gestureList = { "n-drag":true };	
			child1.nativeTransform = true;			
			
			//create parent/child pair with parent targetting
			var parent2:TouchSprite = new TouchSprite();
			parent2.graphics.lineStyle(4, 0x3333);
			parent2.graphics.beginFill(0x999999);
			parent2.graphics.drawRect(0, 0, 300, 300);
			parent2.x = 100;
			parent2.y = 400;				
			addChild(parent2);			
			parent2.mouseChildren = true;			
			parent2.gestureList = { "n-drag":true };		
			parent2.nativeTransform = true;			

			var child2:TouchSprite = new TouchSprite();
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../assets/gwLogo1.png"));
			child2.addChild(loader);						
			child2.scale = .5;
			child2.x = 50;
			child2.y = 50;
			parent2.addChild(child2);					
			child2.gestureList = { "n-drag":true };
			child2.targetParent = true;    //transfer touch points to parent						
			child2.nativeTransform = true;			
		}
	
	}

}