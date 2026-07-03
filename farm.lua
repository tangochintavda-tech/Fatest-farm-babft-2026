local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local gravityNormal = workspace.Gravity

local autoFarmEnabled = false
local antiAfkEnabled = false

local speedDelay = 1.5

local destinations = {
	CFrame.new(-51.566, 65, 1369.09),
	CFrame.new(-51.566, 65, 2139.09),
	CFrame.new(-51.566, 65, 2909.09),
	CFrame.new(-51.566, 65, 3679.09),
	CFrame.new(-51.566, 65, 4449.09),
	CFrame.new(-51.566, 65, 5219.09),
	CFrame.new(-51.566, 65, 5989.09),
	CFrame.new(-51.566, 65, 6759.09),
	CFrame.new(-51.566, 65, 7529.09),
	CFrame.new(-51.566, 65, 8299.09),
	CFrame.new(-55.907, -360.99, 9489.307),
}

-- GUI (KitenFarm style)
local KitenFarm = {
	KitenFarm = Instance.new("ScreenGui"),
	MainFrame = Instance.new("Frame"),
	UIStroke = Instance.new("UIStroke"),
	UICorner = Instance.new("UICorner"),
	Title = Instance.new("TextLabel"),
	UIStroke_2 = Instance.new("UIStroke"),
	Credits = Instance.new("TextLabel"),
	GoldIngot = Instance.new("ImageLabel"),
	GoldText = Instance.new("TextLabel"),
	UIStroke_3 = Instance.new("UIStroke"),
	Farm = Instance.new("TextButton"),
	UICorner_2 = Instance.new("UICorner"),
	Indicator = Instance.new("ImageLabel"),
	AntiIdle = Instance.new("TextButton"),
	UICorner_3 = Instance.new("UICorner"),
	Indicator_2 = Instance.new("ImageLabel"),
	Desc = Instance.new("TextLabel"),
	TextButton = Instance.new("TextButton"),
	UICorner_4 = Instance.new("UICorner"),
}

KitenFarm.KitenFarm.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
KitenFarm.MainFrame.Parent = KitenFarm.KitenFarm
KitenFarm.UIStroke.Parent = KitenFarm.MainFrame
KitenFarm.UICorner.Parent = KitenFarm.MainFrame
KitenFarm.Title.Parent = KitenFarm.MainFrame
KitenFarm.UIStroke_2.Parent = KitenFarm.Title
KitenFarm.Credits.Parent = KitenFarm.MainFrame
KitenFarm.GoldIngot.Parent = KitenFarm.MainFrame
KitenFarm.GoldText.Parent = KitenFarm.MainFrame
KitenFarm.UIStroke_3.Parent = KitenFarm.GoldText
KitenFarm.Farm.Parent = KitenFarm.MainFrame
KitenFarm.UICorner_2.Parent = KitenFarm.Farm
KitenFarm.Indicator.Parent = KitenFarm.Farm
KitenFarm.AntiIdle.Parent = KitenFarm.MainFrame
KitenFarm.UICorner_3.Parent = KitenFarm.AntiIdle
KitenFarm.Indicator_2.Parent = KitenFarm.AntiIdle
KitenFarm.Desc.Parent = KitenFarm.AntiIdle
KitenFarm.TextButton.Parent = KitenFarm.KitenFarm
KitenFarm.UICorner_4.Parent = KitenFarm.TextButton

KitenFarm.KitenFarm.Name = "KitenFarm"
KitenFarm.KitenFarm.ResetOnSpawn = false
KitenFarm.KitenFarm.IgnoreGuiInset = false
KitenFarm.KitenFarm.DisplayOrder = 0

KitenFarm.MainFrame.Name = "MainFrame"
KitenFarm.MainFrame.ZIndex = 1
KitenFarm.MainFrame.Position = UDim2.new(0.361434966, 0, 0.129914537, 0)
KitenFarm.MainFrame.Size = UDim2.new(0, 310, 0, 150)
KitenFarm.MainFrame.BackgroundColor3 = Color3.fromRGB(33,31,57)
KitenFarm.MainFrame.BackgroundTransparency = 0
KitenFarm.MainFrame.Visible = true
KitenFarm.MainFrame.AnchorPoint = Vector2.new(0, 0)
KitenFarm.MainFrame.ClipsDescendants = false
KitenFarm.MainFrame.BorderSizePixel = 0

