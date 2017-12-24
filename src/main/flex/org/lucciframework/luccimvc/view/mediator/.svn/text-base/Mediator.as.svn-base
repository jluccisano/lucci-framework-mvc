/*



*/
package org.lucciframework.luccimvc.view.mediator
{
	
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;
	
	import mx.core.IMXMLObject;
	
	import org.lucciframework.luccimvc.controller.event.LucciEvent;
	import org.lucciframework.luccimvc.controller.event.LucciEventDispatcher;
	import org.lucciframework.luccimvc.core.Core;
	import org.lucciframework.luccimvc.view.View;

	/**
	 * Le mediator est associé à une ou plusieurs composant graphique.
	 * Il permet de séparer les traitements dans une vue. Ainsi aucun
	 * traitement n'est réalisé dans un composant graphique son rôle 
	 * étant comme son nom l'indique de faire du graphique. Tous les 
	 * appels au traitements sont délégués au mediator où l'IHM s'est
	 * enregistrer.
	 * 
	 * Le mediator a pour rôle de dispatcher les événements que l'IHM
	 * a besoin. Il permet de récupérer les notifications et de mettre
	 * des éléments de l'IHM.
	 * 
	 * Le mediator implement IMXMLObject parce qu'il permet  d'être 
	 * instancié à l'aide du langage MXML. Il vous suffit d'ajouter
	 * la balise dans l'IHM que vous voulez que le mediator soit 
	 * associé et lui s'enregistre auprès de la vue.
	 */
	public class Mediator extends Core implements IMediator, IMXMLObject
	{
		/**
		 * Contstructeur.
		 */
		public function Mediator() 
		{	
			viewComponentMap = new Dictionary ();
		}
		
		/**
		 * Permet d'enrgistrer le mediator auprès de la view associé
		 * à une référence de façade.
		 */
		public function registerMediator ( ) : void 
		{
			View.getInstance( facadeRef ).addMediator( this );
		}

/*		private function handleNotification ( lucciEvent : LucciEvent ) : void 
		{
			LucciEventDispatcher.instance.removeEventListener( 
				lucciEvent.type , handleNotification );
			
			onResultNotification( lucciEvent );
		}*/
		
		
/*		public function dipatchNewEvent ( lucciEvent : LucciEvent ) : void
		{
			if (lucciEvent.notificationType != null)
				LucciEventDispatcher.instance.addEventListener( 
								lucciEvent.notificationType , onResultNotification );
			
			lucciEvent.dispatch();
		}*/
	
		
		/**
		 * 
		 * 
		 * 
		 * 
		 * 
		 **/
	
		
		private var _mediatorName : String;
		
		public function get mediatorName () : String 
		{
			return _mediatorName;
		}
		
		public function set mediatorName ( value : String ) : void 
		{
			_mediatorName = value;
		}
		
		private var _viewComponentMap : Dictionary;

		public function get viewComponentMap():Dictionary
		{
			return _viewComponentMap;
		}

		public function set viewComponentMap(value:Dictionary):void
		{
			_viewComponentMap = value;
		}
			
		public function getViewComponent ( name : String ) : DisplayObject 
		{	
			return _viewComponentMap[name];
		}
		
		private var _components : Array;

		public function get components():Array
		{
			return _components;
		}

		public function set components(value:Array):void
		{
			_components = value;
		}
		
		
		public function initialized( document : Object, id : String ) : void {
						
			registerMediator ();
			
			for each ( var component : RegisterViewComponent in components ) 
			{	
				viewComponentMap [ component.viewComponentName ] = component.viewComponent;
			}
			
		}
		
		public function onResult(lucciEvent:LucciEvent):void {
			
		}
		
	}
}