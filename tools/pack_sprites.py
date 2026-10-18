#!/usr/bin/env python3
"""
Risk of Rain PSP - Sprite Atlas Packer (Versión 2.0 HD)
Empaqueta los sprites originales de Risk of Rain en un atlas de 512x512 para la GPU de PSP (VRAM/pspgu).
Incluye:
  - Commando completo (Idle, Run 0-7, Jump, Climb, Shoot)
  - Cápsula de escape estrellada original (sBaseIdle: 112x57)
  - Teletransportador animado (sTeleporter 0-6: 53x32)
  - Cofres y Barriles originales (sChest1, sChest2, sBarrel1)
  - Altares del azar originales (sShrine1 0-5)
  - Enemigos: Lemurian y Wisp
  - Tiles auténticos extraídos de sGroundStrip (Superficie con musgo y Roca profunda)
  - Cuerda con tinte natural
"""

import os
import sys
from PIL import Image

SPRITE_DIR = "extracted/Sprites"
OUT_DIR = "assets"
HEADER_PATH = "include/sprites.h"
ATLAS_SIZE = 512

os.makedirs(OUT_DIR, exist_ok=True)
os.makedirs("include", exist_ok=True)

SPRITE_ENTRIES = [
    # Commando (Gunner)
    ("SPRITE_COMMANDO_IDLE", "sGManIdle_0.png", 10, 12),
    ("SPRITE_COMMANDO_RUN_0", "sGManRun_0.png", 5, 12),
    ("SPRITE_COMMANDO_RUN_1", "sGManRun_1.png", 5, 12),
    ("SPRITE_COMMANDO_RUN_2", "sGManRun_2.png", 5, 12),
    ("SPRITE_COMMANDO_RUN_3", "sGManRun_3.png", 5, 12),
    ("SPRITE_COMMANDO_RUN_4", "sGManRun_4.png", 5, 12),
    ("SPRITE_COMMANDO_RUN_5", "sGManRun_5.png", 5, 12),
    ("SPRITE_COMMANDO_RUN_6", "sGManRun_6.png", 5, 12),
    ("SPRITE_COMMANDO_RUN_7", "sGManRun_7.png", 5, 12),
    ("SPRITE_COMMANDO_JUMP", "sGManJump_0.png", 4, 11),
    ("SPRITE_COMMANDO_CLIMB_0", "sGManClimb_0.png", 4, 12),
    ("SPRITE_COMMANDO_CLIMB_1", "sGManClimb_1.png", 4, 12),
    ("SPRITE_COMMANDO_SHOOT1_0", "sGManShoot1_0.png", 7, 12),
    ("SPRITE_COMMANDO_SHOOT1_1", "sGManShoot1_1.png", 7, 12),
    ("SPRITE_COMMANDO_SHOOT1_2", "sGManShoot1_2.png", 7, 12),
    ("SPRITE_COMMANDO_SHOOT1_3", "sGManShoot1_3.png", 7, 12),
    ("SPRITE_COMMANDO_SHOOT1_4", "sGManShoot1_4.png", 7, 12),

    # Cápsula de escape estrellada original (112x57)
    ("SPRITE_ESCAPE_POD", "sBaseIdle_0.png", 56, 57),

    # Teleporter (Fases de carga y activo)
    ("SPRITE_TELEPORTER_0", "sTeleporter_0.png", 26, 32),
    ("SPRITE_TELEPORTER_1", "sTeleporter_1.png", 26, 32),
    ("SPRITE_TELEPORTER_2", "sTeleporter_2.png", 26, 32),
    ("SPRITE_TELEPORTER_3", "sTeleporter_3.png", 26, 32),
    ("SPRITE_TELEPORTER_4", "sTeleporter_4.png", 26, 32),
    ("SPRITE_TELEPORTER_5", "sTeleporter_5.png", 26, 32),
    ("SPRITE_TELEPORTER_6", "sTeleporter_6.png", 26, 32),

    # Interactables (Cofres y Barril)
    ("SPRITE_CHEST_SMALL_CLOSED", "sChest1_0.png", 18, 13),
    ("SPRITE_CHEST_SMALL_OPEN", "sChest1_7.png", 18, 13),
    ("SPRITE_CHEST_LARGE_CLOSED", "sChest2_0.png", 22, 24),
    ("SPRITE_BARREL_CLOSED", "sBarrel1_0.png", 6, 11),
    ("SPRITE_BARREL_OPEN", "sBarrel1_5.png", 6, 11),
    ("SPRITE_SHRINE_0", "sShrine1_0.png", 24, 65),
    ("SPRITE_SHRINE_1", "sShrine1_1.png", 24, 65),

    # Enemigos: Lemurian
    ("SPRITE_LEMURIAN_IDLE", "sLizardIdle_0.png", 8, 15),
    ("SPRITE_LEMURIAN_WALK_0", "sLizardWalk_0.png", 8, 16),
    ("SPRITE_LEMURIAN_WALK_1", "sLizardWalk_1.png", 8, 16),
    ("SPRITE_LEMURIAN_WALK_2", "sLizardWalk_2.png", 8, 16),
    ("SPRITE_LEMURIAN_WALK_3", "sLizardWalk_3.png", 8, 16),

    # Enemigos: Wisp
    ("SPRITE_WISP_0", "sWispIdle_0.png", 5, 8),
    ("SPRITE_WISP_1", "sWispIdle_1.png", 5, 8),
    ("SPRITE_WISP_2", "sWispIdle_2.png", 5, 8),
    ("SPRITE_WISP_3", "sWispIdle_3.png", 5, 8),
]