KitenFarm.UIStroke.Name = "UIStroke"
KitenFarm.UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
KitenFarm.UIStroke.Color = Color3.fromRGB(220,220,248)
KitenFarm.UIStroke.LineJoinMode = Enum.LineJoinMode.Round
KitenFarm.UIStroke.Thickness = 3
KitenFarm.UIStroke.Transparency = 0
KitenFarm.UIStroke.Enabled = true

KitenFarm.UICorner.Name = "UICorner"
KitenFarm.UICorner.CornerRadius = UDim.new(0, 8)

KitenFarm.Title.Name = "Title"
KitenFarm.Title.ZIndex = 1
KitenFarm.Title.Position = UDim2.new(0.0354838707, 0, 0.0399999991, 0)
KitenFarm.Title.Size = UDim2.new(0, 200, 0, 17)
KitenFarm.Title.BackgroundColor3 = Color3.fromRGB(255,255,255)
KitenFarm.Title.BackgroundTransparency = 1
KitenFarm.Title.Text = "Fastfarm 2026 v1.2"
KitenFarm.Title.TextScaled = true
KitenFarm.Title.TextSize = 14
KitenFarm.Title.Font = Enum.Font.Ubuntu
KitenFarm.Title.TextColor3 = Color3.fromRGB(255,255,255)
KitenFarm.Title.TextStrokeColor3 = Color3.fromRGB(0,0,0)
KitenFarm.Title.TextStrokeTransparency = 1
KitenFarm.Title.TextWrapped = true
KitenFarm.Title.TextXAlignment = Enum.TextXAlignment.Left
KitenFarm.Title.TextYAlignment = Enum.TextYAlignment.Center
KitenFarm.Title.TextTransparency = 0
KitenFarm.Title.Visible = true
KitenFarm.Title.AnchorPoint = Vector2.new(0, 0)
KitenFarm.Title.ClipsDescendants = false

KitenFarm.UIStroke_2.Name = "UIStroke"
KitenFarm.UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
KitenFarm.UIStroke_2.Color = Color3.fromRGB(255,255,255)
KitenFarm.UIStroke_2.LineJoinMode = Enum.LineJoinMode.Round
KitenFarm.UIStroke_2.Thickness = 0.4000000059604645
KitenFarm.UIStroke_2.Transparency = 0
KitenFarm.UIStroke_2.Enabled = true

KitenFarm.Credits.Name = "Credits"
KitenFarm.Credits.ZIndex = 1
KitenFarm.Credits.Position = UDim2.new(0.0354838707, 0, 0.153333336, 0)
KitenFarm.Credits.Size = UDim2.new(0, 144, 0, 11)
KitenFarm.Credits.BackgroundColor3 = Color3.fromRGB(255,255,255)
KitenFarm.Credits.BackgroundTransparency = 1
KitenFarm.Credits.Text = "Credits to KitenOfficial"
KitenFarm.Credits.TextScaled = true
KitenFarm.Credits.TextSize = 14
KitenFarm.Credits.Font = Enum.Font.Ubuntu
KitenFarm.Credits.TextColor3 = Color3.fromRGB(255,255,255)
KitenFarm.Credits.TextStrokeColor3 = Color3.fromRGB(0,0,0)
KitenFarm.Credits.TextStrokeTransparency = 1
KitenFarm.Credits.TextWrapped = true
KitenFarm.Credits.TextXAlignment = Enum.TextXAlignment.Left
KitenFarm.Credits.TextYAlignment = Enum.TextYAlignment.Center
KitenFarm.Credits.TextTransparency = 0
KitenFarm.Credits.Visible = true
KitenFarm.Credits.AnchorPoint = Vector2.new(0, 0)
KitenFarm.Credits.ClipsDescendants = false

KitenFarm.GoldIngot.Name = "GoldIngot"
KitenFarm.GoldIngot.ZIndex = 1
KitenFarm.GoldIngot.Position = UDim2.new(0.870967746, 0, -0.0933333337, 0)
KitenFarm.GoldIngot.Size = UDim2.new(0, 57, 0, 48)
KitenFarm.GoldIngot.BackgroundColor3 = Color3.fromRGB(255,255,255)
KitenFarm.GoldIngot.BackgroundTransparency = 1
KitenFarm.GoldIngot.Image = "rbxassetid://18800115094"
KitenFarm.GoldIngot.ScaleType = Enum.ScaleType.Stretch
KitenFarm.GoldIngot.ImageColor3 = Color3.fromRGB(255,255,255)
KitenFarm.GoldIngot.ImageTransparency = 0
KitenFarm.GoldIngot.Visible = true
KitenFarm.GoldIngot.AnchorPoint = Vector2.new(0, 0)
KitenFarm.GoldIngot.ClipsDescendants = false

