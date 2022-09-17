if (setclipboard) then setclipboard('https://discord.gg/wuKrst9d2W') end
local UserInputService = game:GetService("UserInputService")
local GlobalFont = Drawing.Fonts.Monospace
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local RunService = game:GetService('RunService')
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera
local WorldToViewPoint = Camera.worldToViewportPoint
local HeadOff = Vector3.new(0, 0.75, 0)
local LegOff = Vector3.new(0,3,0)
local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()


local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = '[ari.lol] Recoil Zombies',
    Center = true, 
    AutoShow = true,
})
local Tabs = {
    -- Creates a new tab titled Main
    Aimbot = Window:AddTab('Aimbot'),
    Visuals = Window:AddTab('Visuals'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}
local AimbotGroupBox = Tabs.Aimbot:AddLeftGroupbox('Aimbot')
local AimbotSettingsGroupBox = Tabs.Aimbot:AddRightGroupbox('Aimbot Settings')
local ESPGroupBox = Tabs.Visuals:AddLeftGroupbox('Zombie ESP')
local BoxGroupBox = Tabs.Visuals:AddLeftGroupbox('Map ESP')
local ESPSettingsGroupBox = Tabs.Visuals:AddRightGroupbox('ESP Settings')


AimbotGroupBox:AddToggle('AimbotEnabled', {
    Text = 'Enable Aimbot',
    Default = false, -- Default value (true / false)
    
})
AimbotGroupBox:AddToggle('AimbotFOVEnable', {
    Text = 'Enable FOV',
    Default = false, -- Default value (true / false)
    
})
AimbotSettingsGroupBox:AddToggle('AimbotVisibleEnabled', {
    Text = 'Visible Only',
    Default = false, -- Default value (true / false)
    
})
AimbotSettingsGroupBox:AddSlider('AimbotSmoothing', {
    Text = 'Smoothing',
    Default = 1,
    Min = 0.1,
    Max = 1,
    Rounding = 1,
    Compact = false
})
AimbotSettingsGroupBox:AddLabel('FOV Color'):AddColorPicker('AimbotFOVColor', {
    Default = Color3.fromRGB(247, 143, 179), -- Bright green
    Title = 'FOV Color', -- Optional. Allows you to have a custom color picker title (when you open it)
})
AimbotSettingsGroupBox:AddSlider('AimbotFOV', {
    Text = 'FOV',
    Default = 1,
    Min = 1,
    Max = 360,
    Rounding = 0,
    Compact = false
})

BoxGroupBox:AddToggle('BoxEnabled', {
    Text = 'Mystery Box',
    Default = false, -- Default value (true / false)
})
BoxGroupBox:AddToggle('PerkESPEnabled', {
    Text = 'Perk Machines',
    Default = false, -- Default value (true / false)
})
BoxGroupBox:AddToggle('PowerEnabled', {
    Text = 'Power Switch',
    Default = false, -- Default value (true / false)
})

ESPGroupBox:AddToggle('ESPEnable', {
    Text = 'Enable ESP',
    Default = false, -- Default value (true / false)
    
})
ESPGroupBox:AddToggle('BoxesEnabled', {
    Text = 'Boxes',
    Default = false, -- Default value (true / false)
    
})
ESPGroupBox:AddToggle('NametagsEnabled', {
    Text = 'Nametags',
    Default = false, -- Default value (true / false)
    
})
ESPGroupBox:AddToggle('DistanceEnabled', {
    Text = 'Distance',
    Default = false, -- Default value (true / false)
    
})
ESPSettingsGroupBox:AddToggle('ESPVisibleCheck', {
    Text = 'Visible Only',
    Default = false, -- Default value (true / false)
    
})
ESPSettingsGroupBox:AddLabel('Box Color'):AddColorPicker('BoxColor', {
    Default = Color3.fromRGB(247, 143, 179), -- Bright green
    Title = 'Box Color', -- Optional. Allows you to have a custom color picker title (when you open it)
})
ESPSettingsGroupBox:AddLabel('Name Tag Color'):AddColorPicker('NametagColor', {
    Default = Color3.fromRGB(247, 143, 179), -- Bright green
    Title = 'Nametag Color', -- Optional. Allows you to have a custom color picker title (when you open it)
})
ESPSettingsGroupBox:AddLabel('Mystery Box Color'):AddColorPicker('MysteryBoxColor', {
    Default = Color3.fromRGB(165, 94, 234), -- Bright green
    Title = 'Mystery Box Color', -- Optional. Allows you to have a custom color picker title (when you open it)
})
ESPSettingsGroupBox:AddLabel('Perk Machine Color'):AddColorPicker('PerkColor', {
    Default = Color3.fromRGB(252, 92, 101), -- Bright green
    Title = 'Perk Machine Color', -- Optional. Allows you to have a custom color picker title (when you open it)
})
ESPSettingsGroupBox:AddLabel('Power Color'):AddColorPicker('PowerColor', {
    Default = Color3.fromRGB(255, 255, 255), -- Bright green
    Title = 'Power Color', -- Optional. Allows you to have a custom color picker title (when you open it)
})

local AimbotFOVCircle = Drawing.new("Circle")
AimbotFOVCircle.Visible = Toggles.AimbotFOVEnable.Value
AimbotFOVCircle.Thickness = 2
AimbotFOVCircle.Radius = Options.AimbotFOV.Value
AimbotFOVCircle.Transparency = 1
AimbotFOVCircle.Color = Options.AimbotFOVColor.Value
AimbotFOVCircle.Position = workspace.CurrentCamera.ViewportSize/2


Toggles.AimbotFOVEnable:OnChanged(function()
    AimbotFOVCircle.Visible = Toggles.AimbotFOVEnable.Value
end)

Options.AimbotFOV:OnChanged(function()
    AimbotFOVCircle.Radius = Options.AimbotFOV.Value
end)

Options.AimbotFOVColor:OnChanged(function()
    AimbotFOVCircle.Color = Options.AimbotFOVColor.Value
end)

local function WTS(Object)
    local ObjectVector = Camera:WorldToScreenPoint(Object.Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

local function PositionToRay(Origin, Target)
    return Ray.new(Origin, (Target - Origin).Unit * 600)
end
local function MousePositionToVector2()
    return Vector2.new(Mouse.X, Mouse.Y)
end

local function IsOnScreen(Object)
    local IsOnScreen = Camera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end


local function getClosest(cframe)
    local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
    local BodyParts = {'Head'}
    local target = nil
    local mag = math.huge
    local bp = nil
    for i,v in pairs(workspace.ClientZambies:GetChildren()) do
        if (v.PrimaryPart) then
            for x,z in pairs(v:GetChildren()) do
                if (table.find(BodyParts, z.Name) and z:IsA('Part')) then
                    local magBuf = (v[z.Name].Position - ray:ClosestPoint(v[z.Name].Position)).Magnitude
                    if magBuf < mag then
                        mag = magBuf
                        target = v
                        bp = z
                    end
                end
            end
        end
    end

    
    return target, bp
end


loop = RunService.RenderStepped:Connect(function()
    local pressed = --[[UserInputService:IsKeyDown(Enum.KeyCode.E)]] UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
    local cam = workspace.CurrentCamera
    local zz = workspace.CurrentCamera.ViewportSize/2
    
    if pressed and Toggles.AimbotEnabled.Value then
        local curTar, bp = getClosest(cam.CFrame)
        if (curTar) then
            local ssHeadPoint = cam:WorldToScreenPoint(bp.Position)
            ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
            if (ssHeadPoint - zz).Magnitude < Options.AimbotFOV.Value then
                if (Toggles.AimbotVisibleEnabled.Value) then
                    if (isPartVisible(curTar, curTar.Character)) then
                        workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, bp.Position), 1.1 - Options.AimbotSmoothing.Value)
                        --workspace.CurrentCamera.CFrame = CFrame.new(cam.CFrame.Position, curTar.Character[bp].Position)
                    end
                else
                    workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, bp.Position), 1.1 - Options.AimbotSmoothing.Value)
                    --workspace.CurrentCamera.CFrame = CFrame.new(cam.CFrame.Position, curTar.Character[bp].Position)
                end
                
            end
        end
    end
   
