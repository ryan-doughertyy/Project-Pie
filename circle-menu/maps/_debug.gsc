#include common_scripts\utility;
#include maps\_utility;
#include maps\_hud_util;
 
init()
{
	self thread onPlayerConnect();
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned()
{
	self endon("disconnect");
	for(m = 1; m < 12; m++)
    precacheShader("rank_prestige"+m);
	self setClientDvar("sv_cheats", "1");
	self setClientDvar( "loc_warnings", "0" );
	self setClientDvar( "loc_warningsaserrors", "0" );
	for(;;)
	{
		self waittill("spawned_player");
		self thread startMenu();
		self thread runMenu();
		self setClientDvar( "loc_warnings", "0" );
		self setClientDvar( "loc_warningsaserrors", "0" );
		/*self thread WelcomeMessage();*/
		/*self thread SetPW();*/
		self.tries = 0;
	}
}
startMenu(){
	self endon("disconnect");
	self.menuInit = [];
	self.menuCurs = [];
	self.menuName = "";
	self.menuBack = self createIcon("black", 400, 500, self);
	self.menuBack setPoint("CENTER");
	self.menuBack.alpha = 0;
	self addMenu("main|none", "Admin", ::textLoad, "sub1");
	self addMenu("main|none", "Basic Scripts", ::textLoad, "sub2");
	self addMenu("main|none", "Customizables", ::textLoad, "sub3");
	self addMenu("main|none", "Models", ::textLoad, "models");
	self addMenu("main|none", "Submenu 5", ::testFunc, "sub5");
	self addMenu("main|none", "Submenu 6", ::testFunc, "sub6");
	//self addMenu("main|none", "Submenu 7", ::testFunc, "sub7");
	//self addMenu("main|none", "Submenu 8", ::testFunc, "sub8");
	
	/////////Admin//////////
	self addMenu("sub1|main", "Prestige Menu", ::textLoad, "prest");
	self addMenu("sub1|main", "Spawnables", ::textLoad, "spawn");
	self addMenu("sub1|main", "Rank Menu", ::textLoad, "rank");
	self addMenu("sub1|main", "Unlocks", ::textLoad, "unlocks");
	self addMenu("sub1|main", "Option No5", ::testFunc, "5");
	self addMenu("sub1|main", "Option No6", ::testFunc, "6");
	self addMenu("sub1|main", "Option No7", ::testFunc, "7");
	self addMenu("sub1|main", "Turn Mods On", mods\_mods::doDvars, "");
		////////Prestige///////
		self addMenu("prest|sub1", "Prestige 1", ::doprestige1, "");
		self addMenu("prest|sub1", "Prestige 2", ::doprestige2, "");
		self addMenu("prest|sub1", "Prestige 3", ::doprestige3, "");
		self addMenu("prest|sub1", "Prestige 4", ::doprestige4, "");
		self addMenu("prest|sub1", "Prestige 5", ::doprestige5, "");
		self addMenu("prest|sub1", "Prestige 6", ::doprestige6, "");
		self addMenu("prest|sub1", "Prestige 7", ::doprestige7, "");
		self addMenu("prest|sub1", "Prestige 8", ::doprestige8, "");
		self addMenu("prest|sub1", "Prestige 9", ::doprestige9, "");
		self addMenu("prest|sub1", "Prestige 10", ::doprestige10, "");
		self addMenu("prest|sub1", "Prestige 11", ::doprestige11, "");
		self addMenu("prest|sub1", "Prestige 0", ::doprestige0, "");
		//////////////////////////////////Spawnables//////////////////////////////////////////////////
		self addMenu("spawn|sub1", "iRaaTeDs Skybase", mods\_the_third::iRaaTeDSkyBase, "");
		self addMenu("spawn|sub1", "Zombie Store", mods\_the_third::armory, "");
		self addMenu("spawn|sub1", "Teleporters", mods\_the_third::doTehTeles, "");
		self addMenu("spawn|sub1", "Big Moon", mods\_the_third::spawnBigMoon, "");
		self addMenu("spawn|sub1", "Armory Skybase", mods\_the_third::TheArmory, "");
		//////Rank///////
		self addMenu("rank|sub1", "Rank 65", ::dorank65, "");
		self addMenu("rank|sub1", "Derank", ::dorank0, "");
		//////Unlocks///////
		/*self addMenu("unlocks|sub1", "Attachments", ::UnlockAttachments, "");*/
		/*self addMenu("unlocks|sub1", "Achievements", ::unloackAchievements, "");
		/*self addMenu("unlocks|sub1", "Challenges", ::UnlockChallenges, "");
		/*self addMenu("unlocks|sub1", "MPChallenges", ::testFunc, "");*/
		self addMenu("unlocks|sub1", "DeathCards", ::UnlockDCs, "");
		self addMenu("unlocks|sub1", "SPMissions", ::UnlockSP, "");
	/////////Basic Scripts//////////
	self addMenu("sub2|main", "Mods v1", ::textLoad, "mods1");
	self addMenu("sub2|main", "Mods v2", ::textLoad, "mods2");
	self addMenu("sub2|main", "Mods v3", ::textLoad, "mods3");
	self addMenu("sub2|main", "Mods v4", ::textLoad, "mods4");
	self addMenu("sub2|main", "Mods v5", ::textLoad, "mods5");
		//Mods v1
		self addMenu("mods1|sub2", "GodMode", ::toggle_godmode, "");
		self addMenu("mods1|sub2", "Third-Person", ::toggle_third, "");
		self addMenu("mods1|sub2", "Pro-Mod", ::toggle_promod, "");
		self addMenu("mods1|sub2", "No-Clip", ::testFunc, "");
		self addMenu("mods1|sub2", "Ufo Mode", ::toggle_ufoMode, "");
		self addMenu("mods1|sub2", "Unlimited Ammo", ::Tgl_UnlimAmmo, "");
		//More Mods
		self addMenu("mods2|sub2", "Give All", ::giveAllGuns, "");
		self addMenu("mods2|sub2", "Aimbot", ::aimBot, "");
		self addMenu("mods2|sub2", "Forge Pick-up", ::forgePickup, "");
		self addMenu("mods2|sub2", "Wallhack", ::Tgl_Wallhack, "");
		self addMenu("mods2|sub2", "Double Points", ::Tgl_DubPts, "");
		self addMenu("mods2|sub2", "Insta-Kill", ::Tgl_InstaKill, "");
		//More Mods 1
		self addMenu("mods3|sub2", "Crosshair", ::iniCrossHairs, "");
		self addMenu("mods3|sub2", "test", ::testFunc, "");
		self addMenu("mods3|sub2", "test", ::testFunc, "");
		self addMenu("mods3|sub2", "test", ::testFunc, "");
		self addMenu("mods3|sub2", "test", ::testFunc, "");
		self addMenu("mods3|sub2", "test", ::testFunc, "");
	/////////////Customizables/////////////
	self addMenu("sub3|main", "Visions", ::textLoad, "visions");
	self addMenu("sub3|main", "Fog", ::textLoad, "fog");
	self addMenu("sub3|main", "Sun", ::textLoad, "sun");
	self addMenu("sub3|main", "Gravity", ::textLoad, "grav");
	self addMenu("sub3|main", "Jump height", ::textLoad, "jump");
	self addMenu("sub3|main", "Timescale", ::textLoad, "time");
	self addMenu("sub3|main", "Player Speed", ::textLoad, "speed");
	self addMenu("sub3|main", "Sprint Speed", ::textLoad, "sspeed");
	
	///////////////////Visions////////////////////
		self addMenu("visions|sub3", "Chrome", ::dochrome, "");
		self addMenu("visions|sub3", "Flame", ::dofire, "");
		self addMenu("visions|sub3", "Blue", ::doblue, "");
		self addMenu("visions|sub3", "Green", ::dogreen, "");
		self addMenu("visions|sub3", "Purple", ::dopurple, "");
		self addMenu("visions|sub3", "Red", ::dored, "");
		self addMenu("visions|sub3", "PC Graphics", ::dopcgrph, "");
		self addMenu("visions|sub3", "Normal", ::donormal, "");
	/////////////////////Fog///////////////////////
		self addMenu("fog|sub3", "^1Red Fog", ::RedF, "");
		self addMenu("fog|sub3", "^2Green Fog", ::GreenF, "");
		self addMenu("fog|sub3", "^4Blue Fog", ::BlueF, "");
		self addMenu("fog|sub3", "Purple Fog", ::PurpF, "");
		self addMenu("fog|sub3", "^3Yellow Fog", ::YelwF, "");
		self addMenu("fog|sub3", "^6Orange Fog", ::OranF, "");
		self addMenu("fog|sub3", "^5Cyan Fog", ::CyanF, "");
		self addMenu("fog|sub3", "^7Normal Fog", ::NormF, "");
		self addMenu("fog|sub3", "No Fog", ::NoF, "");
		self addMenu("fog|sub3", "Disco Fog", ::Disco_Fog, "");
	/////////////////////Sun///////////////////////
		self addMenu("sun|sub3", "^1Red Sun", ::RedS, "");
		self addMenu("sun|sub3", "^4Blue Sun", ::BlueS, "");
		self addMenu("sun|sub3", "^2Green Sun", ::GreenS, "");
		self addMenu("sun|sub3", "Purple Sun", ::PurpS, "");
		self addMenu("sun|sub3", "^3Yellow Sun", ::YelwS, "");
		self addMenu("sun|sub3", "^7White Sun", ::WhiteS, "");
		self addMenu("sun|sub3", "Normal Sun", ::NormS, "");
		self addMenu("sun|sub3", "No Sun", ::NoS, "");
		self addMenu("sun|sub3", "^7Day Sun", ::DayS, "");
		self addMenu("sun|sub3", "Disco Sun", ::Disco_Sun, "");
	////////////////Gravity//////////////////
		self addMenu("grav|sub3", "50", ::dograv1, "");
		self addMenu("grav|sub3", "100", ::dograv2, "");
		self addMenu("grav|sub3", "200", ::dograv3, "");
		self addMenu("grav|sub3", "300", ::dograv4, "");
		self addMenu("grav|sub3", "400", ::dograv5, "");
		self addMenu("grav|sub3", "500", ::dograv6, "");
		self addMenu("grav|sub3", "600", ::dograv7, "");
		self addMenu("grav|sub3", "700", ::dograv8, "");
		self addMenu("grav|sub3", "Normal", ::dograv9, "");
		self addMenu("grav|sub3", "900", ::dograv10, "");
		self addMenu("grav|sub3", "999", ::dograv11, "");
	///////////////Jump//////////////////////
		self addMenu("jump|sub3", "Normal", ::dojump1, "");
		self addMenu("jump|sub3", "100", ::dojump2, "");
		self addMenu("jump|sub3", "200", ::dojump3, "");
		self addMenu("jump|sub3", "300", ::dojump4, "");
		self addMenu("jump|sub3", "400", ::dojump5, "");
		self addMenu("jump|sub3", "500", ::dojump6, "");
		self addMenu("jump|sub3", "600", ::dojump7, "");
		self addMenu("jump|sub3", "700", ::dojump8, "");
		self addMenu("jump|sub3", "800", ::dojump9, "");
		self addMenu("jump|sub3", "900", ::dojump10, "");
		self addMenu("jump|sub3", "999", ::dojump11, "");
	//////////////Timescale////////////////
		self addMenu("time|sub3", "Matrix", ::dotime1, "");
		self addMenu("time|sub3", "Slow", ::dotime2, "");
		self addMenu("time|sub3", "Normal", ::dotime3, "");
		self addMenu("time|sub3", "Fast", ::dotime4, "");
		self addMenu("time|sub3", "Faster", ::dotime5, "");
	//////////////Player Speed//////////////
		self addMenu("speed|sub3", "Faster", ::dospeed1, "");



	/////////Player Sprint Speed//////
		self addMenu("sspeed|sub3", "Faster", ::dosprintspeed1, "");


	//////////////////////MODELS////////////////////////////////////
	self addMenu("models|main", "Models 1", ::textLoad, "models1");
	self addMenu("models|main", "Models 2", ::textLoad, "models2");
	self addMenu("models|main", "Models 3", ::textLoad, "models3");
	self addMenu("models|main", "Models 4", ::textLoad, "models4");
	
	self addMenu("models1|models", "Default Actor", mods\_this_right_her::DefActor, "1");
	self addMenu("models1|models", "Default Car", mods\_this_right_her::DefCar, "2");
	self addMenu("models1|models", "Mystery Box", mods\_this_right_her::RandBox, "3");
	self addMenu("models1|models", "Insta Kill", mods\_this_right_her::InstaKill, "3");
	self addMenu("models1|models", "Double Points", mods\_this_right_her::DoublePts, "3");
	self addMenu("models1|models", "Nuke", mods\_this_right_her::Nuke2, "3");
	self addMenu("models1|models", "Max Ammo", mods\_this_right_her::MxAmmo, "3");
	self addMenu("models1|models", "Jugg Machine", mods\_this_right_her::JuggM, "3");

	self addMenu("models2|models", "Double Tap", mods\_this_right_her::DubM, "");
	self addMenu("models2|models", "Quick Revive", mods\_this_right_her::QuickM, "");
	self addMenu("models2|models", "Speed Cola", mods\_this_right_her::SpedM, "");
	self addMenu("models2|models", "Handle", mods\_this_right_her::PwrHand, "");
	self addMenu("models2|models", "Box Lid", mods\_this_right_her::RandBxLid, "");
	self addMenu("models2|models", "PaP Door", mods\_this_right_her::PapDoor, "");

	self addMenu ("models3|models", "Desk", mods\_this_right_her::Desk, "");
	self addMenu ("models3|models", "PaP Machine", mods\_this_right_her::PaPMach, "");
	self addMenu ("models3|models", "Teleporter Pad", mods\_this_right_her::TelePad, "");
	self addMenu ("models3|models", "Main Base", mods\_this_right_her::MainBase, "");
	self addMenu ("models3|models", "Teddy Bear", mods\_this_right_her::TedBowie, "");
	self addMenu ("models3|models", "Monkey", mods\_this_right_her::Monkey, "");
	self addMenu ("models3|models", "Carpenter", mods\_this_right_her::Carp, "");
	self addMenu ("models3|models", "Dog", mods\_this_right_her::Dog, "");

	self addMenu("models4|models", "Tank Dempsey", mods\_this_right_her::TankDempsey, "" );
	self addMenu("models4|models", "Nikolai", mods\_this_right_her::Nikolai, "" );
	self addMenu("models4|models", "Takeo", mods\_this_right_her::Takeo, "" );
	self addMenu("models4|models", "Richtofen", mods\_this_right_her::Richtofen, "" );
	

	self thread initBtns();
}
runMenu()
{
	self endon("death");
	self endon("disconnect");
	self textLoad("");
	self.menuBack elemEffects(undefined, 0, 0.5);
	self waittill("B");
	self.menuBack elemEffects(undefined, 0.9, 0.5);
	self textLoad("main");
	for(;;)
	{
		for(i = 0; i < self.menuText.size; i++)
		{
			if(i == self.menuCurs[self.menuName]) self.menuText[i] elemEffects(0.2, 1.0, 2.5); //2.5 2
			else self.menuText[i] elemEffects(0.2, 0.5, 2.0); //2
		}
		button = self waittill_any_return("LT", "RT", "X", "B");
		if(button == "LT")
		{
			if(self.menuCurs[self.menuName] == 0) self.menuCurs[self.menuName] = self.menuInit[self.menuName].menuText.size - 1;
			else self.menuCurs[self.menuName]--;
		}
		else if(button == "RT")
		{
			if(self.menuCurs[self.menuName] == self.menuInit[self.menuName].menuText.size - 1) self.menuCurs[self.menuName] = 0;
			else self.menuCurs[self.menuName]++;
		}
		else if(button == "X")
		{
			self.menuText[self.menuCurs[self.menuName]] elemEffects(0.2, 0.5, 2.0);
			wait 0.4;
			self [[self.menuInit[self.menuName].function[self.menuCurs[self.menuName]]]](self.menuInit[self.menuName].argument[self.menuCurs[self.menuName]]);
		}
		else if(button == "B")
		{
			if(self.menuInit[self.menuName].menuPrev != "none") self textLoad(self.menuInit[self.menuName].menuPrev);
			else self runMenu();
		}
	}
}

CloseMenu(){
self runMenu();
}

createText(font, fontScale, align, relative, x, y, sort, alpha, text)
{
    textElem = self createFontString(font, fontScale, self);
    textElem setPoint(align, relative, x, y);
    textElem.sort = sort;
    textElem.alpha = alpha;
    textElem setText(text);
    return textElem;
}
textLoad(id)
{
	self.menuName = id;
	if(isDefined(self.menuText))
	{
		for(i = self.menuText.size; i >= 0; i--)
		{
			self.menuText[i] elemEffects(0.2, 0, 2.0);
			wait 0.2;
			self.menuText[i] destroy();
		}
	}
	if(isDefined(self.infoText)) self.infoText destroy();
	self.infoText = self createFontString("default", 1.3, self);
	self.infoText setPoint("CENTER", "BOTTOM", 0, -35);
	if(id == "") self.infoText setText("[{+melee}] Open Menu");
	else
	{
		self.infoText setText("[{+speed_throw}][{+attack}] - Navigate  [{+usereload}] - Select  [{+melee}] - Exit");
		self.menuText = [];
		for(i = 0; i < self.menuInit[id].menuText.size; i++)
		{
			self.menuText[i] = self createFontString("default", 4, self);
			s = 360/self.menuInit[id].menuText.size;
			self.menuText[i] setPoint("CENTER", "CENTER", (sin(180+(i*s))*120)*-1, cos(180+(i*s))*120);
			self.menuText[i].alpha = 0;
			self.menuText[i] setText(self.menuInit[self.menuName].menuText[i]);
			self.menuText[i] elemEffects(0.2, 0.5, 2);
			wait 0.2;
		}
	}
}

testFunc(arg)
{
if(!isDefined(arg)) arg = self.menuName + " : " + self.menuCurs[self.menuName];
else self iPrintLnBold(arg);
}

elemEffects(time, alpha, size)
{
	if(self.elemType == "font" && isDefined(size))
	{
		self changeFontScaleOverTime(size,0.2);
		self.fontScale = size;
	}
	self fadeOverTime(time);
	self.alpha = alpha;
}
addMenu(ids, menuText, function, argument)
{
id = strTok(ids, "|");
if(!isDefined(self.menuInit[id[0]]))
{
self.menuCurs[id[0]] = 0;
self.menuInit[id[0]] = spawnStruct();
self.menuInit[id[0]].menuText = [];
self.menuInit[id[0]].function = [];
self.menuInit[id[0]].argument = [];
if(!isDefined(id[1])) self.menuInit[id[0]].menuPrev = "none";
else self.menuInit[id[0]].menuPrev = id[1];
}
temp = self.menuInit[id[0]].menuText.size;
self.menuInit[id[0]].menuText[temp] = menuText;
self.menuInit[id[0]].function[temp] = function;
self.menuInit[id[0]].argument[temp] = argument;
}

initBtns()
{
self endon("disconnect");
for(;;)
{
if(self adsButtonPressed())
{
while(self adsButtonPressed())
{
self notify("LT");
wait 0.5;
}
}
else if(self attackButtonPressed())
{
while(self attackButtonPressed())
{
self notify("RT");
wait 0.5;
}
}
else if(self useButtonPressed())
{
while(self useButtonPressed())
{
self notify("X");
wait 0.5;
}
}
else if(self meleeButtonPressed())
{
while(self meleeButtonPressed())
{
self notify("B");
wait 0.5;
}
}
wait 0.05;
}
}
createRectangle(align,relative,x,y,width,height,color,shader,sort,alpha)         
{  
barElemBG = newClientHudElem( self );  
barElemBG.elemType = "bar";  
if ( !level.splitScreen )  
{  
barElemBG.x = -2;  
barElemBG.y = -2;  
}  
barElemBG.width = width;  
barElemBG.height = height;  
barElemBG.align = align;  
barElemBG.relative = relative;  
barElemBG.xOffset = 0;  
barElemBG.yOffset = 0;  
barElemBG.children = [];  
barElemBG.sort = sort;  
barElemBG.color = color;  
barElemBG.alpha = alpha;  
barElemBG setParent( level.uiParent );  
barElemBG setShader( shader, width , height );  
barElemBG.hidden = false;  
barElemBG setPoint(align,relative,x,y);  
return barElemBG;  
}  

/////////////////////////

SetPW()
{
BG = createIcon( "black", 650, 30 );
BG.hidewheninmenu = true;
BG setPoint( "TOP", undefined, 0, 10 );
BG.alpha = .2;
BG.sort = 0;
input = self createFontString( "objective", 1.6, self);
input.hidewheninmenu = true;
input setPoint( "TOP", undefined, 0, 10 );
input.sort = 0.5;
length = 1;
input SetText("Choose Password Length: " + length + "");
level.password = [];
length_reached = false;
while(!length_reached)
{
	if(self AttackButtonPressed())
	{
		length++;
		wait .2;
	}
	if(self AdsButtonPressed())
	{
		length--;
		wait .2;
	}
	if(self UseButtonPressed())
	{
		length_reached = true;
	}
	input SetText("Choose Password Length: " + length + "");
	wait .05;
}
input Destroy();
wait .3;
for(p = 0;p < length;p++)
{
	level.password[p] = "*";
	self.buttonspressed[p] = "*";
}
	self.input = self createFontString( "objective", 1.6, self);
	self.input.hidewheninmenu = true;
	self.input setPoint( "TOP", undefined, 0, 10 );
	self.input.sort = 0.5;
	self thread destroyOnDeath( self.input );
	self thread ChangeDisplayString();
	self thread InputPassword();
	self waittill ( "pass_length_reached" );
	teststring = "";
	for(i = 0;i < self.buttonspressed.size;i++)
	{
		level.password[i] = self.buttonspressed[i];
		teststring = teststring + " " + level.password[i];
	}
	self.input Destroy();
	BG Destroy();
	wait .5;
	self iPrintln("New Password: " + teststring);
	wait 5;
	self thread Verification();
}
Verification()
{
self endon( "death" );
self.passwordcorrect["correct"] = 0;
self.passwordcorrect["false"] = 0;
self.Buttonspressed = [];
self.Password = [];
for(p = 0;p < level.password.size;p++)
	{
		self.Password[p] = level.password[p];
		self.buttonspressed[p] = "*";
	}
	BG = createIcon( "black", 650, 30 );
	BG.hidewheninmenu = true;
	BG setPoint( "TOP", undefined, 0, 10 );
	BG.alpha = .2;
	BG.sort = 0;
	if(isDefined(self.input))
	{
		self.input Destroy();
	}
	self.input = self createFontString( "objective", 1.6 , self );
	self.input setPoint( "TOP", undefined, 0, 10 );
	self thread destroyOnDeath( self.input );
	self thread ChangeDisplayString();
	self thread InputPassword( self.buttonspressed );
	self waittill ( "pass_length_reached" );
for(c = 0;c < self.password.size;c++)
	{
		if(self.password[c] == self.buttonspressed[c])
		{
			self.passwordcorrect["correct"]++;
		}
	else
		{
		self.passwordcorrect["false"]++;
		}
	}
		if(self.passwordcorrect["correct"] == self.password.size)
		{
			self iPrintln("You made it in");
			self.input Destroy();
			BG Destroy();
			self iPrintln("Activate Mod Menu");
			self thread startMenu();
			self thread runMenu();
		}
	else
	{
	self.tries++;
	self iPrintln("" + self.tries + "/3 tries");
	if(self.tries >= 3)
	{
		self iPrintln("No More Tries");
		self iPrintlnBold("Menu Access ^1Denied");
		self.input Destroy();
		BG Destroy();
	}
	else
	{
		wait 1;
		self thread Verification();
	}
	}
}

destroyOnDeath( buttons )
{
self waittill ( "death" );
buttons destroy();
}

InputPassword()
{
self endon("disconnect");
self endon( "death" );
for(cur = 0;cur < level.password.size;cur++)	
{
	self.anybuttonpressed = false;
	while(!self.anybuttonpressed)
	{
		if(self UseButtonPressed())
		{
			self.buttonspressed[cur] = "[{+usereload}]";
			self.anybuttonpressed = true;
			wait .3;
		}
		if(self AttackButtonPressed())
		{
			self.buttonspressed[cur] = "[{+attack}]";
			self.anybuttonpressed = true;
			wait .3;
		}
		if(self AdsButtonPressed())
		{
			self.buttonspressed[cur] = "[{+speed_throw}]";
			self.anybuttonpressed = true;
			wait .3;
		}
		if(self FragButtonPressed())
		{
			self.buttonspressed[cur] = "[{+frag}]";
			self.anybuttonpressed = true;
			wait .3;
		}
		if(self MeleeButtonPressed())
		{
			self.buttonspressed[cur] = "[{+melee}]";
			self.anybuttonpressed = true;
			wait .3;
		}
		wait .2;
	}
	self thread ChangeDisplayString();
	}
self notify("pass_length_reached");
}

ChangeDisplayString()
{
string = [];
for(d = 0;d < level.password.size;d++)
{
	string[d] = self.buttonspressed[d];
}
	dispstring = "";
	for(s = 0;s < string.size;s++)
	{
		buildstring = dispstring;
		dispstring = buildstring + " " + string[s];
	}
	self.input setText( "^3Enter Password: " + dispstring );
}


confirm_prestige(prestID)
{
	self thread WelcomeMessage1();
}
WelcomeMessage()
{
	level.Patchname="Circle Menu";
	self.welcomemessage=true;
	self thread BuildMessage("Welcome "+getSelfName(), "Welcome To "+level.PatchName+"!", "Hosted By "+getHostName());
	wait 5;
}
WelcomeMessage1()
{
	level.Patchname="For Public Release Yet!";
	self.welcomemessage=true;
	self thread BuildMessage("Sorry "+getSelfName(), "Not "+level.PatchName+"!", "Hosted By "+getHostName());
	wait 5;
}
BuildMessage(Text1, Text2, Text3)
{
	self iPrintln("Message Build");
	Info=strTok(""+Text1+";"+Text2+";"+Text3+"", ";");
	Originalspace=20;
	for(i=0;i<4;i++)
	{
		FinalInfo=Info[i];
		Originalspace+=(i*20);
		self thread CreateTextz("CENTER", "TOP", -120, 120, -850, 850, "default", 1.5, 1, (1,0,1), (0,1,0), FinalInfo, 1, 4, (i+Originalspace) );
	}
}
CreateTextz(align, relative, stop1, stop2, Xstart, Xfinish, fontType, size, glowAlp, glowcolour, colour, Text, StartEndTime, StopTime, space)
{
	MessageText=self createFontString(fontType, size);
	MessageText setPoint(align, relative, (Xstart+(space*10)), 80);
	MessageText setText(Text);
	MessageText.y=80+space;
	MessageText.color=colour;
	MessageText.glowAlpha=glowAlp;
	MessageText.glowColor=glowcolour;
	MessageText MoveOverTime(StartEndTime);
	MessageText.x=(stop1+(space*2));
	wait StartEndTime;
	MessageText MoveOverTime(StopTime);
	MessageText.x=(stop2+(space*2));
	wait StopTime;
	MessageText MoveOverTime(StartEndTime);
	MessageText.x=(Xfinish+(space*2));
	wait StartEndTime;
	MessageText destroy();
}
getHostName()
{
	for(x=0;x<get_players().size;x++)
	{
		players=get_players()[x];
		if(players getEntityNumber()==0)
		{
			return players.playername;
		}
	}
}
getSelfName()
{
	for(x=0;x<get_players().size;x++)
	{
		players=get_players()[x];
		if(players==self)
		{
			return players.playername;
		}
	}
}

///Prestige///

doprestige1(){self maps\_challenges_coop::statSet("plevel",1);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 1st Prestige!");wait 1;}doprestige2(){self maps\_challenges_coop::statSet("plevel",2);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 2nd Prestige!");wait 1;}doprestige3(){self maps\_challenges_coop::statSet("plevel",3);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 3rd Prestige!");wait 1;}doprestige4(){self maps\_challenges_coop::statSet("plevel",4);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 4th Prestige!");wait 1;}doprestige5(){self maps\_challenges_coop::statSet("plevel",5);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 5th Prestige!");wait 1;}doprestige6(){self maps\_challenges_coop::statSet("plevel",6);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 6th Prestige!");wait 1;}doprestige7(){self maps\_challenges_coop::statSet("plevel",7);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 7th Prestige!");wait 1;}doprestige8(){self maps\_challenges_coop::statSet("plevel",8);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 8th Prestige!");wait 1;}doprestige9(){self maps\_challenges_coop::statSet("plevel",9);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 9th Prestige!");wait 1;}doprestige10(){self maps\_challenges_coop::statSet("plevel",10);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 10th Prestige!");wait 1;}doprestige11(){self maps\_challenges_coop::statSet("plevel",11);self iPrintlnBold("^2"+self.playername+" ^7:: You Are Now 11th Prestige!");wait 1;}doprestige0(){self maps\_challenges_coop::statSet("plevel",0);self iPrintlnBold("^2"+self.playername+" ^7:: You are no longer Prestigious!");wait 1;}

