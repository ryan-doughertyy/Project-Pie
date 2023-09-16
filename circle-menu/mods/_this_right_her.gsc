//a gsc
#include common_scripts\utility;
#include maps\_utility_code;
#include maps\_hud_util;
#include maps\_music;
#include maps\_busing;
#include maps\_createdynents;
DefActor() {
    self setModel("defaultactor");
}
DefCar() {
    self setModel("defaultvehicle");
}
RandBox() {
    self setModel("zombie_treasure_box");
}
InstaKill() {
    self setModel("zombie_skull");
}
DoublePts() {
    self setModel("zombie_x2_icon");
}
Nuke2() {
    self setModel("zombie_bomb");
}
MxAmmo() {
    self setModel("zombie_ammocan");
}
JuggM() {
    self setModel("zombie_vending_jugg_on");
}
DubM() {
    self setModel("zombie_vending_doubletap_on");
}
QuickM() {
    self setModel("zombie_vending_revive_on");
}
SpedM() {
    self setModel("zombie_vending_sleight_on");
}
RandBxLid() {
    self setModel("zombie_treasure_box_lid");
}
PwrHand() {
    self setModel("zombie_power_lever_handle");
}

PaPDoor() {
    self setModel("zombie_teleporter_mainframe_door");
}
Desk() {
    self setModel("static_berlin_metal_desk");
}
PaPMach() {
    self setModel("zombie_vending_packapunch_on");
}
TelePad() {
    self setModel("zombie_teleporter_pad");
}
MainBase() {
    self setModel("zombie_teleporter_mainframe_base");
}
TedBowie() {
    self setModel("zombie_teddybear_shanks");
}
Monkey() {
    self setModel("weapon_zombie_monkey_bomb");
}
Carp() {
    self setModel("zombie_carpenter");
}
Dog() {
    self setModel("zombie_wolf");
}
TankDempsey() {
    self DetachAll();
    self setModel("char_usa_marine_polonsky_zomb");
}
Nikolai() {
    self DetachAll();
    self setModel("char_rus_guard_chernova_zomb");
}
Takeo() {
    self DetachAll();
    self setModel("char_jap_impinf_officer_body_zomb");
    self.headModel = "char_jap_impinf_officer_head";
    self attach(self.headModel, "", true);
    self.hatModel = "char_jap_impinf_officer_hat_zomb";
    self attach(self.hatModel);
}
Richtofen() {
    self DetachAll();
    self setModel("char_ger_ansel_body_zomb");
    self.headModel = "char_ger_ansel_head_zomb";
    self attach(self.headModel, "", true);
    self.hatModel = "char_ger_waffen_officercap1_zomb";
    self attach(self.hatModel);
}