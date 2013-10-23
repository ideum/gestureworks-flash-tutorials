package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
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
			parent1.x = 100;
			parent1.y = 50;
			parent1.graphics.beginFill(0xCCCCCC);
			parent1.graphics.drawRect(0, 0, 300, 300);
			parent1.mouseChildren = true;
			parent1.nativeTransform = true;
			parent1.gestureList = { "n-drag":true };
			addChild(parent1);
			
			var child1:TouchSprite = new TouchSprite();
			child1.graphics.beginFill(0xFF0000);
			child1.graphics.drawRect(50, 50, 200, 200);
			child1.nativeTransform = true;
			child1.gestureList = { "n-drag":true };
			parent1.addChild(child1);	
			
			//create parent/child pair with parent targetting
			var parent2:TouchSprite = new TouchSprite();
			parent2.x = 100;
			parent2.y = 400;
			parent2.graphics.beginFill(0xCCCCCC);
			parent2.graphics.drawRect(0, 0, 300, 300);
			parent2.mouseChildren = true;
			parent2.nativeTransform = true;
			parent2.gestureList = { "n-drag":true };
			addChild(parent2);
			
			var child2:TouchSprite = new TouchSprite();
			child2.graphics.beginFill(0xFFFFFF);
			child2.graphics.drawRect(50, 50, 200, 200);
			child2.nativeTransform = true;
			child2.gestureList = { "n-drag":true };
			child2.targetParent = true;   //enable parent targeting
			parent2.addChild(child2);			
			
		}
	
	}

}