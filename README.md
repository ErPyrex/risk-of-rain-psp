# Proyecto: Decompilación y Port a PSP

Este proyecto está estructurado para llevar a cabo el proceso completo de ingeniería inversa / decompilación de un juego y su posterior port a **PlayStation Portable (PSP)**.

---

## 📁 Estructura del Proyecto

```
psp-game-port/
├── original/       # Coloca aquí el binario original del juego (ej: .exe, .elf, ROM, dumps)
├── ghidra/         # Proyectos de Ghidra (.gpr y carpeta .rep), scripts y exports
├── src/            # Código C/C++ reconstruido y lógica principal del juego
├── include/        # Encabezados, estructuras, constantes y types.h
├── psp/            # Capa de abstracción para hardware de PSP (Video, Audio, Controles)
│   ├── Makefile    # Makefile para compilar el EBOOT.PBP con PSPSDK
│   └── psp_main.c  # Callbacks del kernel de PSP y setup de pantalla
├── tools/          # Scripts auxiliares (extracción de assets, conversores de formatos)
├── docs/           # Documentación del binario, offsets, mapa de memoria y progreso
└── CMakeLists.txt  # Compilación local para pruebas en PC (Host Linux)
```

---

## 🛠️ Flujo de Trabajo Recomendado

### Fase 1: Análisis y Decompilación con Ghidra & REA
1. Coloca el ejecutable o ROM original en `original/`.
2. Puedes abrirlo con Ghidra usando el comando de terminal:
   ```bash
   ghidra
   ```
3. O pedirle a Antigravity / REA en cualquier momento:
   - *"Inspecciona las funciones de `original/<archivo>` con Ghidra y genera el pseudocódigo de la función principal."*
4. Registra los hallazgos en [`docs/decomp_progress.md`](./docs/decomp_progress.md).
5. Traslada la lógica decompilada a código C limpio en `src/`.

### Fase 2: Verificación en PC (Host Build)
Para probar que la lógica funciona sin depender inmediatamente del emulador o hardware de PSP:
```bash
mkdir -p build && cd build
cmake ..
make
./game_host
```

### Fase 3: Port a PSP
1. La carpeta `psp/` contiene la abstracción de hardware para la PSP:
   - **Pantalla**: Resolución nativa de 480x272 píxeles (`sceDisplay` o `GU`).
   - **Controles**: `sceCtrlReadBufferPositive`.
   - **Audio**: `sceAudio`.
2. Para compilar el `EBOOT.PBP` para tu PSP o emulador PPSSPP, se utiliza el **PSPSDK** (`make` en la carpeta `psp/`).
