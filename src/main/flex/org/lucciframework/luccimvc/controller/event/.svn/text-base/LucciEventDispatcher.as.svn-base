/*




 */
package org.lucciframework.luccimvc.controller.event
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * Cette classe est un Singleton qui permet de dispatcher les évenements
	 */

	public class LucciEventDispatcher
	{

		private static var _instance:LucciEventDispatcher;

		private var eventDispatcher:IEventDispatcher;

		/**
		 * Permet d'obtenir une instance de LucciEventDispatcher.
		 */
		public static function get instance():LucciEventDispatcher
		{

			if (_instance == null)
				_instance=new LucciEventDispatcher();

			return _instance;
		}

		/**
		 * Constructeur.
		 */
		public function LucciEventDispatcher(target:IEventDispatcher=null)
		{
			eventDispatcher=new EventDispatcher(target);
		}

		/**
		 * Ajoute un écouteur.
		 */
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}

		/**
		 * Supprime un écouteur.
		 */
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			eventDispatcher.removeEventListener(type, listener, useCapture);
		}

		/**
		 * Dispatch un événement de type LucciEvent.
		 */
		public function dispatchEvent(event:LucciEvent):Boolean
		{
			return eventDispatcher.dispatchEvent(event);
		}

		/**
		 * @return true si le listener existe.
		 */
		public function hasEventListener(type:String):Boolean
		{
			return eventDispatcher.hasEventListener(type);
		}

		/**
		 * @return true si l'événement va être déclenché.
		 */
		public function willTrigger(type:String):Boolean
		{
			return eventDispatcher.willTrigger(type);
		}
	}
}