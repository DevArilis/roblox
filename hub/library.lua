repeat wait() until game:IsLoaded()
local input = game:GetService('UserInputService')
local HttpService = game:GetService("HttpService")

local lib = {}
lib.gui = Instance.new("ScreenGui")


lib.gui.Parent = game:GetService('CoreGui')
lib.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local guid = HttpService:GenerateGUID(false).."aASUdyhAK>NDAIshdiashbdnwb ACNBUSgyduyw AUISDGI OWGYDi"
local chars = {}
for i=1,#guid,1 do
	table.insert(chars, string.sub(guid, i, i))
end
local RandomizedTable = {}
for i, v in pairs(chars) do
	local RandomItem = chars[math.random(1, #chars)]
	table.remove(chars, table.find(chars, RandomItem))
	table.insert(RandomizedTable, 1, RandomItem)
end
local hash = ""
for i,v in pairs(RandomizedTable) do
	hash = hash..v
end
lib.gui.Name = hash

lib.Settings = {
	VisibleKey = Enum.KeyCode.RightShift
}

function lib:NewWindow(name, y)
	
	local bg = Instance.new("Frame")
	local header = Instance.new("Frame")
	local headerlabel = Instance.new("TextLabel")
	local contents = Instance.new("Frame")
	local UIGridLayout = Instance.new("UIGridLayout")

	UIGridLayout.Parent = contents
	UIGridLayout.FillDirection = Enum.FillDirection.Vertical
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
	UIGridLayout.CellSize = UDim2.new(0, 166, 0, 20)
	
	bg.Name = "bg"
	bg.Parent = lib.gui
	bg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	bg.BackgroundTransparency = 0.6
	bg.BorderSizePixel = 0
	bg.Position = UDim2.new(0.00891530421, 0, 0.040929202, 0)
	bg.Size = UDim2.new(0, 200, 0, 420)

	header.Name = "header"
	header.Parent = bg
	header.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	header.BackgroundTransparency = 0.800
	header.BorderSizePixel = 0
	header.Size = UDim2.new(0, 200, 0, 17)

	headerlabel.Name = "headerlabel"
	headerlabel.Parent = header
	headerlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	headerlabel.BackgroundTransparency = 1.000
	headerlabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
	headerlabel.Size = UDim2.new(0, 200, 0, 17)
	headerlabel.Font = Enum.Font.SourceSans
	headerlabel.Text = name
	headerlabel.TextColor3 = Color3.fromRGB(255, 251, 117)
	headerlabel.TextScaled = true
	headerlabel.TextSize = 14.000
	headerlabel.TextStrokeTransparency = 0.630
	headerlabel.TextWrapped = true

	contents.Name = "contents"
	contents.Parent = bg
	contents.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	contents.BackgroundTransparency = 1.000
	contents.Position = UDim2.new(0, 0, 0.0404761918, 0)
	contents.Size = UDim2.new(0, 200, 0, 403)
	
	
	local innerlib = {}
	
	function innerlib:divider()
		local divider = Instance.new("Frame")
		local dividerframe = Instance.new("Frame")
		divider.Name = "divider"
		divider.Parent = contents
		divider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		divider.BackgroundTransparency = 1.000
		divider.BorderSizePixel = 0
		divider.Position = UDim2.new(0.204142019, 0, 0.0992555842, 0)
		divider.Size = UDim2.new(0, 150, 0, 4)

		dividerframe.Name = "dividerframe"
		dividerframe.Parent = divider
		dividerframe.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		dividerframe.BackgroundTransparency = 0.800
		dividerframe.BorderSizePixel = 0
		dividerframe.Position = UDim2.new(0, 0, 0.5, 0)
		dividerframe.Size = UDim2.new(0, 150, 0, 2)
	end
	
	function innerlib:button(name, callback)
		local button = Instance.new("TextButton")
		local buttonlabel = Instance.new("TextLabel")
		button.Name = "button"
		button.Parent = contents
		button.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
		button.BackgroundTransparency = 1.000
		button.Position = UDim2.new(0.035502959, 0, 0.075000003, 0)
		button.Size = UDim2.new(0, 157, 0, 19)
		button.AutoButtonColor = false
		button.Font = Enum.Font.SourceSans
		button.Text = ""
		button.TextColor3 = Color3.fromRGB(0, 0, 0)
		button.TextSize = 14.000

		buttonlabel.Name = "buttonlabel"
		buttonlabel.Parent = button
		buttonlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonlabel.BackgroundTransparency = 1.000
		buttonlabel.BorderSizePixel = 0
		buttonlabel.Size = UDim2.new(0, 157, 0, 19)
		buttonlabel.Font = Enum.Font.SourceSans
		buttonlabel.Text = name
		buttonlabel.TextColor3 = Color3.fromRGB(255, 251, 117)
		buttonlabel.TextSize = 12.000
		button.MouseButton1Click:Connect(callback)
	end
	
	function innerlib:keybind(name, bind, callback)
		local keycodename = bind
		local callback = callback or function() end
		local default = bind;
		local Type = tostring(default):match("UserInputType") and "UserInputType" or "KeyCode";
		keycodename = tostring(keycodename):gsub("Enum.UserInputType.", "");
		keycodename = tostring(keycodename):gsub("Enum.KeyCode.", "");
		
		local BlacklistedTypes = {
            [Enum.UserInputType.MouseButton1] = "M1";
            [Enum.UserInputType.MouseButton2] = "M2";
			[Enum.UserInputType.MouseButton3] = "M3";
			
		};
		local gayTypes = {
			[Enum.KeyCode.RightShift] = "RSHIFT";
			[Enum.KeyCode.LeftShift] = "LSHIFT";
			[Enum.KeyCode.LeftControl] = "LCTRL";
			[Enum.KeyCode.RightControl] = "RCTRL";
			[Enum.KeyCode.RightAlt] = "RALT";
			[Enum.KeyCode.LeftAlt] = "LALT";
		}
		
		local keybind = Instance.new("TextButton")
		local keybindlabel = Instance.new("TextLabel")
		local keylabel = Instance.new("TextLabel")
		keybind.Name = "keybind"
		keybind.Parent = contents
		keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		keybind.BackgroundTransparency = 1.000
		keybind.Position = UDim2.new(0.035502959, 0, 0.0148883378, 0)
		keybind.Size = UDim2.new(0, 157, 0, 19)
		keybind.AutoButtonColor = false
		keybind.Font = Enum.Font.SourceSans
		keybind.Text = ""
		keybind.TextColor3 = Color3.fromRGB(0, 0, 0)
		keybind.TextSize = 14.000

		keybindlabel.Name = "keybindlabel"
		keybindlabel.Parent = keybind
		keybindlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		keybindlabel.BackgroundTransparency = 1.000
		keybindlabel.BorderSizePixel = 0
		keybindlabel.Size = UDim2.new(0, 141, 0, 19)
		keybindlabel.Font = Enum.Font.SourceSans
		keybindlabel.Text = name
		keybindlabel.TextColor3 = Color3.fromRGB(255, 251, 117)
		keybindlabel.TextSize = 12.000
		keybindlabel.TextXAlignment = Enum.TextXAlignment.Left

		keylabel.Name = "keylabel"
		keylabel.Parent = keybind
		keylabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		keylabel.BackgroundTransparency = 1.000
		keylabel.BorderSizePixel = 0
		keylabel.Position = UDim2.new(0.89808917, 0, 0, 0)
		keylabel.Size = UDim2.new(0, 16, 0, 19)
		keylabel.Font = Enum.Font.SourceSans
		keylabel.Text = string.format('[%s]', keycodename)
		keylabel.TextColor3 = Color3.fromRGB(255, 251, 117)
		keylabel.TextSize = 12.000
		
		keybind.MouseButton1Click:Connect(function()
			local Connection;

			keylabel.Text = "[]";
			Connection = input.InputBegan:Connect(function(i)
				if BlacklistedTypes[i.UserInputType] then
					keylabel.Text = string.format('[%s]', BlacklistedTypes[i.UserInputType])	
					default = i.KeyCode
				elseif i.KeyCode ~= Enum.KeyCode.Unknown then
					keylabel.Text = string.format('[%s]', tostring(i.KeyCode):gsub("Enum.KeyCode.", ""))
					default = i.KeyCode
				else
					warn("Exception: " .. i.UserInputType .. " " .. i.KeyCode);
				end;

				

				Connection:Disconnect();
			end);
		end);

		input.InputBegan:Connect(function(i)
			if (default == i.UserInputType or default == i.KeyCode) then
				callback(default);
			end;
		end);
	end
	bg.Size = UDim2.new(0, 200, 0, y)
	return innerlib
end
return lib	