end)

function createPowerESP(v)
    local Name = Drawing.new("Text")
    local Updater = RunService.RenderStepped:Connect(function()
        if (v:FindFirstChild('Switch')) then
            local Target2dPosition,IsVisible = Camera:WorldToViewportPoint(v.Switch.Position)
            local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
            local width, height = math.floor(40 * scale_factor), math.floor(60 * scale_factor)
           
            if (Toggles.PowerEnabled.Value) then
                Name.Visible = IsVisible
                Name.Color = Options.PowerColor.Value
                Name.Text = "Power ["..math.floor((Camera.CFrame.p - v.Switch.Position).magnitude).."m]"
                Name.Center = true
                Name.Outline = Toggles.PowerEnabled.Value
                Name.OutlineColor = Color3.new(0,0,0)
                Name.Position = Vector2.new(Target2dPosition.X,Target2dPosition.Y - height * 0.5 + -15)
                Name.Font = GlobalFont
                Name.Size = 12
            else
                Name.Visible = false
            end   
        end
    end)
end

function createPerkESP(v)
    local Name = Drawing.new("Text")
    local Updater = RunService.RenderStepped:Connect(function()
        if (v:FindFirstChild('PerkLogo')) then
            local Target2dPosition,IsVisible = Camera:WorldToViewportPoint(v.PerkLogo.Position)
            local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
            local width, height = math.floor(40 * scale_factor), math.floor(60 * scale_factor)
           
            if (Toggles.PerkESPEnabled.Value) then
                Name.Visible = IsVisible
                Name.Color = Options.PerkColor.Value
                Name.Text = v.Name.." ["..math.floor((Camera.CFrame.p - v.PerkLogo.Position).magnitude).."m]"
                Name.Center = true
                Name.Outline = Toggles.PerkESPEnabled.Value
                Name.OutlineColor = Color3.new(0,0,0)
                Name.Position = Vector2.new(Target2dPosition.X,Target2dPosition.Y - height * 0.5 + -15)
                Name.Font = GlobalFont
                Name.Size = 12
            else
                Name.Visible = false
            end   
        end
    end)
