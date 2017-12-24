package org.lucciframework.luccimvc.facade {
    import flash.utils.Dictionary;

    import mx.core.IMXMLObject;
    import mx.logging.ILogger;
    import mx.logging.Log;

    import org.lucciframework.luccimvc.business.IServices;
    import org.lucciframework.luccimvc.business.RegisterService;
    import org.lucciframework.luccimvc.business.Services;
    import org.lucciframework.luccimvc.controller.Controller;
    import org.lucciframework.luccimvc.controller.IController;
    import org.lucciframework.luccimvc.controller.command.RegisterCommand;
    import org.lucciframework.luccimvc.core.Core;
    import org.lucciframework.luccimvc.error.LucciFrameworkMVCError;
    import org.lucciframework.luccimvc.error.LucciMessageCodes;
    import org.lucciframework.luccimvc.logging.LucciMVCLogging;
    import org.lucciframework.luccimvc.model.IModel;
    import org.lucciframework.luccimvc.model.Model;
    import org.lucciframework.luccimvc.model.presenationModel.RegisterPresentationModel;
    import org.lucciframework.luccimvc.view.IView;
    import org.lucciframework.luccimvc.view.View;
    import org.lucciframework.luccimvc.view.mediator.IMediator;
    import org.lucciframework.luccimvc.view.mediator.RegisterMediator;

    public class Facade extends Core implements IFacade, IMXMLObject {
        private var _model : IModel;
        private var _view : IView;
        private var _controller : IController;

        private static const logger : ILogger = Log.getLogger("org.lucciframework.facade.Facade");

        private static var _facadeMap : Dictionary = new Dictionary();

        public static function get facadeMap() : Dictionary {
            return _facadeMap;
        }

        public static function set facadeMap(value : Dictionary) : void {
            _facadeMap = value;
        }

        public static function getInstance(facadeRef : String) : IFacade {
            var _facade : IFacade = facadeMap[facadeRef] as IFacade;

            if (_facade == null) {
                throw new LucciFrameworkMVCError(LucciMessageCodes.FACADE_NOT_FOUND, facadeRef);
            }

            logger.info("get new facade instance with reference " + facadeRef);

            return _facade;
        }

        /**
         * Remove a Core.
         * <P>
         * Remove the Model, View, Controller and Facade
         * instances for the given key.</P>
         *
         * @param multitonKey of the Core to remove
         */
        public static function removeCore(facadeRef : String) : void {
            if (facadeMap[facadeRef] == null)
                return;
            Model.removeModel(facadeRef);
            View.removeView(facadeRef);
            Controller.removeController(facadeRef);
            Services.removeServices(facadeRef);
            delete facadeMap[facadeRef];
        }

        /**
         * Initialize Model
         */
        private function initModel() : void {
            if (_model == null) {
                _model = Model.getInstance(facadeRef);
                logger.info("Model with facade reference: " + facadeRef + " is initialized");
            } else {
                throw new LucciFrameworkMVCError(LucciMessageCodes.MODEL_ALREADY_INSTANCIATED, facadeRef);
            }

        }

        /**
         * Initialize View
         */
        private function initView() : void {
            if (_view == null) {
                _view = View.getInstance(facadeRef);
                logger.info("View with facade reference: " + facadeRef + " is initialized");
            } else {
                throw new LucciFrameworkMVCError(LucciMessageCodes.VIEW_ALREADY_INSTANCIATED, facadeRef);
            }
        }

        /**
         * Initialize Controller
         */
        private function initController() : void {
            if (_controller == null) {
                _controller = Controller.getInstance(facadeRef);
                logger.info("Controller with facade reference: " + facadeRef + " is initialized");
            } else {
                throw new LucciFrameworkMVCError(LucciMessageCodes.CONTROLLER_ALREADY_INSTANCIATED, facadeRef);
            }
        }

        /**
         * Model Management
         **/

        private var _presentationModels : Array

        public function get presentationModels() : Array {
            return presentationModels;
        }

        public function set presentationModels(value : Array) : void {
            _presentationModels = value;
        }

        public function addPresentationModel(presentationModel : Class, presentationModelName : String) : void {
            if (_model != null) {
                _model.addPresentationModel(presentationModel, presentationModelName);
                logger.info("add new presentation model: " + presentationModelName + " on facade reference: " +
                    facadeRef);
            } else {
                throw new LucciFrameworkMVCError(LucciMessageCodes.MODEL_NOT_INSTANCIATED, facadeRef);
            }

        }

        public function removePresentationModel(presentationModelName : String) : void {
            if (_model != null) {
                _model.removePresentationModel(presentationModelName);
                logger.info("remove presentation model: " + presentationModelName + " on facade reference: " +
                    facadeRef);
            } else {
                throw new LucciFrameworkMVCError(LucciMessageCodes.MODEL_NOT_INSTANCIATED, facadeRef);
            }
        }

        public function hasPresentationModel(presentationModelName : String) : Boolean {
            if (_model == null) {
                throw new LucciFrameworkMVCError(LucciMessageCodes.MODEL_NOT_INSTANCIATED, facadeRef);
            }
            return _model.hasPresentationModel(presentationModelName);
        }

        /**
         * View Management
         **/

        private var _mediators : Array;

        public function get mediators() : Array {
            return _mediators;
        }

        public function set mediators(value : Array) : void {
            _mediators = value;
        }

        public function addMediator(mediator : org.lucciframework.luccimvc.view.mediator.IMediator) : void {
            if (_view != null) {
                _view.addMediator(mediator);
                logger.info("add new mediator: " + mediator.mediatorName + " on facade reference: " + facadeRef);
            } else {
                throw new LucciFrameworkMVCError(LucciMessageCodes.VIEW_NOT_INSTANCIATED, facadeRef);
            }
        }

        public function getMediator(mediatorName : String) : org.lucciframework.luccimvc.view.mediator.IMediator {
            if (_view == null) {
                throw new LucciFrameworkMVCError(LucciMessageCodes.VIEW_NOT_INSTANCIATED, facadeRef);
            }
            logger.info("get mediator: " + mediatorName + " on facade reference: " + facadeRef);
            return _view.getMediator(mediatorName);
        }

        public function removeMediator(mediatorName : String) : void {
            if (_view != null) {
                _view.removeMediator(mediatorName);
                logger.info("remove mediator: " + mediatorName + " on facade reference: " + facadeRef);
            } else {
                throw new LucciFrameworkMVCError(LucciMessageCodes.VIEW_NOT_INSTANCIATED, facadeRef);
            }
        }

        public function hasMediator(mediatorName : String) : Boolean {
            if (_view == null) {
                throw new LucciFrameworkMVCError(LucciMessageCodes.VIEW_NOT_INSTANCIATED, facadeRef);
            }
            return _view.hasMediator(mediatorName);
        }


        /**
         * Controller Management
         **/

        private var _commands : Array;

        public function get commands() : Array {
            return _commands;
        }

        public function set commands(value : Array) : void {
            _commands = value;
        }

        public function addCommand(commandName : String, commandRef : Class, useWeakReference : Boolean = true) : void {
            if (_controller != null) {
                _controller.addCommand(commandName, commandRef, useWeakReference);
                logger.info("add new command: " + commandName + " on facade reference: " + facadeRef);
            } else {
                throw new LucciFrameworkMVCError(LucciMessageCodes.CONTROLLER_NOT_INSTANCIATED, facadeRef);
            }
        }

        public function removeCommand(commandName : String) : void {
            if (_controller != null) {
                _controller.removeCommand(commandName);
                logger.info("remove command: " + commandName + " on facade reference: " + facadeRef);
            } else {
                throw new LucciFrameworkMVCError(LucciMessageCodes.CONTROLLER_NOT_INSTANCIATED, facadeRef);
            }

        }

        public function hasCommand(commandName : String) : Boolean {
            if (_controller == null) {
                throw new LucciFrameworkMVCError(LucciMessageCodes.CONTROLLER_NOT_INSTANCIATED, facadeRef);
            }
            return _controller.hasCommand(commandName);
        }

        /**
         * Business Management
         */

        private var _services : Array;

        public function get services() : Array {
            return _services;
        }

        public function set services(value : Array) : void {
            _services = value;
        }

        /**
         * Logging Management
         */

        [Inspectable(defaultValue=false)]

        private var _debug : Boolean;

        public function get debug() : Boolean {
            return _debug;
        }

        public function set debug(value : Boolean) : void {
            _debug = value;
        }


        /**
         * Build The MVC context
         **/


        /*		private function implementsIServices(serviceClass:Class):Boolean
           {
           var classDescription:XML = describeType(serviceClass) as XML;

           return classDescription.factory.implementsInterface.(@type == getQualifiedClassName(IServices)).length() != 0;
         }*/

        public function initialized(document : Object, id : String) : void {
            if (facadeMap[facadeRef]) {
                throw new LucciFrameworkMVCError(LucciMessageCodes.FACADE_ALREADY_INSTANCIATED, facadeRef);
            }

            // Logging
            if (_debug)
                new LucciMVCLogging();

            // Initialize
            facadeMap[facadeRef] = this;

            initModel();
            initView();
            initController();

            // Build context from MXML

            // Register commands
            for each (var command : RegisterCommand in _commands) {
                addCommand(command.eventType, command.commandClass);
            }

            // Register services
            for each (var service : RegisterService in _services) {
                var serviceToInitialise : Class = service.serviceClass;
                var _service : IServices = new serviceToInitialise();
                _service.facadeRef = this.facadeRef;
            }

            // Register presentation models
            for each (var presentationModel : RegisterPresentationModel in _presentationModels) {
                addPresentationModel(presentationModel.presentationClass, presentationModel.presentationModelName);
            }

            // Register mediators
            for each (var mediator : RegisterMediator in mediators) {
                var mediatorToInitialise : Class = mediator.mediatorClass;
                var _mediator : IMediator = new mediatorToInitialise();
                _mediator.mediatorName = mediator.mediatorName;
                _mediator.facadeRef = this.facadeRef;
                addMediator(_mediator);
            }
        }
    }
}