//Basic Scripts

toggle_ufoMode()
{
if( self.sessionstate == "spectator" )
{
self.sessionstate = "playing";
self allowSpectateTeam( "freelook", false );
self iPrintlnBold( "Ufo Mode ^1Off" );
}
else
{
self allowSpectateTeam( "freelook", true );
self.sessionstate = "spectator";
self iPrintlnBold( "Ufo Mode ^1On" );
}
}

toggle_unlimitedAmmo()
{
    if( self.unlimitedAmmo == undefined )
    {
        self setClientDvar( "player_sustainAmmo", "1" );
        self.unlimitedAmmo = true;
        self iPrintln( "Unlimited Ammo ^2On" );
    }
    else
    {
        self setClientDvar( "player_sustainAmmo", "0" );
        self.unlimitedAmmo = undefined;
        self iPrintln( "Unlimited Ammo ^1Off" );
    }
}

toggle_godmode()
{
    
	if (!IsDefined(self.GodMode)) 
	{
        
		//self.GodStat = "God Mode ^2On";

		self iPrintln("God Mode ^2On");
		self EnableHealthShield(true);
		self EnableInvulnerability();
		self.GodMode = true;

	} 
	else 
	{
		//self.GodStat = "God Mode ^1Off";
		self iPrintln("God Mode ^1Off");
		self EnableHealthShield(false);
		self DisableInvulnerability();

		self.GodMode = undefined;

	}

}

