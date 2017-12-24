/*




*/
package org.lucciframework.luccimvc.view
{
	import flash.utils.Dictionary;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import org.lucciframework.luccimvc.core.Core;
	import org.lucciframework.luccimvc.view.mediator.IMediator;

	/**
	 * Cette classe est un multiton
	 * La Vue est le 2ème pilier du modèle MVC
	 * Elle permet de gérer la liste des vues
	 */
	public class View extends Core implements IView
	{
		
		private static const logger:ILogger = Log.getLogger("org.lucciframework.luccimvc.view.View");
		
		/**
		 * Constructeur.
		 */
		public function View( facadeRef : String )
		{
			this.facadeRef = facadeRef;
		}
		
		/**
		 * Donnes une instance de la vue pour une facade donnée
		 */
		public static function getInstance ( facadeRef : String ): IView {
			
			if ( viewMap [ facadeRef ] == null )
				viewMap [ facadeRef ] = new View ( facadeRef );
			
			return viewMap [ facadeRef ];
		}
		
		private static var _viewMap : Dictionary = new Dictionary ();
		
		/**
		 * Permet de supprimer la référence d'une view.
		 */
		public static function removeView( facadeRef:String ):void
		{
			delete viewMap [ facadeRef ];	
			
			logger.info("remove view on facade reference: " + facadeRef);
		}
		
		/**
		 * GET La liste des views associé à la référence d'une façade
		 */
		public static function get viewMap () : Dictionary {
			return _viewMap;
		}
		
		/**
		 * SET La liste des views associé à la référence d'une façade
		 */
		public static function set viewMap ( value : Dictionary ) : void {
			_viewMap = value;	
		}
		

		/**
		 * 
		 **/
		
		public function getMediator( mediatorName : String ) : IMediator {
			return mediatorMap[ mediatorName ];
		}
		
		public function addMediator ( mediator : IMediator ) : void {
			
			mediator.facadeRef = this.facadeRef ;
			mediatorMap [ mediator.mediatorName ] = mediator;
		}
		
		public function removeMediator ( mediatorName : String ) : void {
			delete mediatorMap [ mediatorName ];
		}
		
		public function hasMediator( mediatorName:String ) : Boolean
		{
			return mediatorMap[ mediatorName ] != null;
		}
		
		
		private static var _mediatorMap : Dictionary = new Dictionary ();
		
		protected static function get mediatorMap () : Dictionary {
			return _mediatorMap;
		}
		
		protected static function set mediatorMap ( value:Dictionary ) : void {
			_mediatorMap = value;	
		}
		
	}
}