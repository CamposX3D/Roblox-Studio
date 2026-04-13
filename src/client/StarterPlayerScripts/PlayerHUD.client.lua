local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local UIConfig = require(ReplicatedStorage:WaitForChild("UIConfig"))

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")
local buttonEvent = ReplicatedStorage:WaitForChild("ButtonEvent")

local function formatMoney(amount)
	local formatted = tostring(math.floor(amount))
	while true do
		local result, replacements = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
		formatted = result
		if replacements == 0 then
			break
		end
	end
	return "$" .. formatted
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerHUD"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local containerHeight = UIConfig.Sizes.TopBarHeight + UIConfig.Sizes.BarGap + UIConfig.Sizes.HealthBarHeight

local container = Instance.new("Frame")
container.Name = "HUDContainer"
container.Size = UDim2.new(0, UIConfig.Sizes.TotalWidth, 0, containerHeight)
container.Position = UDim2.new(0, 10, 1, -10)
container.AnchorPoint = Vector2.new(0, 1)
container.BackgroundTransparency = 1
container.BorderSizePixel = 0
container.Parent = screenGui

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, UIConfig.Sizes.TopBarHeight)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = UIConfig.Colors.BarBackground
topBar.BackgroundTransparency = UIConfig.Transparency.BarBackground
topBar.BorderSizePixel = 0
topBar.ClipsDescendants = true
topBar.Parent = container

local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, UIConfig.Sizes.CornerRadius)
topBarCorner.Parent = topBar

if UIConfig.Textures and UIConfig.Textures.TopBarTexture then
	local textureBackground = Instance.new("ImageLabel")
	textureBackground.Name = "TextureBackground"
	textureBackground.Size = UDim2.new(1, 0, 1, 0)
	textureBackground.Position = UDim2.new(0, 0, 0, 0)
	textureBackground.BackgroundTransparency = 1
	textureBackground.Image = UIConfig.Textures.TopBarTexture
	textureBackground.ScaleType = Enum.ScaleType.Tile
	textureBackground.TileSize = UDim2.new(0, 128, 0, 128)
	textureBackground.ImageTransparency = UIConfig.Transparency.TextureOverlay or 0.6
	textureBackground.ZIndex = 0
	textureBackground.Parent = topBar
end

local clockLabel = Instance.new("TextLabel")
clockLabel.Name = "ClockLabel"
clockLabel.Size = UDim2.new(0, 140, 0, 16)
clockLabel.Position = UDim2.new(0, 10, 0, 5)
clockLabel.BackgroundTransparency = 1
clockLabel.TextColor3 = UIConfig.Colors.ClockText
clockLabel.TextSize = UIConfig.Fonts.ClockSize
clockLabel.Font = Enum.Font.GothamBold
clockLabel.TextXAlignment = Enum.TextXAlignment.Left
clockLabel.Text = "00:00:00"
clockLabel.ZIndex = 1
clockLabel.Parent = topBar

local moneyLabel = Instance.new("TextLabel")
moneyLabel.Name = "MoneyLabel"
moneyLabel.Size = UDim2.new(0, 140, 0, 24)
moneyLabel.Position = UDim2.new(0, 10, 0, 22)
moneyLabel.BackgroundTransparency = 1
moneyLabel.TextColor3 = UIConfig.Colors.MoneyText
moneyLabel.TextSize = UIConfig.Fonts.MoneySize
moneyLabel.Font = Enum.Font.GothamBold
moneyLabel.TextXAlignment = Enum.TextXAlignment.Left
moneyLabel.Text = "$0"
moneyLabel.ZIndex = 1
moneyLabel.Parent = topBar

local iconCount = #UIConfig.IconOrder
local hoverTweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local buttonSize = UIConfig.Sizes.IconSize + UIConfig.Sizes.ButtonPadding