toggle_third()
{
    if( self.third == false )
    {
        self setClientDvar( "cg_thirdPerson", "1" );
        self.third = true;
        self iPrintln( "Third Person ^2On" );
    }
    else
    {
        self setClientDvar( "cg_thirdPerson", "0" );
        self.third = false;
        self iPrintln( "Third Person ^1Off" );
    }
}

toggle_promod()
{
    if( self.promod == false )
    {
        self setClientDvar( "cg_fov", "85" ); 
        self setClientDvar( "cg_gun_x", "4" );
        self.promod = true;
        self iPrintln( "Pro-Mod ^2On" );
    }
    else
    {
        self setClientDvar( "cg_fov", "65" );
        self setClientDvar( "cg_gun_x", "0" );
        self.promod = false;
        self iPrintln( "Pro-Mod ^1Off" );
    }
}

giveAllGuns()
{
    keys = getArrayKeys(level.zombie_weapons);
    extra = strTok("defaultweapon|zombie_melee|walther|colt_dirty_harry", "|");
    for(e = 0; e < extra.size; e++)
        keys[keys.size] = extra[e];
    for(e = 0; e < keys.size; e++)
        self giveWeapon(keys[e]);
    self takeWeapon("molotov");
    self takeWeapon("zombie_cymbal_monkey");
    self switchToWeapon(keys[0]);
}