KitenFarm.GoldText.Name = "GoldText"
KitenFarm.GoldText.ZIndex = 1
KitenFarm.GoldText.Position = UDim2.new(0.593548357, 0, 0, 0)
KitenFarm.GoldText.Size = UDim2.new(0, 86, 0, 19)
KitenFarm.GoldText.BackgroundColor3 = Color3.fromRGB(255,255,255)
KitenFarm.GoldText.BackgroundTransparency = 1
KitenFarm.GoldText.Text = "+ 99999"
KitenFarm.GoldText.TextScaled = true
KitenFarm.GoldText.TextSize = 14
KitenFarm.GoldText.Font = Enum.Font.Arcade
KitenFarm.GoldText.TextColor3 = Color3.fromRGB(252,239,0)
KitenFarm.GoldText.TextStrokeColor3 = Color3.fromRGB(0,0,0)
KitenFarm.GoldText.TextStrokeTransparency = 1
KitenFarm.GoldText.TextWrapped = true
KitenFarm.GoldText.TextXAlignment = Enum.TextXAlignment.Center
KitenFarm.GoldText.TextYAlignment = Enum.TextYAlignment.Center
KitenFarm.GoldText.TextTransparency = 0
KitenFarm.GoldText.Visible = false
KitenFarm.GoldText.AnchorPoint = Vector2.new(0, 0)
KitenFarm.GoldText.ClipsDescendants = false

KitenFarm.UIStroke_3.Name = "UIStroke"
KitenFarm.UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
KitenFarm.UIStroke_3.Color = Color3.fromRGB(0,0,0)
KitenFarm.UIStroke_3.LineJoinMode = Enum.LineJoinMode.Round
KitenFarm.UIStroke_3.Thickness = 1
KitenFarm.UIStroke_3.Transparency = 0
KitenFarm.UIStroke_3.Enabled = true

KitenFarm.Farm.Name = "Farm"
KitenFarm.Farm.ZIndex = 1
KitenFarm.Farm.Position = UDim2.new(0.0354838707, 0, 0.400000006, 0)
KitenFarm.Farm.Size = UDim2.new(0, 200, 0, 30)
KitenFarm.Farm.BackgroundColor3 = Color3.fromRGB(255,255,255)
KitenFarm.Farm.BackgroundTransparency = 0
KitenFarm.Farm.Text = "Farm"
KitenFarm.Farm.TextScaled = false
KitenFarm.Farm.TextSize = 25
KitenFarm.Farm.Font = Enum.Font.SourceSans
KitenFarm.Farm.TextColor3 = Color3.fromRGB(33,31,56)
KitenFarm.Farm.TextStrokeColor3 = Color3.fromRGB(0,0,0)
KitenFarm.Farm.TextStrokeTransparency = 1
KitenFarm.Farm.TextWrapped = true
KitenFarm.Farm.TextXAlignment = Enum.TextXAlignment.Center
KitenFarm.Farm.TextYAlignment = Enum.TextYAlignment.Center
KitenFarm.Farm.TextTransparency = 0
KitenFarm.Farm.Visible = true
KitenFarm.Farm.AnchorPoint = Vector2.new(0, 0)
KitenFarm.Farm.ClipsDescendants = false

KitenFarm.UICorner_2.Name = "UICorner"
KitenFarm.UICorner_2.CornerRadius = UDim.new(0, 8)

KitenFarm.Indicator.Name = "Indicator"
KitenFarm.Indicator.ZIndex = 1
KitenFarm.Indicator.Position = UDim2.new(0.834999979, 0, 0.0666666701, 0)
KitenFarm.Indicator.Size = UDim2.new(0, 25, 0, 25)
KitenFarm.Indicator.BackgroundColor3 = Color3.fromRGB(255,255,255)
KitenFarm.Indicator.BackgroundTransparency = 1
KitenFarm.Indicator.Image = "rbxassetid://5552526748"
KitenFarm.Indicator.ScaleType = Enum.ScaleType.Stretch
KitenFarm.Indicator.ImageColor3 = Color3.fromRGB(255,0,0)
KitenFarm.Indicator.ImageTransparency = 0
KitenFarm.Indicator.Visible = true
KitenFarm.Indicator.AnchorPoint = Vector2.new(0, 0)
KitenFarm.Indicator.ClipsDescendants = false

