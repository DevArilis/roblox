if setclipboard then setclipboard('https://discord.gg/wuKrst9d2W')end;getgenv().arilol={Version='0.2a'}local a=game:GetService("UserInputService")local b=Drawing.Fonts.Monospace;local c=game:GetService('Players')local d=c.LocalPlayer;local e=d:GetMouse()local f=game:GetService('ReplicatedStorage')local g=game:GetService('RunService')local h=game:GetService("TweenService")local i=workspace.CurrentCamera;local j=i.worldToViewportPoint;local k=Vector3.new(0,0.75,0)local l=Vector3.new(0,3,0)local m=loadstring(game:HttpGet("https://pastebin.com/raw/r013Sn6i"))()local n='https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'local o=loadstring(game:HttpGet(n..'Library.lua'))()local p=loadstring(game:HttpGet(n..'addons/ThemeManager.lua'))()local q=loadstring(game:HttpGet(n..'addons/SaveManager.lua'))()local r;for s,t in pairs(getgc())do if type(t)=="function"and islclosure(t)then local u=getinfo(t)if u.source:match("ReplicatedStorage.BAC.Characters")then if u.name=="GetCharacter"then r=t;break end end end end;local v=o:CreateWindow({Title='[ari.lol] Rush Point',Center=true,AutoShow=true})local w={Legit=v:AddTab('Legit'),Visuals=v:AddTab('Visuals'),Miscellaneous=v:AddTab('Miscellaneous'),['UI Settings']=v:AddTab('UI Settings')}local x=w.Legit:AddLeftGroupbox('Aimbot')local y=w.Legit:AddRightGroupbox('Aimbot Settings')local z=w.Visuals:AddLeftGroupbox('ESP')local A=w.Visuals:AddRightGroupbox('ESP Settings')z:AddToggle('ESPEnable',{Text='Enable ESP',Default=false})z:AddToggle('BoxesEnabled',{Text='Boxes',Default=false})z:AddToggle('HealthEnabled',{Text='Health Bar',Default=false})z:AddDropdown('HealthPosition',{Values={'Left','Right','Bottom'},Default=1,Multi=false,Text='Health Bar Position'})z:AddToggle('NametagsEnabled',{Text='Nametags',Default=false})z:AddToggle('DistanceEnabled',{Text='Distance',Default=false})z:AddSlider('ESPDistance',{Text='ESP Distance',Default=400,Min=10,Max=400,Rounding=1,Compact=false})x:AddToggle('AimbotEnabled',{Text='Enable Aimbot',Default=false})x:AddToggle('AimbotFOVEnable',{Text='Show FOV',Default=false})y:AddToggle('AimbotVisibleEnabled',{Text='Visible Only',Default=false})y:AddDropdown('AimbotTargets',{Values={'Head','Torso','Left Arm','Right Arm','Left Leg','Right Leg'},Default=1,Multi=true,Text='Body Parts',Tooltip='These will be the body parts the aimbot aims at.'})y:AddSlider('AimbotSmoothing',{Text='Smoothing',Default=1,Min=0.1,Max=1,Rounding=1,Compact=false})y:AddSlider('AimbotFOV',{Text='FOV',Default=1,Min=1,Max=360,Rounding=0,Compact=false})y:AddLabel('FOV Color'):AddColorPicker('AimbotFOVColor',{Default=Color3.fromRGB(247,143,179),Title='FOV Color'})A:AddToggle('ESPVisibleCheck',{Text='Visible Only',Default=false})A:AddLabel('Box Color'):AddColorPicker('BoxColor',{Default=Color3.fromRGB(247,143,179),Title='Box Color'})A:AddLabel('Name Tag Color'):AddColorPicker('NametagColor',{Default=Color3.fromRGB(247,143,179),Title='Nametag Color'})local B=Drawing.new("Circle")B.Visible=Toggles.AimbotFOVEnable.Value;B.Thickness=2;B.Radius=Options.AimbotFOV.Value;B.Transparency=1;B.Color=Options.AimbotFOVColor.Value;B.Position=workspace.CurrentCamera.ViewportSize/2;Toggles.AimbotFOVEnable:OnChanged(function()B.Visible=Toggles.AimbotFOVEnable.Value end)Options.AimbotFOV:OnChanged(function()B.Radius=Options.AimbotFOV.Value end)Options.AimbotFOVColor:OnChanged(function()B.Color=Options.AimbotFOVColor.Value end)local function C(D)local E=i:WorldToScreenPoint(D.Position)return Vector2.new(E.X,E.Y)end;local function F(G,H)return Ray.new(G,(H-G).Unit*600)end;local function I()return Vector2.new(e.X,e.Y)end;local function J(D)local J=i:WorldToScreenPoint(D.Position)return J end;local function K(L,M)local N=d.Character or d.CharacterAdded.Wait(d.CharacterAdded)local G=i.CFrame.p;local O,P=i.WorldToViewportPoint(i,L.Position)if P then local Q=Ray.new(G,L.Position-G)local R,O=workspace.FindPartOnRayWithIgnoreList(workspace,Q,{d.Character,i})local S=not R or R.IsDescendantOf(R,M)return S end;return false end;local function T(U)local V=Ray.new(U.Position,U.LookVector).Unit;local W={}for X,t in pairs(Options.AimbotTargets.Value)do if t==true then table.insert(W,X)end end;local Y=nil;local Z=math.huge;local _=nil;for X,t in pairs(c:GetPlayers())do local N=r(t)if N==nil then return nil,nil end;if N and t~=d and N.PrimaryPart and N:FindFirstChildOfClass('Humanoid')then for a0,a1 in pairs(N:GetChildren())do if table.find(W,a1.Name)then local a2=(N[a1.Name].Position-V:ClosestPoint(N[a1.Name].Position)).Magnitude;if a2<Z then Z=a2;Y=N;_=a1.Name end end end end end;return Y,_ end;loop=g.RenderStepped:Connect(function()local a3=a:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)local a4=workspace.CurrentCamera;local a5=workspace.CurrentCamera.ViewportSize/2;if a3 and Toggles.AimbotEnabled.Value then local a6,_=T(a4.CFrame)if a6~=nil and _~=nil then local a7=a4:WorldToScreenPoint(a6[_].Position)a7=Vector2.new(a7.X,a7.Y)if(a7-a5).Magnitude<Options.AimbotFOV.Value then if Toggles.AimbotVisibleEnabled.Value then if K(a6[_],a6)then workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame:Lerp(CFrame.new(a4.CFrame.Position,a6[_].Position),1.1-Options.AimbotSmoothing.Value)end else workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame:Lerp(CFrame.new(a4.CFrame.Position,a6[_].Position),1.1-Options.AimbotSmoothing.Value)end end end end end)function CreateEsp(t)local a8,a9,aa,ab,ac=Drawing.new("Square"),Drawing.new("Square"),Drawing.new("Text"),Drawing.new("Square"),Drawing.new("Square")local ad=g.RenderStepped:Connect(function()local N=r(t)if N==nil then a8.Visible=false;a9.Visible=false;aa.Visible=false;ab.Visible=false;ac.Visible=false;return end;if not N:FindFirstChild('Team')then a8.Visible=false;a9.Visible=false;aa.Visible=false;ab.Visible=false;ac.Visible=false;return end;if not N and N.Parent and N.Parent.Name~='Players'then a8.Visible=false;a9.Visible=false;aa.Visible=false;ab.Visible=false;ac.Visible=false end;if N and N.Parent and N.Parent.Name~='Players'then a8.Visible=false;a9.Visible=false;aa.Visible=false;ab.Visible=false;ac.Visible=false;return end;if N and t~=d and N.Team.Value~=d.SelectedTeam.Value and N:FindFirstChild('Head')and N:FindFirstChildOfClass('Humanoid')and N:FindFirstChild("HumanoidRootPart")and N:FindFirstChildOfClass('Humanoid').Health>0 then if Toggles.ESPVisibleCheck.Value then if K(N.HumanoidRootPart,N)then local ae,af=i:WorldToViewportPoint(N.HumanoidRootPart.Position)local ag=1/(ae.Z*math.tan(math.rad(i.FieldOfView*0.5))*2)*100;local ah,ai=math.floor(40*ag),math.floor(60*ag)if Toggles.BoxesEnabled.Value then a8.Visible=af;a8.Color=Options.BoxColor.Value;a8.Size=Vector2.new(ah,ai)a8.Position=Vector2.new(ae.X-a8.Size.X/2,ae.Y-a8.Size.Y/2)a8.Thickness=1;a8.ZIndex=69;a8.Filled=false;a9.Visible=false;a9.Color=Options.BoxColor.Value;a9.Size=Vector2.new(ah,ai)a9.Position=Vector2.new(ae.X-a8.Size.X/2,ae.Y-a8.Size.Y/2)a9.Thickness=3;a9.Filled=false;a9.ZIndex=1 else a8.Visible=false;a9.Visible=false end;if Toggles.NametagsEnabled.Value then aa.Visible=af;aa.Color=Options.NametagColor.Value;if Toggles.DistanceEnabled.Value then aa.Text=N.Name.." ["..math.floor((i.CFrame.p-N.HumanoidRootPart.Position).magnitude).."m]"else aa.Text=N.Name end;aa.Center=true;aa.Outline=Toggles.NametagsEnabled.Value;aa.OutlineColor=Color3.new(0,0,0)aa.Position=Vector2.new(ae.X,ae.Y-ai*0.5+-15)aa.Font=b;aa.Size=12 else aa.Visible=false end;if Toggles.HealthEnabled.Value then ac.Visible=af;ac.Color=Color3.fromRGB(0,0,0)ac.Filled=true;ac.ZIndex=1;ab.Visible=af;ab.Color=Color3.fromRGB(255,0,0):lerp(Color3.fromRGB(0,255,0),N:FindFirstChild("Humanoid").Health/N:FindFirstChild("Humanoid").MaxHealth)ab.Thickness=1;ab.Filled=true;ab.ZIndex=69;if Options.HealthPosition.Value=="Left"then ac.Size=Vector2.new(2,ai)ac.Position=Vector2.new(ae.X-a8.Size.X/2,ae.Y-a8.Size.Y/2)+Vector2.new(-3,0)ab.Size=Vector2.new(1,-(ac.Size.Y-2)*N:FindFirstChild("Humanoid").Health/N:FindFirstChild("Humanoid").MaxHealth)ab.Position=ac.Position+Vector2.new(1,-1+ac.Size.Y)elseif Options.HealthPosition.Value=="Bottom"then ac.Size=Vector2.new(ah,3)ac.Position=Vector2.new(ae.X-a8.Size.X/2,ae.Y-a8.Size.Y/2)+Vector2.new(0,ai+2)ab.Size=Vector2.new((ac.Size.X-2)*N:FindFirstChild("Humanoid").Health/N:FindFirstChild("Humanoid").MaxHealth,1)ab.Position=ac.Position+Vector2.new(1,-1+ac.Size.Y)elseif Options.HealthPosition.Value=="Right"then ac.Size=Vector2.new(2,ai)ac.Position=Vector2.new(ae.X-a8.Size.X/2,ae.Y-a8.Size.Y/2)+Vector2.new(ah+1,0)ab.Size=Vector2.new(1,-(ac.Size.Y-2)*N:FindFirstChild("Humanoid").Health/N:FindFirstChild("Humanoid").MaxHealth)ab.Position=ac.Position+Vector2.new(1,-1+ac.Size.Y)end else ab.Visible=false;ac.Visible=false end else a8.Visible=false;a9.Visible=false;aa.Visible=false;ab.Visible=false;ac.Visible=false end else local ae,af=i:WorldToViewportPoint(N.HumanoidRootPart.Position)local ag=1/(ae.Z*math.tan(math.rad(i.FieldOfView*0.5))*2)*100;local ah,ai=math.floor(40*ag),math.floor(60*ag)if Toggles.BoxesEnabled.Value then a8.Visible=af;a8.Color=Options.BoxColor.Value;a8.Size=Vector2.new(ah,ai)a8.Position=Vector2.new(ae.X-a8.Size.X/2,ae.Y-a8.Size.Y/2)a8.Thickness=1;a8.ZIndex=69;a8.Filled=false;a9.Visible=false;a9.Color=Options.BoxColor.Value;a9.Size=Vector2.new(ah,ai)a9.Position=Vector2.new(ae.X-a8.Size.X/2,ae.Y-a8.Size.Y/2)a9.Thickness=3;a9.Filled=false;a9.ZIndex=1 else a8.Visible=false;a9.Visible=false end;if Toggles.NametagsEnabled.Value then aa.Visible=af;aa.Color=Options.NametagColor.Value;if Toggles.DistanceEnabled.Value then aa.Text=N.Name.." ["..math.floor((i.CFrame.p-N.HumanoidRootPart.Position).magnitude).."m]"else aa.Text=N.Name end;aa.Center=true;aa.Outline=Toggles.NametagsEnabled.Value;aa.OutlineColor=Color3.new(0,0,0)aa.Position=Vector2.new(ae.X,ae.Y-ai*0.5+-15)aa.Font=b;aa.Size=12 else aa.Visible=false end;if Toggles.HealthEnabled.Value then ac.Visible=af;ac.Color=Color3.fromRGB(0,0,0)ac.Filled=true;ac.ZIndex=1;ab.Visible=af;ab.Color=Color3.fromRGB(255,0,0):lerp(Color3.fromRGB(0,255,0),N:FindFirstChild("Humanoid").Health/N:FindFirstChild("Humanoid").MaxHealth)ab.Thickness=1;ab.Filled=true;ab.ZIndex=69;if Options.HealthPosition.Value=="Left"then ac.Size=Vector2.new(2,ai)ac.Position=Vector2.new(ae.X-a8.Size.X/2,ae.Y-a8.Size.Y/2)+Vector2.new(-3,0)ab.Size=Vector2.new(1,-(ac.Size.Y-2)*N:FindFirstChild("Humanoid").Health/N:FindFirstChild("Humanoid").MaxHealth)ab.Position=ac.Position+Vector2.new(1,-1+ac.Size.Y)elseif Options.HealthPosition.Value=="Bottom"then ac.Size=Vector2.new(ah,3)ac.Position=Vector2.new(ae.X-a8.Size.X/2,ae.Y-a8.Size.Y/2)+Vector2.new(0,ai+2)ab.Size=Vector2.new((ac.Size.X-2)*N:FindFirstChild("Humanoid").Health/N:FindFirstChild("Humanoid").MaxHealth,1)ab.Position=ac.Position+Vector2.new(1,-1+ac.Size.Y)elseif Options.HealthPosition.Value=="Right"then ac.Size=Vector2.new(2,ai)ac.Position=Vector2.new(ae.X-a8.Size.X/2,ae.Y-a8.Size.Y/2)+Vector2.new(ah+1,0)ab.Size=Vector2.new(1,-(ac.Size.Y-2)*N:FindFirstChild("Humanoid").Health/N:FindFirstChild("Humanoid").MaxHealth)ab.Position=ac.Position+Vector2.new(1,-1+ac.Size.Y)end else ab.Visible=false;ac.Visible=false end end end end)end;for X,t in pairs(c:GetPlayers())do if t~=d then CreateEsp(t)end end;c.PlayerAdded:Connect(function(t)if t~=d then CreateEsp(t)end end)c.ChildAdded:Connect(function(t)if t~=d then CreateEsp(t)end end)o:SetWatermarkVisibility(true)o:SetWatermark(string.format('ari.lol | Rush Point',arilol.Version))o.KeybindFrame.Visible=false;local aj=w['UI Settings']:AddLeftGroupbox('Menu')aj:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind',{Default='RightShift',NoUI=true,Text='Toggle UI'})o.ToggleKeybind=Options.MenuKeybind;p:SetLibrary(o)q:SetLibrary(o)q:IgnoreThemeSettings()q:SetIgnoreIndexes({'MenuKeybind'})p:SetFolder('ari.lol')q:SetFolder('ari.lol/rush point')q:BuildConfigSection(w['UI Settings'])p:ApplyToTab(w['UI Settings'])q:LoadAutoloadConfig()