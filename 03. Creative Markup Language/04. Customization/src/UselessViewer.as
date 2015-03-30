package  
{
	import com.gestureworks.cml.components.Component;
	import com.gestureworks.cml.elements.*;
	import com.gestureworks.cml.events.*;
	import com.gestureworks.cml.layouts.Layout;
	
	public class UselessViewer extends Component 
	{		
		/**
		 * useless viewer Constructor
		 */
		public function UselessViewer() 
		{
			super();
			mouseChildren = true;
			nativeTransform = true;
			affineTransform = false;			
		}
				
		private var _useless:*;
		
		public function get useless():* {return _useless}
		public function set useless(value:*):void 
		{
			if (!value) return;
			_useless = value;
		}			
	
		/**
		 * Initialization function
		 */
		override public function init():void 
		{	
			// automatically try to find elements based on AS3 class
			if (!useless)
				useless = searchChildren(UselessElement);
			
			if (useless)
				useless.addEventListener(StateEvent.CHANGE, uselessComplete);
			
			super.init();	
		}
		
		private function uselessComplete(e:StateEvent):void {
			trace("The useless machine has done its job.");
		}	
		
		
		
		/**
		 * Dispose method to nullify the attributes and remove listener
		 */
		override public function dispose():void 
		{
			super.dispose();
			useless = null;
		}
		
	}
	
}