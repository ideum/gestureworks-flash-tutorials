package 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
		
	public class NestedTransform extends GestureWorks
	{
		
		public function NestedTransform():void
		{
			gml = "nested-transform.gml";
		}
		
		override protected function gestureworksInit():void
		{							
			//bottom container
			var b_container:TouchSprite = new TouchSprite()	
			b_container.graphics.beginFill(0x222222,1);
			b_container.graphics.drawRect(0, 0, 1200, 800);
			b_container.x = 500;
			b_container.y = 150;
			b_container.scaleX = 0.4;
			b_container.scaleY = 0.4;
			b_container.rotation = 20;
			b_container.mouseChildren = true;
			b_container.nativeTransform = true			
			b_container.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true};			
			addChild(b_container);	
				
			//bottom frame
			var b_frame:TouchSprite = new TouchSprite()
			b_frame.graphics.lineStyle(80,0x555555,1);
			b_frame.graphics.drawRect( -25, -25, 1250, 850);				
			b_frame.mouseChildren = false; 
			b_frame.targetParent = true; 				
			b_container.addChild(b_frame);
				
			
			//middle container
			var m_container:TouchSprite = new TouchSprite()	
			m_container.graphics.beginFill(0x222222,1);
			m_container.graphics.drawRect(0, 0, 1200, 800);
			m_container.scaleX = 0.6;
			m_container.scaleY = 0.6;
			m_container.rotation = 20;
			m_container.mouseChildren = true;
			m_container.nativeTransform = true				
			m_container.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true };					
			b_container.addChild(m_container);	
		
			//middle frame
			var m_frame:TouchSprite = new TouchSprite()
			m_frame.graphics.lineStyle(80,0x555555,1);
			m_frame.graphics.drawRect( -25, -25, 1250, 850);				
			m_frame.mouseChildren = false; 
			m_frame.targetParent = true; 				
			m_container.addChild(m_frame);
			
			
			//top container
			var t_container:TouchSprite = new TouchSprite()					
			t_container.graphics.beginFill(0x222222,1);
			t_container.graphics.drawRect(0, 0, 1200, 800);			
			t_container.scaleX = 0.4;
			t_container.scaleY = 0.4;
			t_container.x = 200;
			t_container.y = 200;
			t_container.mouseChildren = true;
			t_container.nativeTransform = true
			t_container.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true};					
			m_container.addChild(t_container);						
				
			//top frame
			var t_frame:TouchSprite = new TouchSprite()
			t_frame.graphics.lineStyle(120,0x555555,1);
			t_frame.graphics.drawRect( -25, -25, 1250, 850);				
			t_frame.mouseChildren = false; 
			t_frame.targetParent = true; 				
			t_container.addChild(t_frame);
			
			//logo
			var logo:TouchSprite = new TouchSprite();
			var loader:Loader = new Loader();
			loader.load(new URLRequest("../../../assets/gwLogo.png"));
			logo.addChild(loader);
			logo.nativeTransform = true;
			logo.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true};								
			t_container.addChild(logo);									
		}
		
		
	}
}