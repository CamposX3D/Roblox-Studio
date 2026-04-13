local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local buttonEvent = Instance.new("RemoteEvent")
buttonEvent.Name = "ButtonEvent"
buttonEvent.Parent = ReplicatedStorage

local VALID_BUTTONS = {
	Settings = true,
	Profile = true,
	Menu = true,
	Cart = true,
}

local MAX_PER_SECOND = 5
local rateLog = {}

local function isWithinRateLimit(player)
	local now = tick()
	local id = player.UserId
	if not rateLog[id] then
		rateLog[id] = {}
	end
	local filtered = {}
	for _, timestamp in ipairs(rateLog[id]) do
		if now - timestamp < 1 then
			table.insert(filtered, timestamp)
		end
	end
	rateLog[id] = filtered
	if #filtered >= MAX_PER_SECOND then
		return false
	end
	table.insert(rateLog[id], now)
	return true
end

buttonEvent.OnServerEvent:Connect(function(player, buttonName)
	if not player or not player.Parent then
		return
	end
	if not player.Character then
		return
	end
	if not player.Character:FindFirstChildOfClass("Humanoid") then
		return
	end
	if type(buttonName) ~= "string" then
		return
	end
	if not VALID_BUTTONS[buttonName] then
		return
	end
	if not isWithinRateLimit(player) then
		return
	end
end)

Players.PlayerRemoving:Connect(function(player)
	rateLog[player.UserId] = nil
end)
