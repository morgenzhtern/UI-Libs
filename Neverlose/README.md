# LIBRARY IS NOT DONE AND SOME BUGS MAY OCCUR


# Neverlose UI-Library

My UI-Library for Roblox Exploiting, [source code](Source.lua) is not obfuscated.

## Getting Started

To begin, you need to declare a variable to access the library:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/morgenzhtern/UI-Libs/main/Neverlose/Source.lua"))()
```

To create a window:

```lua
local Window = Library:Window("idk", Color3.fromRGB(5, 189, 249), Enum.KeyCode.LeftShift)
```
*First argument - script name, 2nd argument - main color of UI, 3rd argument - GUI hide bind.*

To create tab:

```lua
local Rage = Window:Tab("Tab Name 123", "http://www.roblox.com/asset/?id=13755099386")
```

To create a label in tab container:

```lua
Window:Label("Label Name")
```

To create a section in tab:

```lua
local Wow_Section = Rage:Section("Wow")
```

To create a button in section:

```lua
local Button = Wow_Section:Button("Button Name", function()
    print("123")
end)
```

To create a toggle in section:

```lua
local Toggle = Wow_Section:Toggle("Toggle Name", true, function(Bool)
    print(Bool)
end)
```

To create a slider in section:

```lua
local Slider = Idk_Section:Slider("Slider Name", 1, 5, 1, function(Value)
    print(Value)
end)
```
*2nd argument is min value of slider, 3rd argument is max value of slider, 4th argument is value to start with*

You can change value of slider:

```lua
Slider:Change(100)
```

You can set visiblity of any button in section:

```lua
Button:Visiblity(true)
```
*In first argument you can use only bool (true or false)*

You can destroy any button in section:

```lua
Button:Destroy()
```

You can rename any button in section:

```lua
Button:ReName("New Name")
```
