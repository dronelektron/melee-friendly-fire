#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#define WEAPON_SLOT_MELEE 2

public Plugin myinfo = {
    name = "Melee friendly fire",
    author = "Dron-elektron",
    description = "Allows you to inflict damage to the allies",
    version = "0.1.0",
    url = "https://github.com/dronelektron/melee-friendly-fire"
};

static ConVar g_pluginEnabled = null;

public void OnPluginStart() {
    g_pluginEnabled = CreateConVar("sm_melee_friendly_fire", "1", "Enable (1) or disable (0) melee friendly fire");
}

public void OnClientPutInServer(int client) {
    SDKHook(client, SDKHook_TraceAttackPost, Hook_TraceAttackPost);
}

public void Hook_TraceAttackPost(int victim, int attacker, int inflictor, float damage, int damageType, int ammoType, int hitbox, int hitGroup) {
    if (IsMeleeAttack(damageType) && IsPluginEnalbed()) {
        int weapon = GetPlayerWeaponSlot(attacker, WEAPON_SLOT_MELEE);

        SDKHooks_TakeDamage(victim, inflictor, attacker, damage, damageType, weapon);
    }
}

bool IsMeleeAttack(int damageType) {
    return damageType & DMG_CLUB == DMG_CLUB;
}

bool IsPluginEnalbed() {
    return g_pluginEnabled.IntValue == 1;
}