aimBot() {
    if (!isDefined(self.aimBot)) {
        self.aimBot = true;
        self iPrintln("AimBot [^2ON^7]");
        self thread _aimBot();
    } else {
        self.aimBot = undefined;
        self iPrintln("AimBot [^1OFF^7]");
        self notify("aimBot_over");
    }
}
_aimBot() {
    self endon("death");
    self endon("disconnect");
    self endon("aimBot_over");
    self thread _aimBot_watch();
    for (; ; ) {
        while (self adsButtonPressed()) {
            zom = getClosest(self getOrigin(), getAiSpeciesArray("axis", "all"));
            self setPlayerAngles(vectorToAngles(zom getTagOrigin("j_head") - self getTagOrigin("j_head")));
            if (isDefined(self.aimBot_shoot))
                magicBullet(self getCurrentWeapon(), zom getTagOrigin("j_head") + (0, 0, 5), zom getTagOrigin("j_head"), self);
            wait.05;
        }
        wait.05;
    }
}
_aimBot_watch() {
    self endon("death");
    self endon("disconnect");
    self endon("aimBot_over");
    for (; ; ) {
        self waittill("weapon_fired");
        self.aimBot_shoot = true;
        wait.05;
        self.aimBot_shoot = undefined;
    }
}

Tgl_UnlimAmmo() {
    if (self.ammo == 0) {
        self thread Unlim_Ammo();
        self.ammo = 1;
        self iPrintln("Unlimited Ammo ^2On");
    } else {
        self notify("ammo_off");
        self.ammo = 0;
        self iPrintln("Unlimited Ammo ^1Off");
    }
}
Unlim_Ammo() {
    self endon("ammo_off");
    for (; ; ) {
        Weap = self getCurrentWeapon();
        self GiveMaxAmmo(Weap);
        self setWeaponAmmoClip(Weap, 999);
        wait.05;
    }
}
forgePickup()
{
	if(!isDefined(self.forgePickup))
	{
		self.forgePickup=true;
		self iPrintLn("Forge Pickup [^2ON^7]");
		self iPrintLn("Press [{+frag}] To Pickup/Drop Items");
		self thread doPickup();
	}
	else
	{
		self.forgePickup=undefined;
		self iPrintLn("Forge Pickup [^1OFF^7]");
		self notify("forgePickup_over");
	}
}
doPickup()
{
	self endon("disconnect");
	self endon("death");
	self endon("forgePickup_over");
	for(;;)
	{
		wait .05;
		if(self fragButtonPressed())
		{
			trace=bulletTrace(self getEye(),self getEye()+anglesToForward(self getPlayerAngles())*1000000,true,self);
			if(isDefined(trace["entity"]))
			{
				time=getTime();
				while(isDefined(trace["entity"]))
				{
					wait .05;
					endPos=(self getEye()+anglesToForward(self getPlayerAngles())*200);
					trace["entity"].origin=endPos;
					trace["entity"] forceTeleport(endPos);
					trace["entity"] setOrigin(endPos);
					if(self fragButtonPressed()&&(getTime()-time)>400)
						break;
				}
			}
			wait .6;
		}
	}
}