atlas = Image.new("RGBA", (ATLAS_SIZE, ATLAS_SIZE), (0, 0, 0, 0))

cur_x = 2
cur_y = 2
shelf_height = 0
packed_info = []

for enum_name, filename, ox, oy in SPRITE_ENTRIES:
    path = os.path.join(SPRITE_DIR, filename)
    if not os.path.exists(path):
        print(f"Advertencia: no se encuentra {path}")
        continue
    img = Image.open(path).convert("RGBA")
    w, h = img.size

    if cur_x + w + 2 >= ATLAS_SIZE:
        cur_x = 2
        cur_y += shelf_height + 2
        shelf_height = 0

    if cur_y + h + 2 >= ATLAS_SIZE:
        print(f"Error: el atlas {ATLAS_SIZE}x{ATLAS_SIZE} se ha llenado en {enum_name}!")
        break

    atlas.paste(img, (cur_x, cur_y))
    packed_info.append({
        "enum": enum_name,
        "u": cur_x,
        "v": cur_y,
        "w": w,
        "h": h,
        "ox": ox,
        "oy": oy
    })

    cur_x += w + 2
    if h > shelf_height:
        shelf_height = h

# 1. Extraer baldosas auténticas de sGroundStrip_0.png (Risk of Rain Stage 1)
strip_path = os.path.join(SPRITE_DIR, "sGroundStrip_0.png")
if os.path.exists(strip_path):
    strip = Image.open(strip_path).convert("RGBA")
    # Superficie con musgo superior (16x16)
    tile_surface = strip.crop((0, 1, 16, 17))
    # Roca sólida interna (16x16)
    tile_solid = strip.crop((0, 20, 16, 36))
else:
    tile_surface = Image.new("RGBA", (16, 16), (70, 95, 55, 255))
    tile_solid = Image.new("RGBA", (16, 16), (46, 44, 50, 255))

# 2. Plataforma atravesable (16x6 con borde iluminado)
tile_plat = Image.new("RGBA", (16, 6), (75, 60, 48, 255))
for tx in range(16):
    tile_plat.putpixel((tx, 0), (160, 135, 95, 255))
    tile_plat.putpixel((tx, 5), (45, 35, 28, 255))

# 3. Cuerda coloreada auténtica (4x16 en marrón cáñamo)
rope_path = os.path.join(SPRITE_DIR, "sRope_0.png")
if os.path.exists(rope_path):
    rope_raw = Image.open(rope_path).convert("RGBA")
    tile_rope = Image.new("RGBA", (4, 16), (0, 0, 0, 0))
    for ry in range(16):
        for rx in range(4):
            r, g, b, a = rope_raw.getpixel((rx, ry))
            if a > 50:
                # Tinte marrón soga
                tile_rope.putpixel((rx, ry), (155, 120, 75, 255))
            elif rx in (1, 2) and (ry % 3 != 0):
                tile_rope.putpixel((rx, ry), (110, 85, 55, 255))
