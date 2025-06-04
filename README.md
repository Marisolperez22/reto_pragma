# Reto PRAGMA Flutter

## Descripción

La aplicación se compone de:

- Un listado de tarjetas en la pantalla principal
- Pantalla de detalles con opción de editar o eliminar
- Pantalla de formulario para crear o editar la información de las tarjetas

## Estructura

- Modelo de datos para las tarjetas: Item
- Pantallas principales: HomeScreen, DetailsScreen, FormScreen
- Widget reutilizable: ItemCard
- data: lógica para manejar el estado de los items

## Consideraciones

- No se usa base de datos externa; todo es en memoria
- Se usa el paquete go_router para navegación simple
- Se usa provider como manejador de estados
- Se utiliza el patrón Singleton para utilizar la misma instancia de la clase que contiene la lista de tarjetas y los métodos para crear, editar y eliminar tarjeta entre pantallas. 