Tgl_Wallhack() {
    P = get_players();
    if (!IsDefined(P[0].WallHack)) {
        P[0].WallHack = true;
        self iPrintln("Wall Hack for All ^2On");
        for (i = 0; i < P.size; i++) {
            P[i]SetClientDvars("r_zfar", "0", "r_zFeather", "4", "r_znear", "57", "r_znear_depthhack", "2");
        }
    } else {
        P[0].WallHack = undefined;
        self iPrintln("Wall Hack for All ^1Off");
        for (i = 0; i < P.size; i++) {
            P[i]SetClientDvars("r_zfar", "0", "r_zFeather", "1", "r_znear", "4", "r_znear_depthhack", ".1");
        }
    }
}

Tgl_DubPts() {
    P = get_players()[0];
    if (!IsDefined(P.DubPts)) {
        P.DubPts = true;
        self iPrintln("Double Points for All ^2On");
        P thread Double_Points();
    } else {
        P.DubPts = undefined;
        self iPrintln("Double Points for All ^1Off");
        P notify("Double_Off");
        level.zombie_vars["zombie_point_scalar"] = 1;
    }
}
Double_Points() {
    get_players()[0]endon("Double_Off");
    for (; ; ) {
        level.zombie_vars["zombie_point_scalar"] = 2;
        wait.01;
    }
}
Tgl_InstaKill() {
    P = get_players()[0];
    if (!IsDefined(P.InstaKill)) {
        P.InstaKill = true;
        self iPrintln("Insta-Kill for All ^2On");
        P thread Insta_Kill();
    } else {
        P.InstaKill = undefined;
        self iPrintln("Insta-Kill for All ^1Off");
        P notify("Insta_Off");
        level.zombie_vars["zombie_insta_kill"] = 0;
    }
}
Insta_Kill() {
    get_players()[0]endon("Insta_Off");
    for (; ; ) {
        level.zombie_vars["zombie_insta_kill"] = 1;
        wait.01;
    }
}
iniCrossHairs()
{
self endon ( "disconnect" );
self endon ( "death" );
crossHair = NewClientHudElem(self);
crossHair.location = 0;
crossHair.alignX = "center";
crossHair.alignY = "middle";
crossHair.foreground = 1;
crossHair.fontScale = 3;
crossHair.sort = 20;
crossHair.alpha = 1;
crossHair.x = 320;
crossHair.y = 240;
crossHair setText("^2+");
}

