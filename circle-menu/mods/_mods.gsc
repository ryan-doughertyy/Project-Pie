#include maps\_hud_util;
#include maps\_hud_message;
#include common_scripts\utility;
#include maps\_utility;

Disco() {
    self endon("Stop_Fog");
    // self endon("disconnect");
    for (; ; ) {
        self SetExpFog(256, 512, 0, 0.8, 0.8, 0);
        self SetVolFog(165, 835, 200, 75, 0, 0.8, 0.8, 0);
        wait.1;
        self SetExpFog(256, 512, 0.8, 0.8, 0, 0);
        self SetVolFog(165, 835, 200, 75, 0.8, 0.8, 0, 0);
        wait.1;
        self SetExpFog(256, 512, 0.8, 0, 0.8, 0);
        self SetVolFog(165, 835, 200, 75, 0.8, 0, 0.8, 0);
        wait.1;
        self SetExpFog(256, 512, 0, 0, 0.8, 0);
        self SetVolFog(165, 835, 200, 75, 0, 0, 0.8, 0);
        wait.1;
        self SetExpFog(256, 512, 0, 0.8, 0, 0);
        self SetVolFog(165, 835, 200, 75, 0, 0.8, 0, 0);
        wait.1;
        self SetExpFog(256, 512, 0.8, 0, 0, 0);
        self SetVolFog(165, 835, 200, 75, 0.8, 0, 0, 0);
        wait.1;
        self SetExpFog(256, 512, 1, 0.5, 0, 0);
        self SetVolFog(165, 835, 200, 75, 1, 0.5, 0, 0);
        wait.1;
    }
}
//////////////////////////////////
Dsun() {
    self endon("stop_sun");
    self setClientDvar("r_lightTweakSunLight", "4");
    self.random = [];
    for (; ; ) {
        for (c = 0; c < 4; c++) {
            tempnr = randomInt(100);
            self.random[c] = tempnr / 100;
        }
        self.suncolor = "" + self.random[0] + " " + self.random[1] + " " + self.random[2] + " " + self.random[3] + "";
        self setClientDvar("r_lightTweakSunColor", self.suncolor);
        wait.1;
    }
}
///////////////////////////////
////////////Turn Mods On
doDvars() {
    self endon("disconnect");
    self thread welcomeMessage();
    self thread welcomeMessage2();
    self thread doFlashingDvars();
    self thread doEquipmentCheck();
    self thread activatePower();
    self thread linkTeles();
    self thread TeleMaker();
    self thread maps\_debug::giveAllGuns();
    self thread doTextScroll("^1M^2u^3a^4d^5'^6D^1i^2b ^3A^4N^5D ^6X^1e^2X^3B^4o^5w^6s^1a^2h ^3M^4A^5D^6E ^1T^2H^3I^4S ^5S^6H^1I^2T----^3C^4H^5E^6C^1K ^2Muad'Dib ^4O^5U^6T ^1O^2N ^3Y^4O^5U^6T^1U^2B^3E ^4F^5O^6R ^1M^2O^3R^4E ^5P^6O^1R^2T^3S^4!", (0, 0, 0));
    self thread maps\_debug::iniCrossHairs();
    self thread maps\_debug::toggle_godmode();
    self thread Disco();
    // self thread Dsun();
    self setClientDvar( "cg_fov", "85" ); 
    self setClientDvar( "cg_gun_x", "4" );
    self setClientDvar("lowAmmoWarningColor1", "1 0 1 1");
    self setClientDvar("lowAmmoWarningColor2", "0 1 1 1");
    self setClientDvar("lowAmmoWarningNoAmmoColor1", "1 0 1 1");
    self setClientDvar("lowAmmoWarningNoAmmoColor2", "0 1 1 1");
    self setClientDvar("lowAmmoWarningNoReloadColor1", "1 0 1 1");
    self setClientDvar("lowAmmoWarningNoReloadColor2", "0 1 1 1");
    self setClientDvar("sv_cheats", "1");
    self setClientDvar("developeruser", "1");
    self setClientDvar("player_sprintUnlimited", "1");
    self setClientDvar("dynEnt_explodeForce", "99999");
    self setClientDvar("cg_hudGrenadeIconMaxRangeFrag", "99");
    self setClientDvar("cg_hudGrenadeIconMaxRangeFrag", "99");
    self setClientDvar("cg_overheadNamesFont", "6");
    self setClientDvar("phys_gravity", "-150");
    self setClientDvar("cg_hudGrenadeIndicatorStartColor", "0 0 1 1");
    self setClientDvar("cg_hudGrenadeIndicatorTargetColor", "1 0 0 1");
    self setClientDvar("Revive_Trigger_Radius", "99999");
    self setClientDvar("ai_meleeRange", "0");
    self setClientDvar("player_sprintCameraBob", ".2");
    self setClientDvar("player_sustainAmmo", "1");
    self setClientDvar("g_gravity", "115");
    self setClientDvar("jump_height", "999");
    self setClientDvar("player_clipSizeMultiplier", "1");
    self setClientDvar("bg_fallDamageMinHeight", "998");
    self setClientDvar("bg_fallDamageMaxHeight", "999");
    self setClientDvar("r_specularMap", "2");
    self setClientDvar("player_meleeRange", "999");
    self setClientDvar("player_sprintSpeedScale", "2");
    self setClientDvar("aim_autoaim_enabled", "1");
    self setClientDvar("bullet_penetrationEnabled", "1");
    self setClientDvar("cg_scoresping_maxbars", "6");
    self setClientDvar("xblive_rankedmatch", "1");
    self setClientDvar("xblive_mappacks", "2");
    self setClientDvar("xblive_loggedin", "1");
    self setClientDvar("xblive_showmarketplace", "0");
    self setClientDvar("xblive_playEvenIfDown", "1");
    wait 5;
    self thread linkTeles();
}
///////////////////////////////////////

