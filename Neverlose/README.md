**LIBRARY IS NOT DONE AND SOME BUGS MAY OCCUR**


# Neverlose UI-Library

My UI-Library for Roblox Exploiting, [source code](Source.lua) is not obfuscated.

## Getting Started

To begin, you need to declare a variable to access the library:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/morgenzhtern/UI-Libs/main/Neverlose/Source.lua"))()
```

To load the UI, simply call the function:

```lua
local Window = Library:Window("idk", Color3.fromRGB(5, 189, 249), Enum.KeyCode.LeftShift)
```
**Argument 1: Name of your UI (`String`)**
**Argument 2: Main color of your UI (`Color3.fromRGB`)**
**Argument 3: UI hide bind (`Enum.KeyCode`)**

## Implementing Features

### Tab

You can create multiple tabs to organize your features:

```lua
local Tab = Window:Tab("MyTab", "http://www.roblox.com/asset/?id=13755099386")
```
**Argument 1: Name of your tab (`String`)**
**Argument 2: The Image ID (`String`)**

And you can create labels:

```lua
Window:Label("Label Name")
```

To create a section in tab:

```lua
local Wow_Section = Tab:Section("Wow")
```

### Button

```lua
local Button = Wow_Section:Button("Button Name", function()
    print("123")
end)
```

### Toggle

```lua
local Toggle = Wow_Section:Toggle("Toggle Name", true, function(Bool)
    print(Bool)
end)
```

### Slider

```lua
local Slider = Idk_Section:Slider("Slider Name", 1, 5, 1, function(Value)
    print(Value)
end)
```
**Argument 2: Min value of slider (`Number`)**
**Argument 3: Max value of slider (`Number`)**
**Argument 4: Value to start with (`Number`)**

You can change value of slider:

```lua
Slider:Change(100)
```

Also you can set visiblity of any button in section:

```lua
Button:Visiblity(true)
```
**In Argument 1 you can use **only bool** (`true` or `false`)**

And you can destroy any button in section:

```lua
Button:Destroy()
```

You can ReName any button in section:

```lua
Button:ReName("New Name")
```

Enjoy using the Neverlose UI-Library!
Have fun.
