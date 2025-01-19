bool UseCase_IsMeleeAttack(int damageType) {
    return (damageType & DMG_CLUB) == DMG_CLUB;
}

bool UseCase_AreFromSameTeam(int victim, int attacker) {
    int victimTeam = GetClientTeam(victim);
    int attackerTeam = GetClientTeam(attacker);

    return victimTeam == attackerTeam;
}

void UseCase_ToggleMeleeDamage(bool enabled) {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            Hook_TraceAttackPost(client, enabled);
        }
    }
}