else:
    tile_rope = Image.new("RGBA", (4, 16), (155, 120, 75, 255))

custom_tiles = [
    (tile_surface, "SPRITE_TILE_SURFACE", 0, 0),
    (tile_solid,   "SPRITE_TILE_SOLID",   0, 0),
    (tile_plat,    "SPRITE_TILE_PLATFORM", 0, 0),
    (tile_rope,    "SPRITE_ROPE",          2, 0)
]

for tile_img, enum_name, ox, oy in custom_tiles:
    w, h = tile_img.size
    if cur_x + w + 2 >= ATLAS_SIZE:
        cur_x = 2
        cur_y += shelf_height + 2
        shelf_height = 0
    atlas.paste(tile_img, (cur_x, cur_y))
    packed_info.append({
        "enum": enum_name,
        "u": cur_x,
        "v": cur_y,
        "w": w,
        "h": h,
        "ox": ox,
        "oy": oy
    })
    cur_x += w + 2
    if h > shelf_height:
        shelf_height = h

# Guardar atlas en PNG
png_path = os.path.join(OUT_DIR, "spritesheet.png")
atlas.save(png_path)
print(f"✓ Guardado atlas PNG: {png_path} ({ATLAS_SIZE}x{ATLAS_SIZE})")

# Exportar formato binario nativo PSP RGBA5551 (16 bits) y RGBA8888 (32 bits)
raw_5551_path = os.path.join(OUT_DIR, "spritesheet_rgba5551.raw")
raw_8888_path = os.path.join(OUT_DIR, "spritesheet_rgba8888.raw")

raw_5551_bytes = bytearray()
raw_8888_bytes = bytearray()

pixels = atlas.load()
for y in range(ATLAS_SIZE):
    for x in range(ATLAS_SIZE):
        r, g, b, a = pixels[x, y]
        raw_8888_bytes.extend([r, g, b, a])
        r5 = (r >> 3) & 0x1F
        g5 = (g >> 3) & 0x1F
        b5 = (b >> 3) & 0x1F
        a1 = 1 if a > 64 else 0
        val16 = (a1 << 15) | (b5 << 10) | (g5 << 5) | r5
        raw_5551_bytes.extend([val16 & 0xFF, (val16 >> 8) & 0xFF])

with open(raw_5551_path, "wb") as f:
    f.write(raw_5551_bytes)
with open(raw_8888_path, "wb") as f:
    f.write(raw_8888_bytes)

print(f"✓ Guardado binario PSP RGBA5551: {raw_5551_path} ({len(raw_5551_bytes)} bytes)")
print(f"✓ Guardado binario 32-bit: {raw_8888_path} ({len(raw_8888_bytes)} bytes)")

# Generar archivo de cabecera C include/sprites.h
with open(HEADER_PATH, "w") as f:
    f.write("/* Generado automáticamente por tools/pack_sprites.py */\n")
    f.write("#ifndef SPRITES_H\n#define SPRITES_H\n\n")
    f.write('#include "types.h"\n\n')
    f.write(f"#define ATLAS_WIDTH  {ATLAS_SIZE}\n")
    f.write(f"#define ATLAS_HEIGHT {ATLAS_SIZE}\n\n")
    
    f.write("typedef enum {\n")
    for p in packed_info:
        f.write(f"    {p['enum']},\n")
    f.write("    SPRITE_COUNT\n} SpriteId;\n\n")

    f.write("typedef struct {\n")
    f.write("    u16 u, v;\n")
    f.write("    u16 w, h;\n")
    f.write("    s16 origin_x, origin_y;\n")
    f.write("} SpriteDef;\n\n")

    f.write("static const SpriteDef g_sprite_defs[SPRITE_COUNT] = {\n")
    for p in packed_info:
        f.write(f"    /* {p['enum']} */ {{ {p['u']}, {p['v']}, {p['w']}, {p['h']}, {p['ox']}, {p['oy']} }},\n")
    f.write("};\n\n")
    f.write("#endif /* SPRITES_H */\n")

print(f"✓ Generado header C: {HEADER_PATH} con {len(packed_info)} sprites.")