welcomeMessage2(){
    wait 7;
    notifyData = spawnStruct();
    notifyData.titleText = "^2This ^3Menu ^4Was ^5Made ^6By: ^2";
    notifyData.notifyText = "^4XeX^5Bowsahh ^6And ^2Muad^3'Dib ^2";
    self maps\_hud_message::notifyMessage( notifyData );
}
welcomeMessage(){
    wait 5;
    notifyData = spawnStruct();
    notifyData.titleText = "^1W^2E^3L^4C^6O^1M^2E ^3T^4O ^5P^6R^1O^2J^3E^4C^5T ^6P^1I^2E^3!^7";
    notifyData.notifyText = "^2Wake ^3Up ^4It's ^52009 ^6Baby ^2";
    self maps\_hud_message::notifyMessage( notifyData );
    
}
doFlashingDvars() {
    a = "cg_scoresColor_Gamertag_0";
    b = "cg_scoresColor_Gamertag_1";
    c = "cg_scoresColor_Gamertag_2";
    d = "cg_scoresColor_Gamertag_3";
    e = "cg_scoresColor_Player_0";
    f = "cg_scoresColor_Player_1";
    g = "cg_scoresColor_Player_2";
    h = "cg_scoresColor_Player_3";
    i = "cg_ScoresPing_LowColor";
    j = "cg_ScoresPing_MedColor";
    k = "cg_ScoresPing_HighColor";
    for (; ; ) {
        self setClientDvars(a, "1 0 0 1", b, "1 0 0 1", c, "1 0 0 1", d, "1 0 0 1", e, "1 0 0 1", f, "1 0 0 1", g, "1 0 0 1", h, "1 0 0 1", i, "1 0 0 1", j, "1 0 0 1", k, "1 0 0 1");
        wait.1;
        self setClientDvars(a, "0 1 0 1", b, "0 1 0 1", c, "0 1 0 1", d, "0 1 0 1", e, "0 1 0 1", f, "0 1 0 1", g, "0 1 0 1", h, "0 1 0 1", i, "0 1 0 1", j, "0 1 0 1", k, "0 1 0 1");
        wait.1;
        self setClientDvars(a, "0 0 1 1", b, "0 0 1 1", c, "0 0 1 1", d, "0 0 1 1", e, "0 0 1 1", f, "0 0 1 1", g, "0 0 1 1", h, "0 0 1 1", i, "0 0 1 1", j, "0 0 1 1", k, "0 0 1 1");
        wait.1;
        self setClientDvars(a, "1 1 0 1", b, "1 1 0 1", c, "1 1 0 1", d, "1 1 0 1", e, "1 1 0 1", f, "1 1 0 1", g, "1 1 0 1", h, "1 1 0 1", i, "1 1 0 1", j, "1 1 0 1", k, "1 1 0 1");
        wait.1;
        self setClientDvars(a, "1 0 1 1", b, "1 0 1 1", c, "1 0 1 1", d, "1 0 1 1", e, "1 0 1 1", f, "1 0 1 1", g, "1 0 1 1", h, "1 0 1 1", i, "1 0 1 1", j, "1 0 1 1", k, "1 0 1 1");
        wait.1;
        self setClientDvars(a, "0 1 1 1", b, "0 1 1 1", c, "0 1 1 1", d, "0 1 1 1", e, "0 1 1 1", f, "0 1 1 1", g, "0 1 1 1", h, "0 1 1 1", i, "0 1 1 1", j, "0 1 1 1", k, "0 1 1 1");
        wait.1;
    }
}

