local UIConfig = {}

UIConfig.Icons = {
	Settings = "rbxassetid://REPLACE_WITH_ID",
	Profile = "rbxassetid://REPLACE_WITH_ID",
	Menu = "rbxassetid://REPLACE_WITH_ID",
	Cart = "rbxassetid://REPLACE_WITH_ID",
}

UIConfig.IconOrder = { "Settings", "Profile", "Menu", "Cart" }

UIConfig.Colors = {
	BarBackground = Color3.fromRGB(30, 30, 30),
	ButtonBackground = Color3.fromRGB(20, 20, 20),
	NeonGreen = Color3.fromRGB(0, 255, 70),
	White = Color3.fromRGB(255, 255, 255),
}

UIConfig.Sizes = {
	TotalWidth = 340,
	TopBarHeight = 60,
	HealthBarHeight = 28,
	BarGap = 4,
	IconSize = 28,
	CornerRadius = 6,
	ButtonPadding = 10,
	ButtonSpacing = 42,
}

UIConfig.Transparency = {
	BarBackground = 0.25,
	ButtonNormal = 0.4,
	ButtonHover = 0.1,
}

UIConfig.Fonts = {
	ClockSize = 13,
	MoneySize = 20,
	HealthSize = 13,
}

UIConfig.Leaderstats = {
	ValueName = "Cash",
}

table.freeze(UIConfig.Icons)
table.freeze(UIConfig.IconOrder)
table.freeze(UIConfig.Colors)
table.freeze(UIConfig.Sizes)
table.freeze(UIConfig.Transparency)
table.freeze(UIConfig.Fonts)
table.freeze(UIConfig.Leaderstats)
table.freeze(UIConfig)

return UIConfig
