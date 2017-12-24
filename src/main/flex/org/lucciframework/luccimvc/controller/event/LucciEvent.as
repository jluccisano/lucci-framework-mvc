/*



 */
package org.lucciframework.luccimvc.controller.event
{
	import flash.events.Event;
	
	import mx.utils.UIDUtil;

	/**
	 * Cette permet de
	 * @see
	 */

	public class LucciEvent extends Event
	{
		
		private var _eventID:String;
		
		/**
		 * La propriété data permet de passer en paramètres les données à traiter.
		 */
		private var _data:*;

		/**
		 * La propriété notificationType permet de passer en paramètre
		 * le type d'événement d'acquittement
		 */
		private var _notificationType:String;


		/**
		 * @param type
		 * @param data
		 * @param notificationType
		 * @param bubbles
		 * @param cancelable
		 */
		public function LucciEvent(type:String, data:*=null,eventID:String=null, notificationType:String=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);

			_data=data;
			_notificationType=notificationType;
			
			if(eventID == null) {
				_eventID = UIDUtil.createUID();
			} else {
				_eventID = eventID;
			}
			
			

		}

		/**
		 * Dispatch l'événement en utilisant le LucciEventDispatcher.
		 */
		public function dispatch():Boolean
		{
			return LucciEventDispatcher.instance.dispatchEvent(this);
		}

		/**
		 * Get la propriété data.
		 */
		public function get data():*
		{
			return _data;
		}

		/**
		 * Set la propriété data.
		 */
		public function set data(value:*):void
		{
			_data=value;
		}

		/**
		 * Get la propriété notificationType.
		 */
		public function get notificationType():String
		{
			return _notificationType;
		}

		/**
		 * Set la propriété notificationType.
		 */
		public function set notificationType(value:String):void
		{
			_notificationType=value;
		}
		
		public function get eventID():String
		{
			return _eventID;
		}
		
		public function set eventID(value:String):void
		{
			_eventID = value;
		}
		
		

	}
}