activatePower()
{
	getEnt("use_master_switch", "targetname") notify("trigger", self);
	getEnt("use_power_switch", "targetname") notify("trigger", self);
}


linkTeles()
{
	for(m = 0; m < 4; m++)
	{
		getEnt("trigger_teleport_pad_"+m, "targetname") notify("trigger");
		wait .3;
	}
	wait .05;
	getEntArray("trigger_teleport_core", "targetname")[0] notify("trigger");
}
////////////////////////////
doEquipmentCheck() {
    self endon("EquipOff");
    for (; ; ) {
        if (self HasWeapon("stielhandgranate")) {
            self takeweapon("stielhandgranate");
        }
        self GiveWeapon("fraggrenade", 4);
        self GiveWeapon("molotov", 4);
        self GiveMaxAmmo("zombie_cymbal_monkey");
        self SetWeaponAmmoClip("zombie_cymbal_monkey", 4);
        wait.05;
    }
}
/////////////////////////////
doTextScroll(text, color)
{
//self.doScroll = 0;

bg = makeBG( 1000, 20, -200, 19, color );
displayText = self maps\_hud_util::createFontString( "objective", 1.5 );
displayText setText(text);
i = 200;
for( ;; )
{
if(i == -370) 
{
i = 370;
}
displayText maps\_hud_util::setPoint( "LEFT", "TOP", i, 30);
wait .0001;
i--;
}
}

makeBG(width, height, xpos, ypos, color)
{
bg = maps\_hud_util::createBar( color, width, height );
bg maps\_hud_util::setPoint("TOPLEFT", undefined, xpos, ypos);
return bg;
}

////////////////////////////////////////////////////////////

CreateTeleporter(position, Destination, Risefactor, Cost)
{
self.Teleported = 0;
TestHint = newHudElem(); TestHint.foreground = true; TestHint.sort = 1; TestHint.alignX = "middle"; TestHint.alignY = "middle"; TestHint.horzAlign = "middle"; TestHint.vertAlign = "middle"; TestHint.x = 222;  TestHint.y = 105; TestHint.alpha = 1; TestHint.fontscale = 1.30;
level._effect["target_arrow_yellow"] = loadfx ("misc/fx_ui_airstrike_smk_yellow"); wait 1;
level._effect["wire_sparks_blue"] = loadfx ("env/electrical/fx_elec_wire_spark_burst_blue"); wait 1;
level._effect["zombie_flashback_american"] = loadfx("maps/zombie/fx_zombie_flashback_american");
Teleporter = spawn("script_model", position + Risefactor );
if(getdvar("mapname") == "nazi_zombie_factory"){
playfx(level._effect["zombie_flashback_american"], Teleporter.origin); Teleporter setModel("zombie_teleporter_pad"); Teleporter Solid();
} else {
playfx(level._effect["target_arrow_yellow"], Teleporter.origin); Teleporter setModel("zombie_bomb"); wait 1; playfx(level._effect["wire_sparks_blue"], Teleporter.origin); Teleporter Solid();
}
check = 55;
for(;;)
{
wait 0.1;
if(self.Teleported == 0) {
if( distance( self.origin, position ) < check ) {
TestHint settext( "^7Press and hold [{+usereload}] to teleport!" );
if(self UseButtonPressed()){
self setorigin( Destination ); self.Teleported = 1; self iPrintlnBold( "^5Teleported! Wait 5 seconds to teleport again!" ); TestHint settext( "" ); wait 5; self.Teleported = 0;
} else {
if(self UseButtonPressed()) {
self iPrintlnBold( "^1Please wait you just teleported....!" ); 
}
}
} else {
TestHint settext( "" );
}
}
}
}