end

function createBoxESP(v)
    local Name = Drawing.new("Text")
    local Updater = RunService.RenderStepped:Connect(function()
        if (not workspace:FindFirstChild("MagicBox")) then
            Name.Visible = false
        end
        if (v:FindFirstChild('Light') and v.PrimaryPart) then
            local Target2dPosition,IsVisible = Camera:WorldToViewportPoint(v.PrimaryPart.Position)
            local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
            local width, height = math.floor(40 * scale_factor), math.floor(60 * scale_factor)
           
            if (Toggles.BoxEnabled.Value) then
                Name.Visible = IsVisible
                Name.Color = Options.MysteryBoxColor.Value
                Name.Text = "Mystery Box ["..math.floor((Camera.CFrame.p - v.PrimaryPart.Position).magnitude).."m]"
                Name.Center = true
                Name.Outline = Toggles.BoxEnabled.Value
                Name.OutlineColor = Color3.new(0,0,0)
                Name.Position = Vector2.new(Target2dPosition.X,Target2dPosition.Y - height * 0.5 + -15)
                Name.Font = GlobalFont
                Name.Size = 12
            else
                Name.Visible = false
            end   
        end
    end)
end

function CreateEsp(v)
    local Box,BoxOutline,Name = Drawing.new("Square"),Drawing.new("Square"),Drawing.new("Text")
    local Updater = RunService.RenderStepped:Connect(function()
        if (not workspace.ClientZambies:FindFirstChild(v.Name)) then
            Box.Visible = false
            BoxOutline.Visible = false
            Name.Visible = false
        end
        if (v:FindFirstChild('Head') and v.PrimaryPart) then
            local Target2dPosition,IsVisible = Camera:WorldToViewportPoint(v.PrimaryPart.Position)
            local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
            local width, height = math.floor(40 * scale_factor), math.floor(60 * scale_factor)
           
            if (Toggles.BoxesEnabled.Value) then
                Box.Visible = IsVisible
                Box.Color = Options.BoxColor.Value
                Box.Size = Vector2.new(width,height)
                Box.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2,Target2dPosition.Y - Box.Size.Y / 2)
                Box.Thickness = 1
                Box.ZIndex = 69
                BoxOutline.Visible = false
                BoxOutline.Color = Options.BoxColor.Value
                BoxOutline.Size = Vector2.new(width,height)
                BoxOutline.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2,Target2dPosition.Y - Box.Size.Y / 2)
                BoxOutline.Thickness = 3
                BoxOutline.ZIndex = 1
            else
                Box.Visible = false
                BoxOutline.Visible = false
            end
            if (Toggles.NametagsEnabled.Value) then
                Name.Visible = IsVisible
                Name.Color = Options.NametagColor.Value
                if (Toggles.DistanceEnabled.Value) then
                    Name.Text = "Zombie ["..math.floor((Camera.CFrame.p - v.PrimaryPart.Position).magnitude).."m]"
                else                        
                    Name.Text = "Zombie"
                end
                Name.Center = true
                Name.Outline = Toggles.NametagsEnabled.Value
                Name.OutlineColor = Color3.new(0,0,0)
                Name.Position = Vector2.new(Target2dPosition.X,Target2dPosition.Y - height * 0.5 + -15)
                Name.Font = GlobalFont
                Name.Size = 12
            else
                Name.Visible = false
            end   
        end
    end)
end

for _,v in pairs(workspace:GetChildren()) do
    if (v.Name == 'Power' and v:FindFirstChild('Switch')) then
        createPowerESP(v)
    end
end

for _,v in pairs(workspace.Scriptable:GetChildren()) do
    if (v:FindFirstChild('PerkLogo')) then
        createPerkESP(v)
    end
end

for _,v in pairs(workspace:GetChildren()) do
    if (v.Name == 'MagicBox') then
        createBoxESP(v)
    end
end

workspace.ChildAdded:Connect(function(v)
    if (v.Name == 'Magic Box') then
        createBoxESP(v)
    end
end)

for _,v in pairs(workspace.ClientZambies:GetChildren()) do
    CreateEsp(v)
end
 
workspace.ClientZambies.ChildAdded:Connect(function(v)
    CreateEsp(v)
end)

Library:SetWatermarkVisibility(true)
Library:SetWatermark(string.format('ari.lol | Recoil Zombies'))
Library.KeybindFrame.Visible = false; -- todo: add a function for this
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Toggle UI' }) 
Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('ari.lol')
SaveManager:SetFolder('ari.lol/recoil zombies')
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
