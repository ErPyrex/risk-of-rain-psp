# Progreso de Decompilación y Análisis: Risk of Rain

## Resumen de Extracción
- **Motor**: GameMaker: Studio 1.4 (Bytecode versión 15 - VM).
- **Scripts y Eventos GML extraídos**: 3,447 archivos de código legibles en `extracted/code/CodeEntries/`.
- **Sprites extraídos**: 6,417 frames en `extracted/Sprites/`.
- **Texturas empaquetadas**: 22 hojas de texturas en `extracted/EmbeddedTextures/`.
- **Cadenas de texto**: 9,914 strings en `extracted/strings.txt`.

---

## 🎮 Arquitectura Principal del Juego

### 1. Inicialización y Bucle Principal
- `gml_Script_init.gml`: Configuración inicial de variables globales, artefactos, resolución y escalado.
- `oInit`: Objeto persistente encargado de cargar configuraciones y orquestar el reloj del juego.

### 2. Entidad del Jugador (`Player`)
- `gml_Script_init_player.gml`: Inicialización de arrays de items (`item[120, 3]`), habilidades activas (`skill[4, 6]`), estadísticas (`hp`, `maxhp`, `level`, `expyy`, `cdr`).
- `gml_Script_draw_player.gml`: Dibujo de la animación del personaje y visualización de items recolectados en el cuerpo.
- Clases de supervivientes (`class`): Commando, Enforcer, Bandit, Huntress, HAN-D, Engineer, Miner, Sniper, Acrid, Mercenary, Loader, CHEF.

### 3. Director de Dificultad y Spawn (`oDirector`)
- El núcleo procedural del juego. Maneja el escalado de dificultad por tiempo (Very Easy -> Insane -> I SEE YOU -> HAHAHA).
- Controla el spawn de enemigos según el presupuesto de puntos por oleada y la distancia del jugador.

### 4. Items y Artefactos
- Más de 100 items activos y pasivos definidos mediante arrays de propiedades y scripts de activación.

---

## 🎯 Plan de Portabilidad a PSP

| Módulo | Implementación Original | Estrategia PSP (32MB / 64MB RAM) |
|---|---|---|
| **Motor de Juego** | GameMaker VM | Reconstrucción en C puro (`src/`) modular y optimizado. |
| **Gráficos** | Direct3D 9 / 22 Texturas grandes | Render 2D con **PSP GU** (`-lpspgu`). Compresión a paletas de 16/8 bits cargadas dinámicamente por nivel. |
| **Resolución** | Dinámica / Escalada | Nativa de **480 × 272** (se adapta perfecto a la estética pixel art original de 1x/2x). |
| **Audio** | FMOD / GMS Audio (40+ MB en RAM) | Streaming por bloques desde Memory Stick con `sceAudio` / Media Engine. |
| **Controles** | Teclado / Gamepad DirectInput | Mapeo al pad analógico, D-Pad, L/R y botones frontales con `sceCtrl`. |
