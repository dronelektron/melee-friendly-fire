#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#include "melee-friendly-fire/client"
#include "melee-friendly-fire/weapon"

#include "modules/client.sp"
#include "modules/console-variable.sp"
#include "modules/hook.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Melee friendly fire",
    author = "Dron-elektron",
    description = "Allows you to inflict damage to the allies",
    version = "1.1.0",
    url = "https://github.com/dronelektron/melee-friendly-fire"
};

public void OnPluginStart() {
    Variable_Create();
    AutoExecConfig(_, "melee-friendly-fire");
}

public void OnClientConnected(int client) {
    Client_Reset(client);
}

public void OnClientPutInServer(int client) {
    if (Variable_PluginEnabled()) {
        Hook_TraceAttackPost(client, MELEE_DAMAGE_ENABLED_YES);
    }
}