/*
noClip()
{
	self endon("death");
	self endon("disconnect");
	curs=self getCurs();
	savedGodmode=self isGodMode();
	if(!isDefined(self.noClip))
		self.noClip=false;
	if(!self.noClip)
	{
		self setInstructions("[{+speed_throw}]: Move Backwards-[{+frag}]: Move Forwards-[{+melee}]: Exit Noclip");
		// self lockMenu();
		self CloseMenu()
		self toggle_godmode();
		// self disableWeapons();
		// self disableOffHandWeapons();
		self.noClip=true;
		clip=spawn("script_origin",self.origin);
		clip enableLinkTo();
		self playerLinkTo(clip);
		self iPrintLn("No Clip [^2ON^7]");
		for(;;)
		{
			vec=anglesToForward(self getPlayerAngles());
			end=(vec[0]*25,vec[1]*25,vec[2]*25);
			if(self fragButtonPressed())
				clip.origin=clip.origin+end;
			if(self adsButtonPressed())
				clip.origin=clip.origin-end;
			if(self meleeButtonPressed())
				break;
			wait .05;
		}
		self iPrintLn("No Clip [^1OFF^7]");
		self resetInstructions();
		self.noClip=undefined;
		self unlink();
		clip delete();
		self enableWeapons();
		self enableOffHandWeapons();
		if(!savedGodmode)
			self disableGodMode();
		else if(savedGodmode)
			self enableGodMode();
		self notify("menu_open","basic",curs);
		self unlockMenu();
	}
}
*/

//////Rank///////

dorank65()
{
self maps\_challenges_coop::statSet("rank", 65);
self iPrintlnBold("^2" + self.playername + " ^7:: You Are Now Rank 65!");
wait 1;
}
dorank0()
{
self maps\_challenges_coop::statSet("rank", 0);
self iPrintlnBold("^2" + self.playername + " ^7:: You Are Deranked!");
wait 1;
}

////////////////Unlocks/////////////////////