KitenFarm.AntiIdle.Name = "AntiIdle"
KitenFarm.AntiIdle.ZIndex = 1
KitenFarm.AntiIdle.Position = UDim2.new(0.0354838707, 0, 0.660000026, 0)
KitenFarm.AntiIdle.Size = UDim2.new(0, 200, 0, 30)
KitenFarm.AntiIdle.BackgroundColor3 = Color3.fromRGB(255,255,255)
KitenFarm.AntiIdle.BackgroundTransparency = 0
KitenFarm.AntiIdle.Text = "Anti Idle"
KitenFarm.AntiIdle.TextScaled = false
KitenFarm.AntiIdle.TextSize = 25
KitenFarm.AntiIdle.Font = Enum.Font.SourceSans
KitenFarm.AntiIdle.TextColor3 = Color3.fromRGB(33,31,56)
KitenFarm.AntiIdle.TextStrokeColor3 = Color3.fromRGB(0,0,0)
KitenFarm.AntiIdle.TextStrokeTransparency = 1
KitenFarm.AntiIdle.TextWrapped = true
KitenFarm.AntiIdle.TextXAlignment = Enum.TextXAlignment.Center
KitenFarm.AntiIdle.TextYAlignment = Enum.TextYAlignment.Center
KitenFarm.AntiIdle.TextTransparency = 0
KitenFarm.AntiIdle.Visible = true
KitenFarm.AntiIdle.AnchorPoint = Vector2.new(0, 0)
KitenFarm.AntiIdle.ClipsDescendants = false

KitenFarm.UICorner_3.Name = "UICorner"
KitenFarm.UICorner_3.CornerRadius = UDim.new(0, 8)

KitenFarm.Indicator_2.Name = "Indicator"
KitenFarm.Indicator_2.ZIndex = 1
KitenFarm.Indicator_2.Position = UDim2.new(0.834999979, 0, 0.0666666701, 0)
KitenFarm.Indicator_2.Size = UDim2.new(0, 25, 0, 25)
KitenFarm.Indicator_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
KitenFarm.Indicator_2.BackgroundTransparency = 1
KitenFarm.Indicator_2.Image = "rbxassetid://5552526748"
KitenFarm.Indicator_2.ScaleType = Enum.ScaleType.Stretch
KitenFarm.Indicator_2.ImageColor3 = Color3.fromRGB(255,0,0)
KitenFarm.Indicator_2.ImageTransparency = 0
KitenFarm.Indicator_2.Visible = true
KitenFarm.Indicator_2.AnchorPoint = Vector2.new(0, 0)
KitenFarm.Indicator_2.ClipsDescendants = false

KitenFarm.Desc.Name = "Desc"
KitenFarm.Desc.ZIndex = 1
KitenFarm.Desc.Position = UDim2.new(1.02999997, 0, 0.0666666701, 0)
KitenFarm.Desc.Size = UDim2.new(0, 87, 0, 25)
KitenFarm.Desc.BackgroundColor3 = Color3.fromRGB(255,255,255)
KitenFarm.Desc.BackgroundTransparency = 1
KitenFarm.Desc.Text = "(stops a kick from afk)"
KitenFarm.Desc.TextScaled = true
KitenFarm.Desc.TextSize = 16
KitenFarm.Desc.Font = Enum.Font.SourceSans
KitenFarm.Desc.TextColor3 = Color3.fromRGB(220,220,248)
KitenFarm.Desc.TextStrokeColor3 = Color3.fromRGB(0,0,0)
KitenFarm.Desc.TextStrokeTransparency = 1
KitenFarm.Desc.TextWrapped = true
KitenFarm.Desc.TextXAlignment = Enum.TextXAlignment.Center
KitenFarm.Desc.TextYAlignment = Enum.TextYAlignment.Center
KitenFarm.Desc.TextTransparency = 0
KitenFarm.Desc.Visible = true
KitenFarm.Desc.AnchorPoint = Vector2.new(0, 0)
KitenFarm.Desc.ClipsDescendants = false