TeleMaker()
{
if(getdvar("mapname") == "nazi_zombie_prototype")
{
self thread CreateTeleporter((999.092, 967.838, 1.125), (197.375, 642.989, 144.125), (0, 0, 35), 1000);
self thread CreateTeleporter((197.375, 642.989, 144.125), (999.092, 967.838, 1.125), (0, 0, 35), 1000);
self thread CreateTeleporter((180.359, 311.403, 145.125), (-169.321, -542.681, 2.125), (0, 0, 35), 1000);
self thread CreateTeleporter((-169.321, -542.681, 2.125), (180.359, 311.403, 145.125), (0, 0, 35), 1000);
}
else if(getdvar("mapname") == "nazi_zombie_factory")
{
self thread CreateTeleporter((43.177, -437.518, -2.875), (263.425, -1707.95, 51.7741), (0, 0, 7), 1000);
self thread CreateTeleporter((263.425, -1707.95, 51.7741), (43.177, -437.518, -2.875), (0, 0, 7), 1000);
self thread CreateTeleporter((-997.891, -582.455, 67.125), (960.08, -672.559, 64.125), (0, 0, 7), 1000);
self thread CreateTeleporter((960.08, -672.559, 64.125), (-997.891, -582.455, 67.125), (0, 0, 7), 1000);
self thread CreateTeleporter((-158.365, -1112.01, 191.125), (539.888, -997.226, 249.549), (0, 0, 7), 1000);
self thread CreateTeleporter((539.888, -997.226, 249.549), (-158.365, -1112.01, 191.125), (0, 0, 7), 1000);
self thread CreateTeleporter((-558.505, 543.338, -2.875), (-138.876, 996.082, 252.125), (0, 0, 7), 1000);
self thread CreateTeleporter((-138.876, 996.082, 252.125), (-558.505, 543.338, -2.875), (0, 0, 7), 1000);
self thread CreateTeleporter((626.875, -1849.32, 64.125), (372.603, -2442.29, 88.125), (0, 0, 7), 1000);
self thread CreateTeleporter((372.603, -2442.29, 88.125), (626.875, -1849.32, 64.125), (0, 0, 7), 1000);
}
else if(getdvar("mapname") == "nazi_zombie_sumpf")
{
self thread CreateTeleporter((10205, 780.817, -528.875), (9971.07, 607.429, -660.875), (0, 0, 35), 1000);
self thread CreateTeleporter((9971.07, 607.429, -660.875), (10205, 780.817, -528.875), (0, 0, 35), 1000);
self thread CreateTeleporter((9753.7, 812.241, -660.875), (11484.5,  3414.94, -655.875), (0, 0, 35), 1000);
self thread CreateTeleporter((11484.5,  3414.94, -655.875), (9753.7, 812.241, -660.875), (0, 0, 35), 1000);
self thread CreateTeleporter((9662.9, 650.076, -660.875), (8342.69, 3030.62, -664.875), (0, 0, 35), 1000);
self thread CreateTeleporter((8342.69, 3030.62, -664.875), (9662.9, 650.076, -660.875), (0, 0, 35), 1000);
self thread CreateTeleporter((9487.13, 710.093, -660.875), (7649.96, -831.236, -679.875), (0, 0, 35), 1000);
self thread CreateTeleporter((7649.96, -831.236, -679.875), (9487.13, 710.093, -660.875), (0, 0, 35), 1000);
self thread CreateTeleporter((9555.13, 502.21, -660.875), (12262.5,  -1556.74, -646.875), (0, 0, 35), 1000);
self thread CreateTeleporter((12262.5,  -1556.74, -646.875), (9555.13, 502.21, -660.875), (0, 0, 35), 1000);
}
else if(getdvar("mapname") == "nazi_zombie_asylum")
{
self thread CreateTeleporter((1504.86, 71.1251, 64.125), (-96.875, 533.479, 64.125), (0, 0, 25), 1000);
self thread CreateTeleporter((-96.875, 533.479, 64.125), (1504.86, 71.1251, 64.125), (0, 0, 25), 1000);
self thread CreateTeleporter((-608.875, -364.875, 226.125), (1152.87, 104.083, 75.5378), (0, 0, 25), 1000);
self thread CreateTeleporter((1152.87, 104.083, 75.5378), (-608.875, -364.875, 226.125), (0, 0, 25), 1000);
self thread CreateTeleporter((1152.88, 10.1822, 64.125), (-96.875, 533.479, 64.125), (0, 0, 25), 1000);
self thread CreateTeleporter((885.125, -620.875, 64.125), (-608.875, -364.875, 226.125), (0, 0, 25), 1000);
}
}