/*


*/
package org.lucciframework.luccimvc.controller.command
{
	import mx.core.IMXMLObject;
	
	/**
	 * Permet d'enregistrer une commande à l'aide de MXML ce qui permet de 
	 * réduire le code, le nombre de classe et plus lisible.
	 */
	
	public class RegisterCommand implements IMXMLObject
	{
		
		[Inspectable(type="String")] 
		
		/**
		 * Le type de l'événement déclancheur de la commande.
		 */
		private var _eventType : String;
		
		/**
		 * Get la propriété eventType.
		 */
		public function get eventType() : String
		{
			return _eventType;
		}
		
		/**
		 * Set la propriété eventType.
		 */
		public function set eventType( value : String ) : void
		{
			_eventType = value;
		}
		
		[Inspectable(type="Class")] 
		
		/**
		 * Le type de la class de la commande qui devra être instancié.
		 */
		private var _commandClass : Class;
		
		/**
		 * Get la propriété commandClass.
		 */
		public function get commandClass() : Class
		{
			return _commandClass;
		}
		
		/**
		 * Set la propriété commandClass.
		 */
		public function set commandClass( value : Class ) : void
		{
			_commandClass = value;
		}
		
			
		/**
		 * @private
		 */
		public function initialized( document : Object, id : String ) : void {
			
			/*if( _eventType == null ) 
				throw new LucciFrameworkMVCError ( LucciMessageCodes.PROPERTY_NULL , "eventType");
			
			if ( _commandClass == null)
				throw new LucciFrameworkMVCError ( LucciMessageCodes.PROPERTY_NULL , "commandClass");*/
		}
	}
}