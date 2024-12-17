
# Experimento 5. Galería de Imágenes con Flutter y Provider

## Descripción

Este proyecto es una galería de imágenes creada con Flutter, utilizando el paquete `Provider` para la gestión del estado. La aplicación permite a los usuarios agregar imágenes dinámicamente, cambiar la vista entre dos y tres columnas, y ver una imagen en detalle con una animación de transición suave utilizando el widget `Hero`.

## Características

- **Agregar Imágenes Dinámicamente:** Los usuarios pueden agregar nuevas imágenes a la galería.
- **Cambio de Vista:** Cambia fácilmente entre una vista de dos columnas y una vista de tres columnas.
- **Animación Hero:** Transición suave al ver una imagen en detalle utilizando el widget `Hero`.
- **Gestión del Estado:** Uso de `Provider` para manejar el estado de la aplicación de manera eficiente y escalable.

## Estructura del Proyecto

### Archivos Principales

- `main.dart`: Configuración inicial de la aplicación y `Provider`.
- `galeria_imagenes.dart`: Página principal que muestra la galería de imágenes.
- `galeria_imagenes_provider.dart`: Proveedor que gestiona el estado de las imágenes y el número de columnas.
- `seccion_encabezado.dart`: Widget que contiene el encabezado de la galería.
- `seccion_de_textos.dart`: Widget que contiene los textos descriptivos de la galería.
- `seccion_cuerpo.dart`: Widget que muestra la cuadrícula de imágenes.
- `image_view.dart`: Página que muestra la imagen seleccionada en detalle con animación `Hero`.

## Capturas de pantalla

| Dos columnas       |  Tres columnas                                         |
|-------------------|-----------------------------------------------------|
|   ![grilla de 2 columnas](/experimento5/assets/readme_img/inicial.jpg)    |  ![grilla de 3 columnas](/experimento5/assets/readme_img/secundaria.jpg)         |



