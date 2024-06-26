local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/morgenzhtern/UI-Libs/main/Wild/Source.lua"))()

local Window = Library:Window(
	
	"Script Name", -- Script Name
	Color3.fromRGB(65, 233, 233), -- Window Main Color ( Can be changed with Window:ReColor(Color) )
	Enum.KeyCode.LeftShift -- Window Hide Bind
	
)

local Tab1 = Window:Tab("First Tab", "rbxassetid://16095745392")
local Tab2 = Window:Tab("Second Tab", "rbxassetid://11419702273")

Tab1:Button(

	"ReColor Window", -- Button Name
	Enum.KeyCode.F, -- Bind 

	function() -- Button Click Function

		Window:ReColor(Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255)))

	end

)

Tab1:Button(

	"Button", -- Button Name
	nil, -- Bind 

	function() -- Button Click Function

		print("Button Pressed")

	end

)

Tab1:Toggle(
	
	"Toggle", -- Toggle Name
	false, -- Start Bool
	nil, -- Bind
	
	function(Bool) -- Toggle Function

		print(Bool)

	end
	
)

Tab1:Label(
	
	"Ugly Label", -- Label Name
	Enum.TextXAlignment.Center -- You can replace "Center" with "Left" or "Right"
	
)

Tab1:Slider(
	
	"Slider", -- Slider Name
	1, -- Minimum Slider Value
	100, -- Maximum Slider Value
	50, -- Start Value
	
	function(Value) -- "Slider Value Changed" Function
	
		print(Value)
	
	end
	
)

Tab1:TextBox(
	
	"TextBox", -- TextBox Name
	"Start Text", -- Start Text
	
	function(Text) -- "Done Text Writing" Function
	
		print(Text)
	
	end
	
)

Tab1:DropDown(
	
	"DropDown Button", -- DropDown Name
	{"Option 1", "Option 2"}, -- Options
	false, -- Toggleable DropDown
	
	function(Option) -- "DropDown Option Selected" Function

		print(Option)

	end
	
)

Tab1:DropDown(
	
	"DropDown Toggle", -- DropDown Name
	
	{ -- Options
		{
			"Option 1", -- Option Name
			true -- Option Bool
		}, 
		
		{
			"Option 2", -- Option Name
			false -- Option Bool
		}
	}, 
	
	true, -- Toggleable DropDown
	
	function(Option) -- "DropDown Option Selected" Function
		
		local Option_Name, Option_Bool = Option[1], Option[2]
		
		print(Option_Name)
		print(Option_Bool)

	end
	
)