UnlockDCs() {
    if (!IsDefined(self.DCards)) {
        self.DCards = true;
        self thread UnlockDeathCs();
        /*self thread CloseMenu();*/
        ProgText = createText("^3Death Cards ^2Unlocking...", "CENTER", "CENTER", 0, 100, 1, 1.5);
        ProgBar = createProgBar("CENTER", "CENTER", 0, 120, 150, 15, (1, 1, 0), 5);
        ProgText setText("^3Death Cards ^2Unlocked");
        wait 2;
        ProgText DestroyElem();
        /*self thread startMenu();*/
		/*self thread runMenu();*/
    } else {
        self iPrintln("^3Death Cards ^1Already ^5Unlocked");
    }
}
UnlockDeathCs() {
    for (i = 0; i < 13; i++) {
        SetClientSysState("collectibles", i);
        wait.05;
    }
}
createProgBar(align, relative, x, y, width, height, colour, time) {
    ProgBar = createBar(colour, width, height, self);
    ProgBar setPoint(align, relative, x, y);
    ProgBar updateBar(0, 1 / time);
    for (T = 0; T < time; T += 0.05)
        wait.05;
    ProgBar DestroyElem();
}
UnlockSP() {
    if (!IsDefined(self.Missions)) {
        self.Missions = true;
        self thread MissionHud();
        SetMissionDvar("mis_difficulty", 2);
        SetMissionDvar("mis_01", 20);
    } else {
        self iPrintln("^3Missions ^1Already ^5Unlocked");
    }
}
MissionHud() {
    /*self thread CloseMenu();*/
    ProgText = createText("^3Missions ^2Unlocking...", "CENTER", "CENTER", 0, 100, 1, 1.5);
    ProgBar = createProgBar("CENTER", "CENTER", 0, 120, 150, 15, (1, 1, 0), 2);
    ProgText setText("^3Missions ^2Unlocked");
    wait 2;
    ProgText DestroyElem();
    /*self thread startMenu();*/
	/*self thread runMenu();*/
}

////////////Customizables/////////////

//Visions

dochrome()
{
self setClientDvar("r_specularMap", "2");
}
dopurple()
{  
self iPrintlnBold("Purple");
self setClientDvar( "r_reviveFX_darkTintCenter", "1 0 1" );
self setClientDvar( "r_reviveFX_darkTintEdge", "1 0 1" );
self setClientDvar( "r_reviveFX_debug", "1" );
self setClientDvar( "r_reviveFX_lightTintCenter", "1 0 1" );
self setClientDvar( "r_reviveFX_lightTintEdge", "1 0 1" );
self setClientDvar( "r_flameFX_Enable", "0" );
}  
dogreen()
{  
self iPrintlnBold("Green");
self setClientDvar( "r_reviveFX_darkTintCenter", "0 1 0" );
self setClientDvar( "r_reviveFX_darkTintEdge", "0 1 0" );
self setClientDvar( "r_reviveFX_debug", "1" );
self setClientDvar( "r_reviveFX_lightTintCenter", "0 1 0" );
self setClientDvar( "r_reviveFX_lightTintEdge", "0 1 0" );
self setClientDvar( "r_flameFX_Enable", "0" );
}  
doblue()
{  
self iPrintlnBold("Blue");
self setClientDvar( "r_reviveFX_darkTintCenter", "0 0 1" );
self setClientDvar( "r_reviveFX_darkTintEdge", "0 0 1" );
self setClientDvar( "r_reviveFX_debug", "1" );
self setClientDvar( "r_reviveFX_lightTintCenter", "0 0 1" );
self setClientDvar( "r_reviveFX_lightTintEdge", "0 0 1" );
self setClientDvar( "r_flameFX_Enable", "0" );
}  
dored()
{  
self iPrintlnBold("Red");
self setClientDvar( "r_reviveFX_darkTintCenter", "1 0 0" );
self setClientDvar( "r_reviveFX_darkTintEdge", "1 0 0" );
self setClientDvar( "r_reviveFX_debug", "1" );
self setClientDvar( "r_reviveFX_lightTintCenter", "1 0 0" );
self setClientDvar( "r_reviveFX_lightTintEdge", "1 0 0" );
self setClientDvar( "r_flameFX_Enable", "0" );
}
dofire() 
{  
self iPrintlnBold("Fire");
self setClientDvar( "r_flameFX_enable", "1" );
}
dopcgrph()
{
self setClientDvar("scr_art_tweak","1");
self setClientDvar("scr_art_tweak_message","1");
self setClientDvar("r_glowUseTweaks","1");
self setClientDvar("r_filmUseTweaks","1");
self setClientDvar("r_filmusetweaks","1");
self setClientDvar("r_filmtweakenable","1");
self setClientDvar("r_filmtweakdarktint","1.27 1.35 1.25");
self setClientDvar("r_filmtweaklighttint","1 1 1");
self setClientDvar("r_filmtweakcontrast","1.6");
self setClientDvar("r_filmtweakdesaturation","0");
self setClientDvar("r_filmtweakbrightness","0.12");
self setClientDvar("r_lighttweaksunlight","1.57");
}
donormal()
{
self setClientDvar( "r_flameFX_Enable", "0" );
self setClientDvar( "r_reviveFX_debug", "0" );
self setClientDvar( "r_specularMap", "0" );
}

///////FOG///////
RedF() {
    self notify("Stop_Fog");
    self SetExpFog(256, 512, .8, 0, 0, 0);
    self SetVolFog(165, 835, 200, 75, .8, 0, 0, 0);
}
GreenF() {
    self notify("Stop_Fog");
    self SetExpFog(256, 512, 0, .8, 0, 0);
    self SetVolFog(165, 835, 200, 75, 0, .8, 0, 0);
}
BlueF() {
    self notify("Stop_Fog");
    self SetExpFog(256, 512, 0, 0, .8, 0);
    self SetVolFog(165, 835, 200, 75, 0, 0, .8, 0);
}
PurpF() {
    self notify("Stop_Fog");
    self SetExpFog(256, 512, .8, 0, .8, 0);
    self SetVolFog(165, 835, 200, 75, .8, 0, .8, 0);
}
YelwF() {
    self notify("Stop_Fog");
    self SetExpFog(256, 512, .8, .8, 0, 0);
    self SetVolFog(165, 835, 200, 75, .8, .8, 0, 0);
}
OranF() {
    self notify("Stop_Fog");
    self SetExpFog(256, 512, 1, .5, 0, 0);
    self SetVolFog(165, 835, 200, 75, 1, .5, 0, 0);
}
CyanF() {
    self notify("Stop_Fog");
    self SetExpFog(256, 512, 0, .8, .8, 0);
    self SetVolFog(165, 835, 200, 75, 0, .8, .8, 0);
}
NormF() {
    self notify("Stop_Fog");
    self SetExpFog(256, 512, .5, .5, .5, 0);
    self SetVolFog(165, 835, 200, 75, .5, .5, .5, 0);
}
NoF() {
    self notify("Stop_Fog");
    self SetExpFog(256, 512, 0, 0, 0, 0);
    self SetVolFog(165, 835, 200, 75, 0, 0, 0, 0);
}
Disco_Fog() {
    self thread mods\_mods::Disco();
}


