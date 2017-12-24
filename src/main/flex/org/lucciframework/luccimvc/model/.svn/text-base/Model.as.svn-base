/*




*/
package org.lucciframework.luccimvc.model
{
	
	import flash.utils.Dictionary;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import org.lucciframework.luccimvc.core.Core;
	import org.lucciframework.luccimvc.model.presenationModel.IPresentationModel;
	
	/**
	 * Le model est aussi un multiton 
	 * Elle permet de référence la liste des presentationModels associée
	 * à la façade
	 */

	public class Model extends Core implements IModel
	{
		
		private static const logger:ILogger = Log.getLogger("org.lucciframework.luccimvc.model.Model");
		
		/**
		 * Constructeur.
		 */
		public function Model( facadeRef : String )
		{
			this.facadeRef = facadeRef;
		}
		
		/**
		 * Donnes une instance du model. 
		 */
		public static function getInstance ( facadeRef : String ): IModel {
			
			if ( modelMap [ facadeRef ] == null )
				modelMap [ facadeRef ] = new Model ( facadeRef );
			
			return modelMap [ facadeRef ];
		}
		
		private static var _modelMap : Dictionary = new Dictionary ();
		
		/**
		 * Permet de supprimer la référence d'un Model.
		 */
		public static function removeModel( facadeRef:String ):void
		{
			delete modelMap [ facadeRef ];	
			
			logger.info("remove model on facade reference: " + facadeRef);
		}
		
		/**
		 * GET la liste des models référencés
		 */
		public static function get modelMap () : Dictionary {
			return _modelMap;
		}
		
		/**
		 * SET la liste des models référencés
		 */
		public static function set modelMap ( value : Dictionary ) : void {
			_modelMap = value;	
		}
		
		/**
		 * récupère le presentationModel
		 * @param presentationModelName
		 */
		public function getPresentationModel( presentationModelName : String ) : IPresentationModel {
			return presentationModelMap[ presentationModelName ];
		}
		
		/**
		 * Ajoute un presentationModel
		 */
		public function addPresentationModel ( presentationModelClass : Class , presentationModelName : String ) : void {
			
			var presentationModelToInitialise : Class = presentationModelClass;
			
			var presentationModel : IPresentationModel = new presentationModelToInitialise();
			
			presentationModel.presentationModelName = presentationModelName;
			presentationModel.facadeRef = this.facadeRef;
			
			presentationModelMap [ presentationModel.presentationModelName ] = presentationModel;
		}
		
		/**
		 * Supprime un presentationModel
		 */
		public function removePresentationModel ( presentationModelName : String ) : void {
			delete presentationModelMap [ presentationModelName ];
		}
		
		/**
		 * @return true si le presentationModel existe
		 */
		public function hasPresentationModel( presentationModelName:String ) : Boolean
		{
			return presentationModelMap[ presentationModelName ] != null;
		}
		
	
		private static var _presentationModelMap : Dictionary = new Dictionary ();
		
		/**
		 * GET la liste des presentaitonModels référencés
		 */
		public static function get presentationModelMap () : Dictionary {
			return _presentationModelMap;
		}
		
		/**
		 * SET la liste des presentaitonModels référencés
		 */
		public static function set presentationModelMap ( value : Dictionary ) : void {
			_presentationModelMap = value;	
		}
		
	}
}