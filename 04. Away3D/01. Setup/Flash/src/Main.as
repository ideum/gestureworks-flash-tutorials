package {
	import com.gestureworks.away3d.TouchManager3D;
	import com.gestureworks.cml.core.CMLAway3D;	
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	// load Away3D classes
	CMLAway3D;	
	
	[SWF(width = "1920", height = "1080", backgroundColor = "0x000000", frameRate = "60")]
	
	public class Main extends GestureWorks {		
		
		public function Main() { 		
			super();
			TouchManager3D.initialize(); // TouchManager3D must be initialized			
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);			
			gml = "gestures.gml";
			cml = "main.cml";
		}
	
		override protected function gestureworksInit():void {
			trace("gestureWorksInit()");
		}
		
		private function cmlInit(e:Event):void {
			trace("cmlInit()");
		}
		
	}
}