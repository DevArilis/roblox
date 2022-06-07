-- If you try to clown me on how the code looks, i honestly, do not. give. a. fuck. lmao

repeat wait() makefolder("sandboxSchematics") until isfolder("sandboxSchematics")
getgenv()["IrisAd"] = true
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()
local Logo = "rbxasset://9845341520"
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage.Remotes
local Selected = ""
local SelectedURL = ""
local SaveName = ""


local Prices = {
    ["Block1"] = {0},
    ["Block2"] = {8},
    ["Block3"] = {12},
    ["Block4"] = {25},
    ["Block5"] = {30},
    ["Block6"] = {50},
    ["Block7"] = {55},
    ["Block8"] = {90},
    ["Block9"] = {100},
    ["Block10"] = {110},
    ["Block11"] = {110},
    ["Block12"] = {150},
    ["Block13"] = {170},
    ["Block14"] = {250},
    ["Block15"] = {400},
    ["Block16"] = {100},
    ["Block17"] = {950},
    ["Block18"] = {500},
    ["Block19"] = {2300},
    ["Block20"] = {2000},
    ["Block21"] = {3200},
    ["Block22"] = {12000},
    ["Block23"] = {5000},
    ["Block24"] = {20000},
    ["Rail1"] = {25},
    ["Rail1_Up"] = {25},
    ["Rail1_Down"] = {25},
    ["Rail2"] = {130},
    ["Rail2_Up"] = {130},
    ["Rail2_Down"] = {130},
    ["Rail3"] = {300},
    ["Rail3_Up"] = {300},
    ["Rail3_Down"] = {300},
    ["Collector1"] = {20},
    ["Collector2"] = {500},
    ["Collector3"] = {1200},
    ["Door1"] = {180},
    ["Door2"] = {300},
    ["Stair1"] = {120},
    ["Bonfire"] = {250},
    ["Chair1"] = {360},
    ["Stool"] = {250},
    ["Door3"] = {280},
    ["Door3"] = {500},
    ["Bed"] = {810},
    ["Stair2"] = {240},
    ["Lantern"] = {600},
    ["Table"] = {950},
    ["Bench"] = {1000},
    ["Door5"] = {700},
    ["Door6"] = {1300},
    ["Tree"] = {1500},
    ["StandLight"] = {1900},
    ["MapleTree"] = {1600},
    ["Shelf"] = {1850},
    ["CeilingLight"] = {3800},
    ["Trophy"] = {50000},
    ["Desk"] = {15000},
    ["TableLamp"] = {8000},
    ["Sofa"] = {13000},
    ["Fountain"] = {100000},
    ["Color_Red"] = {0},
    ["Color_Yellow"] = {0},
    ["Color_Orange"] = {0},
    ["Color_Green"] = {0},
    ["Color_Sky"] = {0},
    ["Color_Blue"] = {0},
    ["Color_Purple"] = {0},
    ["Color_Pink"] = {0},
    ["Color_Opera"] = {0},
    ["Color_Black"] = {0},
    ["Color_Gray"] = {0},
    ["Color_White"] = {0},
    ["X-Mas_Ice"] = {5},
    ["X-Mas_White_Snow"] = {5},
    ["X-Mas_Red_Snow"] = {5},
    ["X-Mas_Green_Snow"] = {5},
    ["X-Mas_Fireplace"] = {10},
    ["X-Mas_Tree"] = {10},
    ["X-Mas_Snowman"] = {10},
    ["X-Mas_White_Snow"] = {5},
    ["X-Mas_Dropper"] = {0},
    ["Upgrader1"] = { 1500, 3800, 9500, 18900, 40000 }, 
	["Upgrader2"] = { 8000, 15000, 24000, 38000, 60000 }, 
	["Upgrader3"] = { 23000, 35000, 50000, 80000, 130000 }, 
	["Upgrader4"] = { 100000, 140000, 200000, 280000, 500000 },
    ["Dropper1"] = { 50, 65, 70, 80, 100, 150, 200, 580, 1050, 1350, 1700, 2100, 2550, 3050, 3700, 4600, 5600, 6900, 8400, 10000 }, 
	["Dropper2"] = { 1000, 1080, 1200, 1400, 1700, 2100, 2500, 2950, 3500, 4100, 5600, 7100, 9000, 11000, 13000, 15000, 17500, 20000, 24000, 30000 }, 
	["Dropper3"] = { 4500, 4600, 5000, 5500, 6200, 6900, 7700, 8500, 9500, 11500, 13800, 16300, 19000, 22000, 25000, 28000, 33000, 39000, 48000, 63000 }, 
	["Dropper4"] = { 10000, 10600, 11500, 12500, 13800, 15300, 17300, 19500, 21500, 23800, 26300, 29000, 32000, 35300, 29000, 35000, 42000, 53000, 68000, 99000 }, 
	["Dropper5"] = { 25000, 26000, 27800, 30000, 32800, 26000, 29200, 33500, 38500, 45000, 52000, 60000, 70000, 82000, 96000, 120000, 150000, 185000, 235000, 300000 }, 
	["Dropper6"] = { 59000, 63000, 68000, 74000, 81000, 89000, 98000, 100000, 110000, 121500, 134500, 149000, 165000, 183000, 203000, 233000, 280000, 325000, 500000, 620000 }, 
	["Dropper7"] = { 115000, 125000, 135000, 165000, 190000, 210000, 230000, 250000, 280000, 320000, 365000, 415000, 450000, 500000, 560000, 610000, 720000, 800000, 1200000, 1500000 }
}

