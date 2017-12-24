/*


*/
package org.lucciframework.luccimvc.controller
{
	import org.lucciframework.luccimvc.core.ICore;

	/**
	 * Cette interface permet d'avoir un contrat avec l'utilisation
	 * du contrôleur.
	 */
	public interface IController extends ICore
	{
		/**
		 * Permet d'ajouter une commande
		 * 
		 * @param commandName le nom de la commande est
		 * relatif au nom de l'événement dont la commande est associé
		 */
		function addCommand( commandName : String, commandRef : Class, useWeakReference : Boolean = true ) : void;
		
		/**
		 * Permet de supprimer une commande
		 */
		function removeCommand( commandName : String ) : void;
			
		/**
		 * @return true si la command est référencé.
		 */
		function hasCommand( commandName:String ) : Boolean;
	}
}