for i, name in ipairs(UIConfig.IconOrder) do
	local button = Instance.new("ImageButton")
	button.Name = name .. "Button"
	button.Size = UDim2.new(0, buttonSize, 0, buttonSize)
	button.Position = UDim2.new(1, -((iconCount - i + 1) * UIConfig.Sizes.ButtonSpacing), 0.5, 0)
	button.AnchorPoint = Vector2.new(0, 0.5)
	button.BackgroundColor3 = UIConfig.Colors.ButtonBackground
	button.BackgroundTransparency = UIConfig.Transparency.ButtonNormal
	button.Image = UIConfig.Icons[name]
	button.BorderSizePixel = 0
	button.ZIndex = 2
	button.Parent = topBar

	local buttonCorner = Instance.new("UICorner")
	buttonCorner.CornerRadius = UDim.new(0, UIConfig.Sizes.CornerRadius)
	buttonCorner.Parent = button

	button.MouseEnter:Connect(function()
		TweenService:Create(button, hoverTweenInfo, {
			BackgroundTransparency = UIConfig.Transparency.ButtonHover,
		}):Play()
	end)

	button.MouseLeave:Connect(function()
		TweenService:Create(button, hoverTweenInfo, {
			BackgroundTransparency = UIConfig.Transparency.ButtonNormal,
		}):Play()
	end)

	button.Activated:Connect(function()
		buttonEvent:FireServer(name)
	end)
end

local healthBarY = UIConfig.Sizes.TopBarHeight + UIConfig.Sizes.BarGap

local healthBar = Instance.new("Frame")
healthBar.Name = "HealthBar"
healthBar.Size = UDim2.new(1, 0, 0, UIConfig.Sizes.HealthBarHeight)
healthBar.Position = UDim2.new(0, 0, 0, healthBarY)
healthBar.BackgroundColor3 = UIConfig.Colors.BarBackground
healthBar.BackgroundTransparency = UIConfig.Transparency.BarBackground
healthBar.BorderSizePixel = 0
healthBar.ClipsDescendants = true
healthBar.Parent = container

local healthBarCorner = Instance.new("UICorner")
healthBarCorner.CornerRadius = UDim.new(0, UIConfig.Sizes.CornerRadius)
healthBarCorner.Parent = healthBar

local healthFill = Instance.new("Frame")
healthFill.Name = "HealthFill"
healthFill.Size = UDim2.new(1, 0, 1, 0)
healthFill.Position = UDim2.new(0, 0, 0, 0)
healthFill.BackgroundColor3 = UIConfig.Colors.NeonGreen
healthFill.BorderSizePixel = 0
healthFill.Parent = healthBar

local healthFillCorner = Instance.new("UICorner")
healthFillCorner.CornerRadius = UDim.new(0, UIConfig.Sizes.CornerRadius)
healthFillCorner.Parent = healthFill

local healthLabel = Instance.new("TextLabel")
healthLabel.Name = "HealthLabel"
healthLabel.Size = UDim2.new(1, 0, 1, 0)
healthLabel.Position = UDim2.new(0, 0, 0, 0)
healthLabel.BackgroundTransparency = 1
healthLabel.TextColor3 = UIConfig.Colors.White
healthLabel.TextSize = UIConfig.Fonts.HealthSize
healthLabel.Font = Enum.Font.GothamBold
healthLabel.Text = "SA\195\154DE 100%"
healthLabel.ZIndex = 2
healthLabel.Parent = healthBar

task.spawn(function()
	while true do
		local now = os.time()
		local hours = math.floor(now / 3600) % 24
		local minutes = math.floor(now / 60) % 60
		local seconds = now % 60
		clockLabel.Text = string.format("%02d:%02d:%02d", hours, minutes, seconds)
		task.wait(1)
	end
end)

task.spawn(function()
	local leaderstats = localPlayer:WaitForChild("leaderstats")
	local cash = leaderstats:WaitForChild(UIConfig.Leaderstats.ValueName)
	moneyLabel.Text = formatMoney(cash.Value)
	cash.Changed:Connect(function(newValue)
		moneyLabel.Text = formatMoney(newValue)
	end)
end)

local healthTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local lastHealthPercent = -1

RunService.Heartbeat:Connect(function()
	pcall(function()
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			return
		end
		local ratio = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
		local percent = math.floor(ratio * 100)
		if percent == lastHealthPercent then
			return
		end
		lastHealthPercent = percent
		TweenService:Create(healthFill, healthTweenInfo, {
			Size = UDim2.new(ratio, 0, 1, 0),
		}):Play()
		healthLabel.Text = "SA\195\154DE " .. percent .. "%"
	end)
end)
