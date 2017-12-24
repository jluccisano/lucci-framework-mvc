/*




*/
package org.lucciframework.luccimvc.controller.command
{
	import org.lucciframework.luccimvc.controller.event.LucciEvent;
	import org.lucciframework.luccimvc.core.ICore;
	

	/**
	 * Cette interface permet d'avoir un contrat avec l'utilisation
	 * d'une commande, cela permet d'éxécuter le traitement.
	 */
	
	public interface ICommand extends ICore
	{

		/**
		 * @private
		 */
		function executeCommand( event : LucciEvent ) : void ;
			
	}
}