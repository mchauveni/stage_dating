<?php
    namespace Service\Interface;

    use Service\Routes\Request;

    class Controller {
        public static function bind (string $module, string|array $route, array $options = []) {
            $class = get_called_class();
            if(method_exists($class, $module)) {
                return Request::match($route, fn($args) => (new $class())->$module(...$args), $options);
            }
        }

        /**
         * 
         */
        protected function request () : Request {
            return Request::getInstance();
        }
    }
?>