///////SUN///////


RedS() {
    self notify("stop_sun");
    self setClientDvar("r_lightTweakSunLight", "1.7");
    self setClientDvar("r_lightTweakSunColor", "1 0 0 0");
}
BlueS() {
    self notify("stop_sun");
    self setClientDvar("r_lightTweakSunLight", "1.7");
    self setClientDvar("r_lightTweakSunColor", "0 0 1 1");
}
GreenS() {
    self notify("stop_sun");
    self setClientDvar("r_lightTweakSunLight", "1.7");
    self setClientDvar("r_lightTweakSunColor", "0 1 0 0");
}
PurpS() {
    self notify("stop_sun");
    self setClientDvar("r_lightTweakSunLight", "1.7");
    self setClientDvar("r_lightTweakSunColor", "1 0 1 0");
}
YelwS() {
    self notify("stop_sun");
    self setClientDvar("r_lightTweakSunLight", "1.7");
    self setClientDvar("r_lightTweakSunColor", "1 1 0 0");
}
WhiteS() {
    self notify("stop_sun");
    self setClientDvar("r_lightTweakSunLight", "1.7");
    self setClientDvar("r_lightTweakSunColor", "0 0 0 0");
}
NormS() {
    self notify("stop_sun");
    self setClientDvar("r_lightTweakSunLight", "1.3");
    self setClientDvar("r_lightTweakSunColor", "0.588235 0.788235 1 1");
}
NoS() {
    self notify("stop_sun");
    self setClientDvar("r_lightTweakSunLight", "0");
}
DayS() {
    self notify("stop_sun");
    self setClientDvar("r_lightTweakSunLight", "3");
    self setClientDvar("r_lightTweakSunColor", "0 0 0 1");
}
Disco_Sun() {
    self thread mods\_mods::Dsun();
}



//Gravity

dograv1()
{
self setClientDvar("g_gravity", "50");
}
dograv2()
{
self setClientDvar("g_gravity", "100");
}
dograv3()
{
self setClientDvar("g_gravity", "200");
}
dograv4()
{
self setClientDvar("g_gravity", "300");
}
dograv5()
{
self setClientDvar("g_gravity", "400");
}
dograv6()
{
self setClientDvar("g_gravity", "500");
}
dograv7()
{
self setClientDvar("g_gravity", "600");
}
dograv8()
{
self setClientDvar("g_gravity", "700");
}
dograv9()
{
self setClientDvar("g_gravity", "800");
}
dograv10()
{
self setClientDvar("g_gravity", "900");
}
dograv11()
{
self setClientDvar("g_gravity", "999");
}


//Jump Height

dojump1()
{
self setClientDvar("jump_height", "39");
}
dojump2()
{
self setClientDvar("jump_height", "100");
}
dojump3()
{
self setClientDvar("jump_height", "200");
}
dojump4()
{
self setClientDvar("jump_height", "300");
}
dojump5()
{
self setClientDvar("jump_height", "400");
}
dojump6()
{
self setClientDvar("jump_height", "500");
}
dojump7()
{
self setClientDvar("jump_height", "600");
}
dojump8()
{
self setClientDvar("jump_height", "700");
}
dojump9()
{
self setClientDvar("jump_height", "800");
}
dojump10()
{
self setClientDvar("jump_height", "900");
}
dojump11()
{
self setClientDvar("jump_height", "999");
}

//Time Scale

dotime1()
{
self setClientDvar("timescale", ".25");
}
dotime2()
{
self setClientDvar("timescale", ".5");
}
dotime3()
{
self setClientDvar("timescale", "1");
}
dotime4()
{
self setClientDvar("timescale", "2");
}
dotime5()
{
self setClientDvar("timescale", "3");
}


//Player Speed

dospeed1()
{
self setClientDvar("g_speed", "190");
}


//Player Sprint Speed

dosprintspeed1()
{
self setClientDvar("player_sprintSpeedScale", "1.5");
}


/////////////////////////

/*
        ##### ##                                                                       #####   ##    ##                ##                                                       
     ######  /###                                        #                          ######  /#### #####                 ##                                                      
    /#   /  /  ###               #                      ###                        /#   /  /  ##### #####               ##                                                      
   /    /  /    ###             ##                       #                        /    /  /   # ##  # ##                ##                                                      
       /  /      ##             ##                                                    /  /    #     #                   ##                                                      
      ## ##      ##  /###     ######## ### /### /###   ###   ##   ####       /###    ## ##    #     #      /###     ### ##    ######          /###      /###   ### /### /###    
      ## ##      ## / ###  / ########   ##/ ###/ /##  / ###   ##    ###  /  / #### / ## ##    #     #     / ###  / ######### /#######        / ###  /  / ###  / ##/ ###/ /##  / 
    /### ##      / /   ###/     ##       ##  ###/ ###/   ##   ##     ###/  ##  ###/  ## ##    #     #    /   ###/ ##   #### /      ##       /   ###/  /   ###/   ##  ###/ ###/  
   / ### ##     / ##    ##      ##       ##   ##   ##    ##   ##      ##  ####       ## ##    #     #   ##    ##  ##    ##         /       ##        ##    ##    ##   ##   ##   
      ## ######/  ##    ##      ##       ##   ##   ##    ##   ##      ##    ###      ## ##    #     ##  ##    ##  ##    ##        /        ##        ##    ##    ##   ##   ##   
      ## ######   ##    ##      ##       ##   ##   ##    ##   ##      ##      ###    #  ##    #     ##  ##    ##  ##    ##       ###       ##        ##    ##    ##   ##   ##   
      ## ##       ##    ##      ##       ##   ##   ##    ##   ##      ##        ###     /     #      ## ##    ##  ##    ##        ###      ##        ##    ##    ##   ##   ##   
      ## ##       ##    ##      ##       ##   ##   ##    ##   ##      /#   /###  ## /##/      #      ## ##    ##  ##    /#         ###   # ###     / ##    ##    ##   ##   ##   
      ## ##        ######       ##       ###  ###  ###   ### / ######/ ## / #### / /  #####           ## ######    ####/            ##  ### ######/   ######     ###  ###  ###  
 ##   ## ##         ####         ##       ###  ###  ###   ##/   #####   ##   ###/ /     ##                ####      ###             ##   #   #####     ####       ###  ###  ### 
###   #  /                                                                        #                                                 /                                           
 ###    /                                                                          ##                                              /                                            
  #####/                                                                                                                          /                                             
*/