 package
 {
    import com.gestureworks.core.GestureWorks;
    import flash.text.TextField;
    public class Main extends GestureWorks
    {
        public function Main():void
        {
            super();
        }
 
        override protected function gestureworksInit():void
        {
            var txt:TextField = new TextField;
            txt.text ="Hello World";
            addChild(txt);
        }
    }
 }