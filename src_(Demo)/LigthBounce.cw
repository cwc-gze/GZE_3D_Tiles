package  {


	import GZ.Gfx.Effects.Light;
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Light;
	import GZ.Gfx.Clip;
	
	/**
	 * @author Maeiky
	 */

	public class LigthBounce  extends Clip {

	
		public var oLight : Light;
		public var nIndex : UInt;
			
		public function LigthBounce(_nIndex:Int):Void {
			Clip(parent, 100 , 100);
		
			
		
			oLight  = new Light(50 + 100 * _nIndex, 100.0 * _nIndex, -100.0 - 15);
			nIndex  = GzShCommun_Light.fAddLight();

			oLight.vColor.nAlpha = 0.000;
			Debug.fTrace("NewLight : " + nIndex);
			
		}
		

		override public function fUpdateParentToChild():Void {
			vPos.nY = vPos.nY + 3;
			if(vPos.nY > 700 + 600){ //600 = Height frame
				vPos.nY = -700;
			}
				
			GzShCommun_Light.fUpdateLight(nIndex, oLight);
		}





	}
}
