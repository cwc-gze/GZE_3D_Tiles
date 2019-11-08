package  {

	//import GZ.Sys.Window;
	//import GZ.GFX.Attribute;
	import GZ.Gfx.MovieClip;
	import GZ.Gfx.Root;
	import GZ.Input.Key;

	/**
	 * @author Maeiky
	 */

	public class Perso extends MovieClip {

		use Key.eKey;

		public var nSpeed : Float = 3;

		public function Perso( _oParent : Root, _nX: Float, _nY:Float):Void {
			MovieClip(_oParent, _nX , _nY);
		}



		override public function fUpdateParentToChild():Void {
		
		//	vPos.fSetSpeed(10);
		//	vPos.fSetLimit(99900);
		
		

			if(Key.fIsDown(Right)){ 
				vPos.nX = vPos.nX + nSpeed;
			//	MnX(nSpeed);
			//	TnWidth(1);
			}
			
			if(Key.fIsDown(Left)){ 
				//MnX(nSpeed * -1);
			//	TnWidth(-1);
			}


			fUpdateSequence();
			
			
		}





	}
}