Notification.Notify("Sandbox Schematics", "Thanks for using the script!", Logo, {
    Duration = 7,       
    Main = {
        Rounding = true,
    }
});
   
Notification.Notify("Sandbox Schematics", "Notifications stolen from iris", Logo, {
    Duration = 7,       
    Main = {
        Rounding = true,
    }
});

Notification.Notify("Sandbox Schematics", "This script was meant for private servers!", Logo, {
    Duration = 7,       
    Main = {
        Rounding = true,
    }
});

local function getRandomString()
    local result = HttpService:GenerateGUID(false) 
    return string.sub(result, 1, 8)
end

local function getPlot()
    for i,v in pairs(workspace.Plots:GetChildren()) do
        if (v:FindFirstChild('Owner') and v.Owner.Value == game:GetService('Players').LocalPlayer.Name) then
            return v 
        end
    end
    return nil
end




local SchemPlot = "1"
function stringToCFrame(input)
    return CFrame.new(
      unpack(
        game:GetService('HttpService'):JSONDecode(
          '['..input..']'
        )
      )
    )
end




local function wipeBase()
    local Plot = nil
    repeat wait() Plot = getPlot() until Plot ~= nil


    local PlacedBlocks = Plot.ItemHolder
    for i,v in pairs(PlacedBlocks:GetChildren()) do
        Remotes.RemoveEvent:FireServer(v)
    end
end

local function buildBlock(name, cframe)
    local Plot = nil
    repeat wait() Plot = getPlot() until Plot ~= nil


    local PlacedBlocks = Plot.ItemHolder
    Remotes.PlacingEvent:FireServer(cframe, name, 0, Plot.Base.Block, Enum.NormalId.Top)
end

