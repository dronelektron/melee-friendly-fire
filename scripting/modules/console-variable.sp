static ConVar g_pluginEnabled;

void Variable_Create() {
    g_pluginEnabled = CreateConVar("sm_meleefriendlyfire", "1", "Enable (1) or disable (0) melee friendly fire");
    g_pluginEnabled.AddChangeHook(OnPluginEnabled);
}

bool Variable_PluginEnabled() {
    return g_pluginEnabled.BoolValue;
}

static void OnPluginEnabled(ConVar variable, const char[] oldValue, const char[] newValue) {
    bool enabled = variable.BoolValue;

    UseCase_ToggleMeleeDamage(enabled);
}
