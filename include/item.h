#ifndef ITEM_H
#define ITEM_H

#include "types.h"

#define MAX_INVENTORY_ITEMS 128

typedef enum {
    ITEM_TIER_COMMON = 0,    /* Tier 1 - Blanco */
    ITEM_TIER_UNCOMMON = 1,  /* Tier 2 - Verde */
    ITEM_TIER_RARE = 2,      /* Tier 3 - Rojo */
    ITEM_TIER_USE = 3,       /* Tier 4 - Naranja (Equipamiento / Activo) */
    ITEM_TIER_BOSS = 4       /* Items de Jefe - Amarillo */
} ItemTier;

typedef struct {
    u16 id;
    const char* name;
    const char* quote;
    const char* description;
    ItemTier tier;
    u16 sprite_id;
} ItemDef;

typedef struct {
    u16 item_id;
    u16 count;
} ItemStack;

/* Prototipos del sistema de items */
void item_system_init(void);
const ItemDef* item_get_def(u16 item_id);

#endif /* ITEM_H */
