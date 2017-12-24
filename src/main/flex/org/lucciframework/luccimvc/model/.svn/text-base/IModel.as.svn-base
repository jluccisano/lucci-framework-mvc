/*




*/
package org.lucciframework.luccimvc.model
{
	import org.lucciframework.luccimvc.core.ICore;
	import org.lucciframework.luccimvc.model.presenationModel.IPresentationModel;

	/**
	 * Cette interface permet de satisfaire le contrat pour l'utilisation
	 * d'un model
	 */
	public interface IModel extends ICore
	{
		
		/**
		 * Supprime un presentationModel
		 */
		function removePresentationModel ( presentationModelName : String ) : void;

		/**
		 * @return true si le presentationModel existe
		 */
		function hasPresentationModel( presentationModelName:String ) : Boolean;
		
		/**
		 * récupère le presentationModel
		 * @param presentationModelName
		 */
		function getPresentationModel( presentationModelName : String ) : IPresentationModel;
		
		/**
		 * Ajoute un presentationModel
		 */
		function addPresentationModel ( presentationModelClass : Class, presentationModelName : String ) : void;
	}
}