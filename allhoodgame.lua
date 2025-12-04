local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UnderDevelopmentGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create Frame (background)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.Position = UDim2.new(0, 0, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Create TextLabel for main text
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0.8, 0, 0.3, 0)
textLabel.Position = UDim2.new(0.1, 0, 0.35, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "UNDER DEVELOPMENT"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.GothamBold
textLabel.Parent = frame

-- Create UIStroke for outline effect
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 170, 0)
stroke.Thickness = 4
stroke.Parent = textLabel

-- Add blinking animation
local function blinkText()
	while true do
		for i = 0, 1, 0.1 do
			textLabel.TextTransparency = i
			wait(0.05)
		end
		for i = 1, 0, -0.1 do
			textLabel.TextTransparency = i
			wait(0.05)
		end
	end
end

spawn(blinkText)
