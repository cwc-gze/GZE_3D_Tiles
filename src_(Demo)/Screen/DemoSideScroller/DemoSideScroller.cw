package  { 
	
	import GZ.Gfx.Object;
	import GZ.Sys.Interface.Context;
	import GZ.File.RcImgSequence;
	import GZ.File.RcImg;
	import GZ.File.RcAtlas;
	import GZ.File.Resource;
	import GZ.File.RcText;
	import GZ.Gfx.Root;
	import GZ.Gfx.Clip.Img;
	
	import GZ.Sys.Interface.Interface;
	import GZ.Gfx.Clip;

	import GZ.Base.Math.Math;
	import GZ.Input.Key;
	
	import GZ.Gfx.MovieClip;
	import GZ.Gfx.Tile.LayerClip;
	import Demo.Screen.DemoSideScroller.Perso;
	
	import GZ.Sff.Xml.Xml;
	import GZ.Sff.Xml.XmlNode;
	import GZ.Sff.Xml.XmlElement;
	import GZ.Sff.Xml.XmlText;
	
	import GZ.Sff.Tmx.Tmx;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Gfx.Tile.LayerData;
	import GZ.Gpu.ShaderModel.GzModel.GzShCommun.GzShCommun_Light;
	import GZ.Gfx.Effects.Light;
	import GZ.Gfx.Vector.Box;
	import GZ.Gfx.Vector.VectorShape;
	
	/**
	 * @author Maeiky
	 */	
	public class DemoSideScroller extends Clip {
		
		//use XmlNode.eType;

		public var oXml : Xml;
		public var oCurrNode : XmlNode;
		
	
		public var oTmx : Tmx;
		public var oLayerFront : LayerClip;
		public var oLayerWall : LayerClip;
		public var oLayerSide : LayerClip;
		public var oLayerFloor : LayerClip;

		
		public var oTexNormalLayer : RcImg;
		
		public var oBox : Box;
		public var oVectorShape : VectorShape;
				
		public var oPerso : Perso;

		public var oAtlas : RcAtlas;
				
		public var nTime : Int;
		
		public var oAtlasImg : Img;
		public var oLight : Light;

		public function DemoSideScroller( _oParent : Root ):Void {
			Clip(_oParent, 0.0, 0.0);
			

			oTmx = new Tmx(0);
			var _oRcTmx : RcText = new  RcText("Exe|Rc/Tiled/MyFirstTiles.tmx");
			
					
			Debug.fTrace("RcImgSequence --- ");
			var _oRc : RcImgSequence = new  RcImgSequence("Exe|Rc/Sprite/MegaSam/Walk/Walk0001.png"); //Walk0001.png
		
		//	_oRc.fCpuLoad();
			Debug.fTrace("RcImgSequence2 --- ");
		
		
			oAtlas = new RcAtlas(256);
			oAtlas.fAddSequence(_oRc);

			oAtlas.fPack();
			//oAtlas.fCpuLoad();
			
			
			
	oAtlas.fTransposeAll();		
		
	if(Context.oItf.bGpuDraw){
		oAtlas.fSetGpuTexLayer(Attribute_Quad.oTexSprites);
		oAtlas.fGpuLoad();
		
		Debug.fTrace("AtlasSpriteLayer: " + Attribute_Quad.oTexSprites.nSlot);
	}

//	oAtlasImg  = new Img(this, 0, 0,  oAtlas, false);
	
	
	
	


		
			/*
			oTexNormalLayer = new RcImg("Exe|Rc/Tiled/MetroidLike/testBump.png");
			oTexNormalLayer.fSetGpuTexLayer(Attribute_Quad.oTexNormal);
			oTexNormalLayer.fCpuLoad();
			if(Context.oItf.bGpuDraw){
				oTexNormalLayer.fGpuLoad();
			}
			*/


		
			if(oTmx.fLoad(_oRcTmx)){
				Debug.fWarning("Laoded!!!!!!!!!!!!!");
				Debug.fWarning("Nb Layer : " + oTmx.oMainMap.aLayer.nSize);
			//	Debug.fWarning("Nb Layer : " + oTmx.oMainMap.aLayer[1].sName);
				//TODO if loaded!
			
				if(oTmx.oMainMap.aLayer.nSize > 3){
					oLayerWall = new LayerClip(this, oTmx.oMainMap.aLayer[1], 0, 0);
					
					oLayerFloor = new LayerClip(this, oTmx.oMainMap.aLayer[3], 0, 0, Floor);
					oLayerSide = new LayerClip(this, oTmx.oMainMap.aLayer[2], 0, 0, SideWall);
					//oLayerFloor.vRot.nPitch =  1.5708;
					//oLayerFloor.vPos.nY =  32 * 10;
			
				}
				
				oLayerFront = new LayerClip(this, oTmx.oMainMap.aLayer[0], 0, 0);
				oLayerFront.vPos.nZ = -32;
			}
			
			
			Debug.fTrace("Finish laoded!");

			//oLight = new Light(50, 50, 50);
			
				oPerso = new Perso(this, 300.0, 288.0);
				oPerso.fAddSequence( _oRc, 0, 0, true);
				oPerso.vPos.nZ = -16;
		

				
			//oBox = new Box( 0,0,  50,50,    50);
			//oVectorShape = new VectorShape(this,  10);
				
			//EnYaw(5);
			//EnPitch(5);
			
				oAtlasImg  = new Img(this, 300, 450,  oAtlas, true,0 ,0, false);
				oAtlasImg.vPos.nZ = 0;
			
			
		}

		
		override public function fUpdateParentToChild():Void {
			/*
			nTime++;
			
			if(nTime == 5){
				TnYaw(3.1416/2.0);
			}
			
			if(nTime == 3000){
				TnYaw(0);
				nTime = 0;
			}*/
			
			vPos.nX = 80;
			vPos.nY = 50;
			
			var _nMouseX : Float = Context.nMouseX - oItf.nHalfFrameWidth;
			var _nMouseY : Float = Context.nMouseY - oItf.nHalfFrameHeight;

			//!Updated each frame, parents before
		//	vRot.nYaw = _nMouseX / oItf.nHalfFrameWidth / -1.15;
		//	vRot.nPitch = _nMouseY / oItf.nHalfFrameHeight / -1.15;
			vRot.fSetSpeed(3);
			vRot.nYaw.fTo( _nMouseX / oItf.nHalfFrameWidth / -1.15);
			vRot.nPitch.fTo(  _nMouseY / oItf.nHalfFrameHeight / -1.15);
			
		}
		


		
		
	}
}