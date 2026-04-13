local UIConfig = {}

UIConfig.Icons = {
	Settings = "rbxassetid://REPLACE_WITH_ID",
	Profile = "rbxassetid://REPLACE_WITH_ID",
	Menu = "rbxassetid://REPLACE_WITH_ID",
	Cart = "rbxassetid://REPLACE_WITH_ID",
}

UIConfig.IconOrder = { "Settings", "Profile", "Menu", "Cart" }

UIConfig.Textures = {
	TopBarTexture = "rbxassetid://REPLACE_WITH_TEXTURE_ID",
}

UIConfig.Colors = {
	BarBackground = Color3.fromRGB(30, 30, 30),
	ButtonBackground = Color3.fromRGB(20, 20, 20),
	NeonGreen = Color3.fromRGB(0, 255, 60),
	White = Color3.fromRGB(255, 255, 255),
	ClockText = Color3.fromRGB(0, 255, 60),
	MoneyText = Color3.fromRGB(0, 255, 60),
}

UIConfig.Sizes = {
	TotalWidth = 295,
	TopBarHeight = 48,
	HealthBarHeight = 32,
	BarGap = 2,
	IconSize = 24,
	CornerRadius = 8,
	ButtonPadding = 6,
	ButtonSpacing = 34,
}

UIConfig.Transparency = {
	BarBackground = 0.25,
	ButtonNormal = 0.3,
	ButtonHover = 0.1,
	TextureOverlay = 0.6,
}

UIConfig.Fonts = {
	ClockSize = 13,
	MoneySize = 22,
	HealthSize = 14,
}

UIConfig.Leaderstats = {
	ValueName = "Cash",
}

table.freeze(UIConfig.Icons)
table.freeze(UIConfig.IconOrder)
table.freeze(UIConfig.Textures)
table.freeze(UIConfig.Colors)
table.freeze(UIConfig.Sizes)
table.freeze(UIConfig.Transparency)
table.freeze(UIConfig.Fonts)
table.freeze(UIConfig.Leaderstats)
table.freeze(UIConfig)

return UIConfig
