local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/morgenzhtern/UI-Libs/main/Neverlose/Source.lua"))()

local Window = Library:Window("NEVERLOSE", Enum.KeyCode.LeftShift)

Window:Label("Cool Label")

local InfoTab = Window:Tab("Info Tab", "http://www.roblox.com/asset/?id=13755099386", true)
local Tab = Window:Tab("Tab", "http://www.roblox.com/asset/?id=13755099386", false)

--// [[ Info Tab ]] //--

InfoTab:Text("Text", Color3.fromRGB(0, 187, 255))
InfoTab:Text("Another Text", Color3.fromRGB(255, 0, 0))

for i = 1, 100 do
	InfoTab:Text("Idk Text", Color3.fromRGB(i, 255 - i, 50 + i))
end

--// [[ Tab ]] //--

local Wow_Section = Tab:Section("Wow")
local Idk_Section = Tab:Section("Idk Section")

local Button
Button = Wow_Section:Button("Change Button Name", function()
	Button:ReName("123")
end)

local Button
Button = Wow_Section:Button("Destroy Button", function()
	Button:Destroy()
end)

local Button
Button = Wow_Section:Button("Hide For 1 Sec", function()
	Button:Visiblity(false)
	task.wait(1)
	Button:Visiblity(true)
end)

Idk_Section:Toggle("Toggle", true, function(Bool)
	print(Bool)
end)

local Slider
Slider = Idk_Section:Slider("Slider", 5, 500, 67, function(Value)
	print(Value)
end)

local Button
Button = Wow_Section:Button("Change Slider Value", function()
	Slider:Change(25)
end)
