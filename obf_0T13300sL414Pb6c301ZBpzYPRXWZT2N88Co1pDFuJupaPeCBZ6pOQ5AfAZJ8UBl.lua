--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.7) ~  Much Love, Ferib 

]]--

loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua",true))();local v0="https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/";if  not game:IsLoaded() then game.Loaded:Wait();end if ( not syn or  not protectgui) then getgenv().protectgui=function() end;end local v1={Enabled=false,ClassName="Universal Silent Aim - Averiias, Stefanuk12, xaxa",ToggleKey="RightAlt",TeamCheck=false,VisibleCheck=false,TargetPart="HumanoidRootPart",SilentAimMethod="Raycast",FOVRadius=230 -100 ,FOVVisible=false,ShowSilentAimTarget=false,MouseHitPrediction=false,MouseHitPredictionAmount=0.165 + 0 ,HitChance=891 -(368 + 423) ,WallBang=false};getgenv().SilentAimSettings=Settings;local v3=workspace.CurrentCamera;local v4=game:GetService("Players");local v5=game:GetService("RunService");local v6=game:GetService("GuiService");local v7=game:GetService("UserInputService");local v8=game:GetService("HttpService");local v9=v4.LocalPlayer;local v10=v9:GetMouse();local v11=game.GetChildren;local v12=v4.GetPlayers;local v13=v3.WorldToScreenPoint;local v14=v3.WorldToViewportPoint;local v15=v3.GetPartsObscuringTarget;local v16=game.FindFirstChild;local v17=v5.RenderStepped;local v18=v6.GetGuiInset;local v19=v7.GetMouseLocation;local v20=coroutine.resume;local v21=coroutine.create;local v22={"Head","HumanoidRootPart"};local v23=0.165 -0 ;local v24=Drawing.new("Square");v24.Visible=true;v24.ZIndex=1017 -(10 + 8) ;v24.Color=Color3.fromRGB(207 -153 ,499 -(416 + 26) ,241);v24.Thickness=63 -43 ;v24.Size=Vector2.new(9 + 11 ,35 -15 );v24.Filled=true;local v31=Drawing.new("Circle");v31.Thickness=439 -(145 + 293) ;v31.NumSides=530 -(44 + 386) ;v31.Radius=1666 -(998 + 488) ;v31.Filled=false;v31.Visible=false;v31.ZIndex=318 + 681 ;v31.Transparency=1 + 0 ;v31.Color=Color3.fromRGB(826 -(201 + 571) ,57,1379 -(116 + 1022) );local v40={FindPartOnRayWithIgnoreList={ArgCountRequired=3,Args={"Instance","Ray","table","boolean","boolean"}},FindPartOnRayWithWhitelist={ArgCountRequired=862 -(814 + 45) ,Args={"Instance","Ray","table","boolean"}},FindPartOnRay={ArgCountRequired=3 -1 ,Args={"Instance","Ray","Instance","boolean","boolean"}},Raycast={ArgCountRequired=2 + 1 ,Args={"Instance","Vector3","Vector3","RaycastParams"}}};function CalculateChance(v85) v85=math.floor(v85);local v86=math.floor(Random.new().NextNumber(Random.new(),766 -(745 + 21) ,1) * (35 + 65) )/(275 -175) ;return v86<=(v85/(392 -292)) ;end local function v41(v87) local v88,v89=v13(v3,v87);return Vector2.new(v88.X,v88.Y),v89;end local function v42(v90,v91) local v92=0 + 0 ;if ( #v90<v91.ArgCountRequired) then return false;end for v141,v142 in next,v90 do if (typeof(v142)==v91.Args[v141]) then v92=v92 + 1 ;end end return v92>=v91.ArgCountRequired ;end local function v43(v93,v94) return (v94-v93).Unit * (786 + 214) ;end local function v44() return v19(v7);end local function v45(v95) local v96=1055 -(87 + 968) ;local v97;local v98;local v99;local v100;local v101;local v102;while true do if (v96==0) then v97=v95.Character;v98=v9.Character;v96=1;end if (v96==3) then v102= #v15(v3,v100,v101);return ((v102==(0 -0)) and true) or ((v102>(0 + 0)) and false) ;end if (v96==(4 -2)) then if  not v99 then return;end v100,v101={v99.Position,v98,v97},{v98,v97};v96=1820 -(1703 + 114) ;end if (v96==(702 -(376 + 325))) then if  not (v97 or v98) then return;end v99=v16(v97,Options.TargetPart.Value) or v16(v97,"HumanoidRootPart") ;v96=2;end end end local function v46() if  not Options.TargetPart.Value then return;end local v103;local v104;for v143,v144 in next,v12(v4) do local v145=0;local v146;local v147;local v148;local v149;local v150;local v151;while true do if (v145==(1 -0)) then if (Toggles.VisibleCheck.Value and  not v45(v144)) then continue;end v147=v16(v146,"HumanoidRootPart");v148=v16(v146,"Humanoid");if ( not v147 or  not v148 or (v148 and (v148.Health<=(0 -0)))) then continue;end v145=2;end if (v145==2) then v149,v150=v41(v147.Position);if  not v150 then continue;end v151=(v44() -v149).Magnitude;if (v151<=(v104 or Options.Radius.Value or 2000)) then v103=((Options.TargetPart.Value=="Random") and v146[v22[math.random(1 + 0 , #v22)]]) or v146[Options.TargetPart.Value] ;v104=v151;end break;end if (v145==(0 -0)) then if (v144==v9) then continue;end if (Toggles.TeamCheck.Value and (v144.Team==v9.Team)) then continue;end v146=v144.Character;if  not v146 then continue;end v145=15 -(9 + 5) ;end end end return v103;end local v47=loadstring(game:HttpGet(v0   .. "Library.lua" ))();local v48=loadstring(game:HttpGet("https://raw.githubusercontent.com/Zypher32/theme/main/theme"))();local v49=loadstring(game:HttpGet(v0   .. "addons/SaveManager.lua" ))();local v4=game:GetService("Players");local v9=v4.LocalPlayer;local v50=v9.Character;local v5=game:GetService("RunService");local v51=v47:CreateWindow({Title="Horizon.cc | Street Warz | Free",Center=true,AutoShow=true,TabPadding=8,MenuFadeTime=0.2});local v52={Main=v51:AddTab("Main"),Visuals=v51:AddTab("Visuals"),["UI Settings"]=v51:AddTab("UI Settings")};local v53=false;local v54=false;local v55=476 -(85 + 291) ;local v56=false;local v57=1281 -(243 + 1022) ;local v58=false;local v59=50;local v60;local v61={Enabled=false,SafeMode=false,Delay=0.1 -0 };local v62={Enabled=false,SafeMode=false,Delay=0.1 + 0 };local v63=v52.Main:AddLeftGroupbox("Local");local v64=v52.Main:AddRightGroupbox("Kill Aura");local v65=v52.Main:AddLeftTabbox();local v66=v65:AddTab("Box");local v67=v65:AddTab("Mop");local v68=v52.Main:AddRightTabbox("Silent Aim");do local v105=0;local v106;while true do if (v105==(1182 -(1123 + 57))) then v106:AddToggle("TeamCheck",{Text="Team Check",Default=v1.TeamCheck}):OnChanged(function() v1.TeamCheck=Toggles.TeamCheck.Value;end);v106:AddToggle("VisibleCheck",{Text="Visible Check",Default=v1.VisibleCheck}):OnChanged(function() v1.VisibleCheck=Toggles.VisibleCheck.Value;end);v105=3 + 0 ;end if (v105==(255 -(163 + 91))) then Options.aim_Enabled_KeyPicker:OnClick(function() v1.Enabled= not v1.Enabled;Toggles.aim_Enabled.Value=v1.Enabled;Toggles.aim_Enabled:SetValue(v1.Enabled);v24.Visible=v1.Enabled;end);v106:AddToggle("WallBang",{Text="Wall Bang",Default=v1.TeamCheck}):OnChanged(function(v181) v1.WallBang=v181;end);v105=1932 -(1869 + 61) ;end if (v105==(2 + 2)) then Options.HitChance:OnChanged(function() v1.HitChance=Options.HitChance.Value;end);break;end if (v105==(10 -7)) then v106:AddDropdown("TargetPart",{AllowNull=true,Text="Target Part",Default=v1.TargetPart,Values={"Head","HumanoidRootPart","Random"}}):OnChanged(function() v1.TargetPart=Options.TargetPart.Value;end);v106:AddSlider("HitChance",{Text="Hit chance",Default=137 -37 ,Min=0 + 0 ,Max=100,Rounding=1,Compact=false});v105=1478 -(1329 + 145) ;end if (v105==(971 -(140 + 831))) then v106=v68:AddTab("Silent Aim");v106:AddToggle("aim_Enabled",{Text="Magic Bullet"}):AddKeyPicker("aim_Enabled_KeyPicker",{Default="RightAlt",SyncToggleState=true,Mode="Toggle",Text="Enabled",NoUI=false});v105=1851 -(1409 + 441) ;end end end local v69=v52.Main:AddRightTabbox("Miscellaneous");local v70=v52.Main:AddRightTabbox("Field Of View");do local v107=718 -(15 + 703) ;local v108;while true do if (v107==(1 + 0)) then v108:AddSlider("Radius",{Text="FOV Circle Radius",Min=0,Max=798 -(262 + 176) ,Default=1851 -(345 + 1376) ,Rounding=688 -(198 + 490) }):OnChanged(function() v31.Radius=Options.Radius.Value;v1.FOVRadius=Options.Radius.Value;end);v108:AddToggle("MousePosition",{Text="Show Silent Aim Target"}):AddColorPicker("MouseVisualizeColor",{Default=Color3.fromRGB(238 -184 ,136 -79 ,1447 -(696 + 510) )}):OnChanged(function() local v190=0;while true do if (v190==(0 -0)) then v24.Visible=Toggles.MousePosition.Value;v1.ShowSilentAimTarget=Toggles.MousePosition.Value;break;end end end);break;end if ((1262 -(1091 + 171))==v107) then v108=v70:AddTab("Visuals");v108:AddToggle("Visible",{Text="Show FOV Circle"}):AddColorPicker("Color",{Default=Color3.fromRGB(9 + 45 ,57,241)}):OnChanged(function() local v191=0;while true do if (v191==0) then v31.Visible=Toggles.Visible.Value;v1.FOVVisible=Toggles.Visible.Value;break;end end end);v107=1;end end end v66:AddToggle("box",{Text="Enabled",Default=false,Tooltip="Box Farm",Callback=function(v109) v61.Enabled=v109;end});v66:AddToggle("box",{Text="Safe Mode",Default=false,Tooltip="Safe Mode",Callback=function(v111) v61.SafeMode=v111;end});v66:AddSlider("distance",{Text="Delay",Default=0.1 -0 ,Min=0,Max=16 -11 ,Rounding=1,Compact=true,Callback=function(v113) v61.Delay=v113;end});v67:AddToggle("box",{Text="Enabled",Default=false,Tooltip="Box Farm",Callback=function(v115) v62.Enabled=v115;end});v67:AddToggle("box",{Text="Safe Mode",Default=false,Tooltip="Safe Mode",Callback=function(v117) v62.SafeMode=v117;end});v67:AddSlider("distance",{Text="Delay",Default=0.1,Min=374 -(123 + 251) ,Max=5,Rounding=4 -3 ,Compact=true,Callback=function(v119) v62.Delay=v119;end});v64:AddToggle("killaura",{Text="Enabled (FISTS)",Default=false,Tooltip="Kill closest player when you have fist equipped",Callback=function(v121) v53=v121;end});v64:AddToggle("teleport",{Text="Teleport",Default=false,Tooltip="Teleports to closest player",Callback=function(v122) v54=v122;end});v64:AddSlider("distance",{Text="Distance",Default=100,Min=698 -(208 + 490) ,Max=500,Rounding=1,Compact=true,Callback=function(v123) v55=v123;end});v63:AddToggle("VisualsEnabled",{Text="Anti Camera Shake",Default=false,Tooltip="Disables camera shake",Callback=function(v124) if v124 then v50.CharacterScripts.Enabled=false;else v50.CharacterScripts.Enabled=true;end end});v63:AddToggle("VisualsEnabled",{Text="Anti Money Drop",Default=false,Tooltip="Prevents the server making you lose money when dying",Callback=function(v125) if v125 then Player.PlayerScripts.LostMoneyClient=false;else Player.PlayerScripts.LostMoneyClient=true;end end});v63:AddToggle("VisualsEnabled",{Text="No Jump Cooldown",Default=false,Tooltip="No Jump Cooldown",Callback=function(v126) if v126 then v9.PlayerGui.JumpCooldown.Enabled=false;else v9.PlayerGui.JumpCooldown.Enabled=true;end end});v63:AddToggle("VisualsEnabled",{Text="Infinite Jump",Default=false,Tooltip="Infinite Jump",Callback=function(v127) v60=v127;end});v63:AddToggle("VisualsEnabled",{Text="Speed Hack",Default=false,Tooltip="Speed Hack!",Callback=function(v128) v56=v128;end});v63:AddSlider("distance",{Text="Speed",Default=2 + 14 ,Min=0,Max=45 + 55 ,Rounding=837 -(660 + 176) ,Compact=true,Callback=function(v129) v57=v129;if (v129==false) then v50.Humanoid.WalkSpeed=2 + 14 ;end end});v63:AddToggle("VisualsEnabled",{Text="Jump Hack",Default=false,Tooltip="Jump Hack!",Callback=function(v130) v58=v130;end});v63:AddSlider("distance",{Text="Power",Default=50,Min=0,Max=200,Rounding=1,Compact=true,Callback=function(v131) v59=v131;if (v131==false) then v50.Humanoid.JumpPower=252 -(14 + 188) ;end end});v5.RenderStepped:Connect(function() if v53 then wait(675.2 -(534 + 141) );local v161=v9.Character.HumanoidRootPart;local v162=v55;local v163,v164;for v169,v170 in pairs(v4:GetPlayers()) do if (v170.Name~=v9.Name) then local v194=v170.Character;local v195=v170:DistanceFromCharacter(v161.Position);if ( not v194 or (v195>v162) or (v164 and (v195>=v164))) then continue;end v164=v195;v163=v170;end end if v163 then local v192=0 + 0 ;local v193;while true do if (v192==(0 + 0)) then if v54 then v50.HumanoidRootPart.CFrame=v163.Character.HumanoidRootPart.CFrame;wait(0.5 + 0 );end v193={v163.Character.HumanoidRootPart,793 -293 ,v9.Character.LeftHand};v192=2 -1 ;end if (v192==(1 + 0)) then v9.Character.Fist.Script.E:FireServer(unpack(v193));if v54 then wait(0.5);end break;end end end end if v56 then v50.Humanoid.WalkSpeed=v57;end if v58 then v50.Humanoid.JumpPower=v59;end local v132=v9:GetMouse();v132.KeyDown:connect(function(v152) if v60 then if (v152:byte()==(21 + 11)) then local v196=396 -(115 + 281) ;while true do if (v196==(2 -1)) then wait(0.1);Humanoid:ChangeState("Seated");break;end if (v196==(0 + 0)) then Humanoid=game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid");Humanoid:ChangeState("Jumping");v196=1;end end end end end);end);v20(v21(function() v17:Connect(function() if (Toggles.MousePosition.Value and Toggles.aim_Enabled.Value) then if v46() then local v197=v46().Parent.PrimaryPart or v46() ;local v198,v199=v14(v3,v197.Position);v24.Visible=v199;v24.Position=Vector2.new(v198.X,v198.Y);else local v202=0 -0 ;while true do if (v202==(0 -0)) then v24.Visible=false;v24.Position=Vector2.new();break;end end end end if Toggles.Visible.Value then local v171=867 -(550 + 317) ;while true do if (v171==(0 -0)) then v31.Visible=Toggles.Visible.Value;v31.Color=Options.Color.Value;v171=1 -0 ;end if (v171==(2 -1)) then v31.Position=v44();break;end end end end);end));local v71;v71=hookmetamethod(game,"__namecall",newcclosure(function(...) local v133=getnamecallmethod();local v134={...};local v135=v134[1];local v136=CalculateChance(v1.HitChance);if (Toggles.aim_Enabled.Value and (v135==workspace) and  not checkcaller() and (v136==true)) then if (v133=="Raycast") then if v42(v134,v40.Raycast) then local v210=285 -(134 + 151) ;local v211;local v212;while true do if (v210==(1666 -(970 + 695))) then if v212 then if v1.WallBang then v134[3 -1 ]=v212.Position;v134[3]=v43(v211,v212.Position);else local v235=1990 -(582 + 1408) ;local v236;local v237;while true do if (v235==(0 -0)) then v236=v134[2];v237=v46();v235=1 -0 ;end if (v235==1) then if v237 then v134[11 -8 ]=v43(v236,v237.Position);return v71(unpack(v134));end break;end end end return v71(unpack(v134));end break;end if (v210==(1824 -(1195 + 629))) then v211=v134[2];v212=v46();v210=1 -0 ;end end end end end return v71(...);end));v47:SetWatermarkVisibility(true);local v72=tick();local v73=241 -(187 + 54) ;local v74=840 -(162 + 618) ;local v75=v5.RenderStepped:Connect(function() local v137=0 + 0 ;while true do if (v137==0) then v73=v73 + 1 ;if ((tick() -v72)>=1) then local v203=0 + 0 ;while true do if (v203==0) then v74=v73;v72=tick();v203=1;end if (v203==(1 -0)) then v73=0;break;end end end v137=1;end if (v137==(1 -0)) then v47:SetWatermark(("Horizon.cc | Rivals | Free | %s fps | %s ms"):format(math.floor(v74),math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())));break;end end end);v47.KeybindFrame.Visible=false;v47:OnUnload(function() v75:Disconnect();print("Unloaded!");v47.Unloaded=true;end);local v77=v52["UI Settings"]:AddLeftGroupbox("Menu");v77:AddButton("Unload",function() v47:Unload();end);v77:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind",{Default="End",NoUI=true,Text="Menu keybind"});v47.ToggleKeybind=Options.MenuKeybind;v48:SetLibrary(v47);v49:SetLibrary(v47);v49:IgnoreThemeSettings();v49:SetIgnoreIndexes({"MenuKeybind"});v48:SetFolder("MyScriptHub");v49:SetFolder("MyScriptHub/specific-game");v49:BuildConfigSection(v52["UI Settings"]);v48:ApplyToTab(v52["UI Settings"]);v49:LoadAutoloadConfig();v47:Notify("Loaded.");v47:Notify("Thank you for choosing Horizon.cc!");v47:Notify("Current Status: Undetected💚");local v80=game.Workspace.Job.Box.BOX1.CFrame;local v81=game.Workspace.Job.Box.BOX1.ClickDetector;local v82=game.Workspace.Job.Box.Job.CFrame;local v83=CFrame.new( -(15.724243000000001 + 176),1639.46969223 -(1373 + 263) ,1302.845581 -(451 + 549) ,0.85241586, -(3.6513462e-8 + 0),0.522864461 -0 ,3.2585337e-8,1 -0 ,1384.0000000167104 -(746 + 638) , -(0.522864461 + 0),2.7936182e-9 -0 ,341.85241586 -(218 + 123) );local v84=game.Workspace.CleanPart;while wait() do local v139=1581 -(1535 + 46) ;while true do if (v139==(0 + 0)) then if v61.Enabled then local v204=0 + 0 ;while true do if (3==v204) then if v61.SafeMode then local v228=560 -(306 + 254) ;while true do if (v228==(0 + 0)) then task.wait(1 -0 );v50.HumanoidRootPart.CFrame=v83;break;end end end task.wait(1472 -(899 + 568) );break;end if ((1 + 0)==v204) then fireclickdetector(v81);task.wait(1);v204=4 -2 ;end if ((603 -(268 + 335))==v204) then v50.HumanoidRootPart.CFrame=v80;task.wait(291 -(60 + 230) );v204=573 -(426 + 146) ;end if ((1 + 1)==v204) then if v9.Backpack:FindFirstChild("Box") then v50.Humanoid:EquipTool(v9.Backpack.Box);task.wait(1457 -(282 + 1174) );end v50.HumanoidRootPart.CFrame=v82;v204=814 -(569 + 242) ;end end end if v62.Enabled then if v9.Backpack:FindFirstChild("Mop") then v50.Humanoid:EquipTool(v9.Backpack.Mop);end if v50:FindFirstChild("Mop") then for v223,v224 in pairs(v84:GetChildren()) do if (v224.Decal.Transparency==(0 -0)) then local v229=v224;if (v62.SafeMode==false) then v50.HumanoidRootPart.CFrame=v224.CFrame;else v50.Humanoid:MoveTo(v224.Position);wait(0.5 + 0 );fireproximityprompt(v224.ProximityPrompt);wait(1029 -(706 + 318) );end wait(1251.5 -(721 + 530) );fireproximityprompt(v224.ProximityPrompt);wait(1276 -(945 + 326) );end end else warn("you dont have the mop.");end end break;end end end