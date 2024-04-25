<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

$routes->get('/', 'Home::index');
$routes->get('saludo', 'Pagina::index');
$routes->get('noticias', 'Pagina::get_noticias');
$routes->get('room_details', 'Pagina::room_details');
