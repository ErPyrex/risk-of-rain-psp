#include "item.h"

static const ItemDef ITEM_CATALOG[] = {
    {
        .id = 1,
        .name = "Soldier's Syringe",
        .quote = "Increases attack speed.",
        .description = "Increases attack speed by 15%.",
        .tier = ITEM_TIER_COMMON,
        .sprite_id = 338
    },
    {
        .id = 2,
        .name = "Paul's Goat Hoof",
        .quote = "Move faster.",
        .description = "Increases movement speed by 20%.",
        .tier = ITEM_TIER_COMMON,
        .sprite_id = 349
    },
    {
        .id = 3,
        .name = "Lens Maker's Glasses",
        .quote = "Your attacks can critically strike.",
        .description = "Adds 7% critical strike chance.",
        .tier = ITEM_TIER_COMMON,
        .sprite_id = 350
    },
    {
        .id = 4,
        .name = "Bustling Fungus",
        .quote = "Heal outside of danger.",
        .description = "After standing still for 2 seconds, heal 4.5% max HP every second.",
        .tier = ITEM_TIER_COMMON,
        .sprite_id = 352
    },
    {
        .id = 5,
        .name = "Hopoo Feather",
        .quote = "Gain an extra jump.",
        .description = "Grants +1 maximum jump count.",
        .tier = ITEM_TIER_UNCOMMON,
        .sprite_id = 361
    },
    {
        .id = 6,
        .name = "Infusion",
        .quote = "Killing enemies increases max health.",
        .description = "Killing an enemy permanently increases maximum health by 4.",
        .tier = ITEM_TIER_UNCOMMON,
        .sprite_id = 376
    },
    {
        .id = 7,
        .name = "Ukulele",
        .quote = "..and his music was electric.",
        .description = "20% chance on hit to fire chain lightning for 80% damage to up to 3 targets.",
        .tier = ITEM_TIER_UNCOMMON,
        .sprite_id = 380
    },
    {
        .id = 8,
        .name = "Brilliant Behemoth",
        .quote = "All your attacks explode.",
        .description = "All attacks explode in a 4m radius for 60% additional damage.",
        .tier = ITEM_TIER_RARE,
        .sprite_id = 405
    }
};

#define CATALOG_SIZE (sizeof(ITEM_CATALOG) / sizeof(ITEM_CATALOG[0]))

void item_system_init(void) {
    /* Inicialización de tablas y lookup si fuera necesario */
}

const ItemDef* item_get_def(u16 item_id) {
    for (size_t i = 0; i < CATALOG_SIZE; i++) {
        if (ITEM_CATALOG[i].id == item_id) {
            return &ITEM_CATALOG[i];
        }
    }
    return NULL;
}
