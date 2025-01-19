void Hook_TraceAttackPost(int client, bool enabled) {
    if (Client_HasMeleeDamage(client) == enabled) {
        return;
    }

    Client_SetMeleeDamage(client, enabled);

    if (enabled) {
        SDKHook(client, SDKHook_TraceAttackPost, OnTraceAttackPost);
    } else {
        SDKUnhook(client, SDKHook_TraceAttackPost, OnTraceAttackPost);
    }
}

static void OnTraceAttackPost(int victim, int attacker, int inflictor, float damage, int damageType, int ammoType, int hitbox, int hitGroup) {
    bool meleeAttack = UseCase_IsMeleeAttack(damageType);
    bool fromSameTeam = UseCase_AreFromSameTeam(victim, attacker);

    if (meleeAttack && fromSameTeam) {
        int weapon = GetPlayerWeaponSlot(attacker, WEAPON_SLOT_MELEE);

        SDKHooks_TakeDamage(victim, inflictor, attacker, damage, damageType, weapon);
    }
}