local function saveSchematic(name)
    local Plot = nil
    repeat wait() Plot = getPlot() until Plot ~= nil


    local PlacedBlocks = Plot.ItemHolder
    local random = Random.new()
    local Schematic = {}
    local BlockCount = #PlacedBlocks:GetChildren()
    print("[debug]: "..BlockCount.." blocks placed.")
    for i,v in pairs(PlacedBlocks:GetChildren()) do
        if (v:IsA('Model')) then
            Schematic[i] = {name = v.Name, cframe = tostring(v.PrimaryPart.CFrame)}
        else
            Schematic[i] = {name = v.Name, cframe = tostring(v.CFrame)}
        end
    end
    Schematic[#Schematic] = {number = tostring(string.split(Plot.Name, "plot")[2])}
    print("[debug]: saving schematic to file.")
    if (not name) then
        name = tostring(BlockCount).."_"..getRandomString()..".json"
    elseif (name and not name:match(".json")) then
        name = name..'.json'
    end
    writefile("sandboxSchematics/"..name, HttpService:JSONEncode(Schematic))
    print("[debug]: saved schematic '"..name.."'.")
end

local function loadSchematic(name)
    local Plot = nil
    repeat wait() Plot = getPlot() until Plot ~= nil


    local PlacedBlocks = Plot.ItemHolder
    if (not name) then
        print("[debug]: schematic load requires the name of the schematic.") 
        return
    elseif (name and not name:match('.json')) then
        name = name..'.json'
    end
    
    local isValidSchematic = isfile("sandboxSchematics/"..name)
    if (not isValidSchematic) then
        print("[debug]: the schematic '"..name.."' does not exist in workspace.") 
    else
        wipeBase()
        print("[debug]: attempting to build schematic.")
        print("[debug]: block type: wood")
        local SchematicFile = readfile("sandboxSchematics/"..name)
        local SchematicContents = HttpService:JSONDecode(SchematicFile)

        
        for i,v in pairs(SchematicContents) do
            if (v.name and v.cframe) then
                buildBlock(v.name, stringToCFrame(v.cframe))
            end
        end
        print("[debug]: finished building schematic '"..name.."'.")
    end
end


local function getSchematicSlot(name)
    if (not name) then
        print("[debug]: schematic load requires the name of the schematic.") 
        return
    elseif (name and not name:match('.json')) then
        name = name..'.json'
    end
    
    local isValidSchematic = isfile("sandboxSchematics/"..name)
    if (not isValidSchematic) then
        print("[debug]: the schematic '"..name.."' does not exist in workspace.") 
        return nil
    else
        local SchematicFile = readfile("sandboxSchematics/"..name)
        local SchematicContents = HttpService:JSONDecode(SchematicFile)
        return SchematicContents[#SchematicContents].number
    end
end

local function getSchematic(name)
    if (not name) then
        print("[debug]: schematic load requires the name of the schematic.") 
        return
    elseif (name and not name:match('.json')) then
        name = name..'.json'
    end
    
    local isValidSchematic = isfile("sandboxSchematics/"..name)
    if (not isValidSchematic) then
        print("[debug]: the schematic '"..name.."' does not exist in workspace.") 
        return nil
    else
        
        local SchematicFile = readfile("sandboxSchematics/"..name)
        local SchematicContents = HttpService:JSONDecode(SchematicFile)
        Selected = name    
    end
end

local function getSchematicFromPastebin(url)
    local RequestURL = url
    local response = nil
        
    repeat wait() response = game:HttpGet(RequestURL, true) until response ~= nil
    local data = HttpService:JSONDecode(response)
     
    Selected = data
end


local function getSchematicSlotFromPastebin(url)
    local RequestURL = url
    local response = nil
        
    repeat wait() response = game:HttpGet(RequestURL, true) until response ~= nil
    local data = HttpService:JSONDecode(response)
    return data[#data].number
end
local function loadSchematicFromPastebin(url)
    local RequestURL = url
    local response = nil
        
    repeat wait() response = game:HttpGet(RequestURL, true) until response ~= nil
    local data = HttpService:JSONDecode(response)
    wipeBase()

        
    for i,v in pairs(data) do
        if (v.name and v.cframe) then
            buildBlock(v.name, stringToCFrame(v.cframe))
        end
    end
end

local function loadSchematicFromString(string)
    local Plot = nil
    repeat wait() Plot = getPlot() until Plot ~= nil


    local PlacedBlocks = Plot.ItemHolder
    wipeBase()
    for i,v in pairs(HttpService:JSONDecode(string)) do
        buildBlock(v.name, stringToCFrame(v.cframe))
    end
end

local function TeleportToSchemPlot(name)
    local Slot = getSchematicSlot(name)
    Notification.Notify("Sandbox Schematics", "Teleported to Slot #"..Slot, Logo, {
        Duration = 7,       
        Main = {
            Rounding = true,
        }
    });
    if (Slot ~= nil) then
        game:GetService('Players').LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(workspace.Plots["plot"..Slot].PrimaryPart.Position)
    end
end

local function TeleportToSchemPlotFromPastebin(url)
    local Slot = getSchematicSlotFromPastebin(url)
    Notification.Notify("Sandbox Schematics", "Teleported to Slot #"..Slot, Logo, {
        Duration = 7,       
        Main = {
            Rounding = true,
        }
    });
    if (Slot ~= nil) then
        game:GetService('Players').LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(workspace.Plots["plot"..Slot].PrimaryPart.Position)
    end
end




























local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "Mercury",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

local Tab = GUI:Tab{
	Name = "Main",
	Icon = Logo
}

local Tab1 = GUI:Tab{
	Name = "Schematics",
	Icon = Logo
}


local Tab2 = GUI:Tab{
	Name = "URL Schematics",
	Icon = Logo
}

Tab2:Textbox{
	Name = "Schematic URL",
	Callback = function(text) SelectedURL = text end
}

Tab:Button{
	Name = "Clear Base",
	Description = "Sells all items on your base!",
	Callback = function() 
        wipeBase()
    end
}

Tab2:Button{
	Name = "Teleport to schematic slot from URL",
	Description = "Teleports you to the plot the schematic was built on, type in the schematic url above.",
	Callback = function() 
        if (SelectedURL ~= "") then TeleportToSchemPlotFromPastebin(SelectedURL) end
    end
}

Tab2:Button{
	Name = "Load Schematic from URL",
	Description = "Loads schematics from url, type in the schematic url above.",
	Callback = function() 
        if (SelectedURL ~= "") then loadSchematicFromPastebin(SelectedURL) end
    end
}

Tab1:Textbox{
	Name = "Schematic Name",
	Callback = function(text) getSchematic(text) end
}

Tab1:Button{
	Name = "Teleport to Schematic Slot",
	Description = "Teleports you to the schematic slot, type in the schematic name above.",
	Callback = function() 
        if (Selected ~= "") then TeleportToSchemPlot(Selected) end
    end
}

Tab1:Button{
	Name = "Load Schematic",
	Description = "Loads selected schematic, type in the schematic name above.",
	Callback = function() 
        if (Selected ~= "") then loadSchematic(Selected) end
    end
}

Tab1:Textbox{
	Name = "Schematic Name",
	Callback = function(text) SaveName = text end
}

Tab1:Button{
	Name = "Save Schematic",
	Description = "Saves schematic, type in the schematic name above.",
	Callback = function() 
        if (SaveName ~= "") then saveSchematic(SaveName) end
    end
}
