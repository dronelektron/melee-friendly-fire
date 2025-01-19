static bool g_meleeDamageEnabled[MAXPLAYERS + 1];

void Client_Reset(int client) {
    g_meleeDamageEnabled[client] = false;
}

bool Client_HasMeleeDamage(int client) {
    return g_meleeDamageEnabled[client];
}

void Client_SetMeleeDamage(int client, bool enabled) {
    g_meleeDamageEnabled[client] = enabled;
}