KitenFarm.TextButton.Name = "TextButton"
KitenFarm.TextButton.ZIndex = 1
KitenFarm.TextButton.Position = UDim2.new(0.321973085, 0, 0.0752136782, 0)
KitenFarm.TextButton.Size = UDim2.new(0, 38, 0, 38)
KitenFarm.TextButton.BackgroundColor3 = Color3.fromRGB(243,243,243)
KitenFarm.TextButton.BackgroundTransparency = 0
KitenFarm.TextButton.Text = "-"
KitenFarm.TextButton.TextScaled = true
KitenFarm.TextButton.TextSize = 14
KitenFarm.TextButton.Font = Enum.Font.Arcade
KitenFarm.TextButton.TextColor3 = Color3.fromRGB(33,31,57)
KitenFarm.TextButton.TextStrokeColor3 = Color3.fromRGB(0,0,0)
KitenFarm.TextButton.TextStrokeTransparency = 1
KitenFarm.TextButton.TextWrapped = true
KitenFarm.TextButton.TextXAlignment = Enum.TextXAlignment.Center
KitenFarm.TextButton.TextYAlignment = Enum.TextYAlignment.Center
KitenFarm.TextButton.TextTransparency = 0
KitenFarm.TextButton.Visible = true
KitenFarm.TextButton.AnchorPoint = Vector2.new(0, 0)
KitenFarm.TextButton.ClipsDescendants = false

KitenFarm.UICorner_4.Name = "UICorner"
KitenFarm.UICorner_4.CornerRadius = UDim.new(0, 8)

-- Minimize/Expand
local MainFrame = KitenFarm.MainFrame
local minButton = KitenFarm.TextButton

minButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
	minButton.Text = MainFrame.Visible and "-" or "+"
end)

-- Local references for buttons
local farmButton = KitenFarm.Farm
local farmIndicator = KitenFarm.Indicator
local afkButton = KitenFarm.AntiIdle
local afkIndicator = KitenFarm.Indicator_2
local screenGui = KitenFarm.KitenFarm

-- TELEPORT FUNCTION (NO TWEEN)
local TweenService = game:GetService("TweenService")

local function tp(cf)
	local char = player.Character
	if not char then return end

	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return end

	workspace.Gravity = 0

	-- Сначала телепортируемся в точку
	root.CFrame = cf

	local center = cf.Position
	local radius = 6          -- радиус круга
	local height = 0          -- высота облёта
	local steps = 24          -- плавность
	local circleTime = 1      -- время полного круга (сек)

	for i = 1, steps do
		if not autoFarmEnabled then return end

		local angle = (i / steps) * math.pi * 2

		local pos = center + Vector3.new(
			math.cos(angle) * radius,
			height,
			math.sin(angle) * radius
		)

		-- Смотреть в центр
		root.CFrame = CFrame.lookAt(pos, center)

		task.wait(circleTime / steps)
	end
end

-- AUTO FARM LOOP
local function autoFarmLoop()
	while autoFarmEnabled do
		local char = player.Character or player.CharacterAdded:Wait()
		local root = char:WaitForChild("HumanoidRootPart", 5)
		if not root then return end

		for i, cf in ipairs(destinations) do
			if not autoFarmEnabled then return end
			tp(cf)

			if i == #destinations then
				workspace.Gravity = gravityNormal
			end
		end

		task.wait(1)
	end
end

-- AUTO FARM BUTTON
farmButton.MouseButton1Click:Connect(function()
	autoFarmEnabled = not autoFarmEnabled

	if autoFarmEnabled then
		farmIndicator.ImageColor3 = Color3.fromRGB(0, 255, 0)
		task.spawn(autoFarmLoop)
	else
		farmIndicator.ImageColor3 = Color3.fromRGB(255, 0, 0)
		workspace.Gravity = gravityNormal
	end
end)

-- ANTI AFK BUTTON
afkButton.MouseButton1Click:Connect(function()
	antiAfkEnabled = not antiAfkEnabled

	if antiAfkEnabled then
		afkIndicator.ImageColor3 = Color3.fromRGB(0, 255, 0)
	else
		afkIndicator.ImageColor3 = Color3.fromRGB(255, 0, 0)
	end
end)

-- ANTI AFK LOOP
task.spawn(function()
	while true do
		task.wait(10)
		if antiAfkEnabled then
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.K, false, game)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.K, false, game)
		end
	end
end)

-- RESPAWN FIX
player.CharacterAdded:Connect(function()
	task.wait(1)
	if autoFarmEnabled then
		task.spawn(autoFarmLoop)
	end
end)


