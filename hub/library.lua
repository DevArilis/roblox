local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService('HttpService')

local library = {}
library.gui = Instance.new("ScreenGui")
library.gui.Parent = game:GetService('CoreGui')
library.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local guid = "aASUdyhAK>NDAIshdiashbdnwb ACNBUSgyduyw AUISDGI OWGYDi"
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
library.gui.Name = hash

function library:new(window)
    local bg = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local HeaderLabel = Instance.new("TextLabel")
    local Contents = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")    
    bg.Name = "bg"
    bg.Parent = library.gui
    bg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    bg.Position = UDim2.new(0.00594353629, 0, 0.351050675, 0)
    bg.Size = UDim2.new(0, 173, 0, 241)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = bg

    HeaderLabel.Name = "HeaderLabel"
    HeaderLabel.Parent = bg
    HeaderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HeaderLabel.BackgroundTransparency = 1.000
    HeaderLabel.Position = UDim2.new(0, 0, -0.0705394223, 0)
    HeaderLabel.Size = UDim2.new(0, 173, 0, 17)
    HeaderLabel.Font = Enum.Font.GothamBold
    HeaderLabel.Text = window
    HeaderLabel.TextColor3 = Color3.fromRGB(238, 82, 83)
    HeaderLabel.TextSize = 14.000
    HeaderLabel.TextStrokeTransparency = 0.600

    Contents.Name = "Contents"
    Contents.Parent = bg
    Contents.Active = true
    Contents.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Contents.BackgroundTransparency = 1.000
    Contents.BorderSizePixel = 0
    Contents.Position = UDim2.new(0, 0, 0.0248962659, 0)
    Contents.Size = UDim2.new(0, 173, 0, 235)
    Contents.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    Contents.ScrollBarThickness = 2
    Contents.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    UIListLayout.Parent = Contents
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    local inn = {}

    function inn:button(name, callback)
        local Button = Instance.new("TextButton")
        local ButtonLabel = Instance.new("TextLabel")
        local ButtonIcon = Instance.new("ImageLabel")

        Button.Name = "Button"
        Button.Parent = Contents
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.BackgroundTransparency = 1.000
        Button.Position = UDim2.new(0, 0, 0.129999995, 0)
        Button.Size = UDim2.new(0, 173, 0, 19)
        Button.Font = Enum.Font.SourceSans
        Button.Text = ""
        Button.TextColor3 = Color3.fromRGB(0, 0, 0)
        Button.TextSize = 14.000

        ButtonLabel.Name = "ButtonLabel"
        ButtonLabel.Parent = Button
        ButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonLabel.BackgroundTransparency = 1.000
        ButtonLabel.Position = UDim2.new(0.0346820801, 0, -0.0179073941, 0)
        ButtonLabel.Size = UDim2.new(0, 163, 0, 17)
        ButtonLabel.Font = Enum.Font.Gotham
        ButtonLabel.Text = name
        ButtonLabel.TextColor3 = Color3.fromRGB(238, 82, 83)
        ButtonLabel.TextSize = 12.000
        ButtonLabel.TextStrokeTransparency = 0.800
        ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left

        ButtonIcon.Name = "ButtonIcon"
        ButtonIcon.Parent = Button
        ButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonIcon.BackgroundTransparency = 1.000
        ButtonIcon.Position = UDim2.new(0.879999995, 0, 0.0529999994, 0)
        ButtonIcon.Size = UDim2.new(0, 16, 0, 16)
        ButtonIcon.Image = "http://www.roblox.com/asset/?id=10659566870"

        Button.MouseButton1Click:Connect(callback)
    end

    function inn:toggle(name, callback)
	local callback = callback or function() end;
        local Toggle = Instance.new("TextButton")
        local ToggleColor = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local ToggleLabel = Instance.new("TextLabel")
        Toggle.Name = "Toggle"
        Toggle.Parent = Contents
        Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggle.BackgroundTransparency = 1.000
        Toggle.Position = UDim2.new(0, 0, 0.0248962659, 0)
        Toggle.Size = UDim2.new(0, 173, 0, 19)
        Toggle.Font = Enum.Font.SourceSans
        Toggle.Text = ""
        Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        Toggle.TextSize = 14.000

        ToggleColor.Name = "ToggleColor"
        ToggleColor.Parent = Toggle
        ToggleColor.BackgroundColor3 = Color3.fromRGB(238, 82, 83)
        ToggleColor.BorderSizePixel = 0
        ToggleColor.Position = UDim2.new(0.895953715, 0, 0.157894731, 0)
        ToggleColor.Size = UDim2.new(0, 12, 0, 12)

        UICorner_2.CornerRadius = UDim.new(10, 0)
        UICorner_2.Parent = ToggleColor

        ToggleLabel.Name = "ToggleLabel"
        ToggleLabel.Parent = Toggle
        ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleLabel.BackgroundTransparency = 1.000
        ToggleLabel.Position = UDim2.new(0.0346820801, 0, -0.0179073941, 0)
        ToggleLabel.Size = UDim2.new(0, 163, 0, 17)
        ToggleLabel.Font = Enum.Font.Gotham
        ToggleLabel.Text = name
        ToggleLabel.TextColor3 = Color3.fromRGB(238, 82, 83)
        ToggleLabel.TextSize = 12.000
        ToggleLabel.TextStrokeTransparency = 0.800
        ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        local toggle = false;

        Toggle.MouseButton1Click:Connect(function()
            toggle = not toggle
            if toggle then
                local goal = {}
                goal.BackgroundColor3 = Color3.fromRGB(238, 82, 83)
                local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear)
                local tween = TweenService:Create(ToggleColor, tweenInfo, goal)
                tween:Play()
            else
		local goal = {}
		goal.BackgroundColor3 = Color3.fromRGB(29, 209, 161)
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear)
		local tween = TweenService:Create(ToggleColor, tweenInfo, goal)
                tween:Play()
            end
            callback(toggle)
        end)
    end
    local size = UIListLayout.AbsoluteContentSize
    Contents.CanvasSize = UDim2.new(0,0,0,size.Y)
    return inn
end
return library
