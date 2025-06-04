# Reto PRAGMA Flutter

## Descripción

Aplicación Flutter simple con:

- Listado de elementos en la pantalla principal
- Pantalla de detalles con opción de editar/eliminar
- Pantalla de formulario para crear/editar elementos

## Estructura

- `models/`: modelo de datos `Item`
- `screens/`: `HomeScreen`, `DetailsScreen`, `FormScreen`
- `widgets/`: componente reutilizable `ItemCard`
- `data/`: lógica para manejar el estado de los items

## Consideraciones

- No se usa base de datos externa; todo es en memoria
- Se usa `Navigator.push()` para navegación simple
- Ideal para expandir a futuras integraciones como SQLite, Firestore o APIs REST
