local New, Current_Container = Instance.new, nil

local Player = game:GetService("Players").LocalPlayer

local Tween = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local Inject_Path = game.CoreGui

local Bool = New("BoolValue")
Bool.Value = true

local Gui_Is_Visible = true

local function Make_Draggable(GUI)
  
  local Dragging, Drag_Input, Drag_Start, Start_Position
  
  GUI.InputBegan:Connect(function(Input)

    if (Input.UserInputType == Enum.UserInputType.MouseButton1) or (Input.UserInputType == Enum.UserInputType.Touch) then
      
      Dragging = true
      Drag_Start = Input.Position
      Start_Position = GUI.Position

      Input.Changed:Connect(function()

        if Input.UserInputState == Enum.UserInputState.End then

          Dragging = false

        end

      end)

    end

  end)

  GUI.InputChanged:Connect(function(Input)

    if (Input.UserInputType == Enum.UserInputType.MouseMovement) or (Input.UserInputType == Enum.UserInputType.Touch) then

      Drag_Input = Input

    end

  end)

  UIS.InputChanged:Connect(function(Input)

    if Input == Drag_Input and Dragging and Gui_Is_Visible then

      local Delta = Input.Position - Drag_Start
      local Position = UDim2.new(Start_Position.X.Scale, Start_Position.X.Offset + Delta.X, Start_Position.Y.Scale, Start_Position.Y.Offset + Delta.Y)
        
      Tween:Create(GUI, TweenInfo.new(0.15), {Position = Position}):Play()
        
    end

  end)
  
end

local function Make_Text_Bold(Text)

  local Font_Face = Text.FontFace
  
  Font_Face.Weight = Enum.FontWeight.Bold

  Text.FontFace = Font_Face
  
end

local function Ratio(GUI, Value)
  
  local Aspect_Ratio = New("UIAspectRatioConstraint")

  Aspect_Ratio.Parent = GUI
  Aspect_Ratio.AspectRatio = Value
  
end	

local function Corner(GUI, Value)
  
  local Smooth_Corner = New("UICorner") 
  
  Smooth_Corner.Parent = GUI
  Smooth_Corner.CornerRadius = UDim.new(0, Value)
  
end

local function Give_Transparency_Value(GUI)
  
  local Background_Transparency = New("NumberValue")
  
  Background_Transparency.Name = "Background_Transparency"
  Background_Transparency.Parent = GUI
  Background_Transparency.Value = GUI.BackgroundTransparency
  
  if (GUI:IsA("TextButton") or GUI:IsA("TextLabel") or GUI:IsA("TextBox")) then
    
    local Text_Transparency = New("NumberValue")
    
    Text_Transparency.Name = "Text_Transparency"
    Text_Transparency.Parent = GUI
    Text_Transparency.Value = GUI.TextTransparency
    
  elseif (GUI:IsA("ImageButton") or GUI:IsA("ImageLabel")) then
    
    local Image_Transparency = New("NumberValue")

    Image_Transparency.Name = "Image_Transparency"
    Image_Transparency.Parent = GUI
    Image_Transparency.Value = GUI.ImageTransparency
    
  end
  
end

local Library = {}

function Library:Window(Name, Bind)
  
  local Screen, Background, Main, Container, Layout, Script_Name, Right_Line, Menu, Search, Menu_Page, Menu_Container, Menu_Image, Menu_Name, Menu_Close, Menu_Layout = New("ScreenGui"), New("Frame"), New("Frame"), New("ScrollingFrame"), New("UIListLayout"), New("TextLabel"), New("Frame"), New("ImageButton"), New("ImageButton"), New("Frame"), New("Frame"), New("ImageLabel"), New("TextLabel"), New("ImageButton"), New("UIListLayout")
  
  Screen.Parent = Inject_Path
  Screen.Name = "Neverlose"
  Screen.ResetOnSpawn = false
  Screen.IgnoreGuiInset = true
  Screen.DisplayOrder = 7777777
  
  Background.Parent = Screen
  Background.AnchorPoint = Vector2.new(0.5, 0.5)
  Background.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
  Background.BackgroundTransparency = 0
  Background.BorderSizePixel = 0
  Background.Position = UDim2.new(0.5, 0, 0.5, 0)
  Background.Size = UDim2.new(0.499, 0, 0.789, 0)
  
  Main.Parent = Background
  Main.BackgroundColor3 = Color3.fromRGB(0, 1, 9)
  Main.BackgroundTransparency = 0.1
  Main.BorderSizePixel = 0
  Main.Position = UDim2.new(-0.302, 0, 0, 0)
  Main.Size = UDim2.new(0.313, 0, 1, 0)
  Main.ZIndex = -1
  
  Right_Line.Parent = Background
  Right_Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Right_Line.BackgroundTransparency = 0.99
  Right_Line.Position = UDim2.new(0.966, 0, 0.118, 0)
  Right_Line.Size = UDim2.new(3.228, 0, 0.005, 0)
  
  Menu.Parent = Background
  Menu.BackgroundTransparency = 1
  Menu.Position = UDim2.new(0.859, 0, 0.036, 0)
  Menu.Size = UDim2.new(0.04, 0, 0.042, 0)
  Menu.Image = "rbxassetid://11295285432"
  Menu.ImageColor3 = Color3.fromRGB(255, 255, 255)
  Menu.ZIndex = 10
  
  Menu_Page.Parent = Background
  Menu_Page.Visible = false
  Menu_Page.BackgroundColor3 = Color3.fromRGB(4, 15, 29)
  Menu_Page.Position = UDim2.new(0.13, 0, 0.179, 0)
  Menu_Page.Size = UDim2.new(0.457, 0, 0.642, 0)
  Menu_Page.ZIndex = 10
  
  Menu_Container.Parent = Menu_Page
  Menu_Container.BackgroundTransparency = 1
  Menu_Container.Position = UDim2.new(0, 0, 0.079, 0)
  Menu_Container.Size = UDim2.new(0.977, 0, 0.919, 0)
  Menu_Container.ZIndex = 10
  
  Menu_Image.Parent = Menu_Page
  Menu_Image.BackgroundTransparency = 1
  Menu_Image.Position = UDim2.new(0.022, 0, 0.017, 0)
  Menu_Image.Size = UDim2.new(0.055, 0, 0.042, 0)
  Menu_Image.Image = "rbxassetid://11293977610"
  Menu_Image.ImageColor3 = Color3.fromRGB(85, 192, 238)
  Menu_Image.ZIndex = 10
  
  Menu_Name.Parent = Menu_Page
  Menu_Name.BackgroundTransparency = 1
  Menu_Name.Position = UDim2.new(0.092, 0, 0.017, 0)
  Menu_Name.Size = UDim2.new(0.55, 0, 0.042, 0)
  Menu_Name.Text = "Settings (not done)"
  Menu_Name.TextColor3 = Color3.fromRGB(255, 255, 255)
  Menu_Name.TextScaled = true
  Menu_Name.TextXAlignment = Enum.TextXAlignment.Left
  Menu_Name.ZIndex = 10
  
  Menu_Close.Parent = Menu_Page
  Menu_Close.Image = "rbxassetid://11293981586"
  Menu_Close.BackgroundTransparency = 1
  Menu_Close.ImageColor3 = Color3.fromRGB(255, 255, 255)
  Menu_Close.Position = UDim2.new(0.922, 0, 0.017, 0)
  Menu_Close.Size = UDim2.new(0.055, 0, 0.042, 0)
  Menu_Close.ZIndex = 10
  
  Menu_Layout.Parent = Menu_Container
  Menu_Layout.FillDirection = Enum.FillDirection.Vertical
  Menu_Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
  Menu_Layout.VerticalAlignment = Enum.VerticalAlignment.Top
  
  Search.Parent = Background
  Search.BackgroundTransparency = 1
  Search.Position = UDim2.new(0.925, 0, 0.036, 0)
  Search.Size = UDim2.new(0.04, 0, 0.042, 0)
  Search.Image = "rbxassetid://11293977875"
  Search.ImageColor3 = Color3.fromRGB(255, 255, 255)
  Search.ZIndex = 10
  
  Menu_Close.MouseButton1Click:Connect(function()
    
    Menu_Page.Visible = false
    
  end)
  
  Menu.MouseButton1Click:Connect(function()
    
    Menu_Page.Visible = not Menu_Page.Visible
    
  end)
  
  Container.Parent = Main
  Container.BackgroundTransparency = 1
  Container.BorderSizePixel = 0
  Container.Position = UDim2.new(0, 0, 0.131, 0)
  Container.Size = UDim2.new(0.966, 0, 0.759, 0)
  Container.CanvasSize = UDim2.new(0, 0, 0, 0)
  Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
  Container.ScrollBarImageTransparency = 1
  Container.ScrollingDirection = Enum.ScrollingDirection.Y
  
  Layout.Parent = Container
  Layout.Padding = UDim.new(0, 3)
  
  Script_Name.Parent = Main
  Script_Name.BackgroundTransparency = 1
  Script_Name.Position = UDim2.new(0, 0, 0.047, 0)
  Script_Name.Size = UDim2.new(0.965, 0, 0.051, 0)
  Script_Name.Font = Enum.Font.Gotham
  Script_Name.Text = Name
  Script_Name.TextScaled = true
  Script_Name.TextColor3 = Color3.fromRGB(255, 255, 255)
  
  --[[Stroke.Parent = Script_Name
  Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
  Stroke.Color = Color
  Stroke.Thickness = 0.86
  Stroke.Transparency = 0.36]]
  
  Make_Text_Bold(Script_Name)
  
  Give_Transparency_Value(Background)
  Give_Transparency_Value(Main)
  Give_Transparency_Value(Script_Name)
  Give_Transparency_Value(Right_Line)
  Give_Transparency_Value(Menu)
  Give_Transparency_Value(Search)
  
  Ratio(Background, 1.057)
  Ratio(Menu, 1)
  Ratio(Search, 1)
  
  Corner(Main, 6)
  Corner(Background, 6)
  Corner(Menu_Page, 6)

  Make_Draggable(Background)
  
  local Window_Functions = {}
  
  function Window_Functions:Destroy()
    Screen:Destroy()
  end
  
  function Window_Functions:Label(Name)
    
    local Barrier, Label = New("Frame"), New("TextLabel")
    
    Barrier.Parent = Container
    Barrier.BackgroundTransparency = 1
    Barrier.Size = UDim2.new(0.976, 0, 0.069, 0)
    
    Label.Parent = Barrier
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0.135, 0, 0.422, 0)
    Label.Size = UDim2.new(0.595, 0, 0.417, 0)
    Label.Font = Enum.Font.Gotham
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextTransparency = 0.16
    Label.TextScaled = true
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    Give_Transparency_Value(Label)
    
  end
  
  function Window_Functions:Tab(Name, Icon, Info)
    
    local Barrier, Button, Image, Title, New_Container, Layout, Left_Side, Left_Layout, Right_Side, Right_Layout = New("Frame"), New("TextButton"), New("ImageLabel"), New("TextLabel"), New("ScrollingFrame"), New("UIListLayout"), New("Frame"), New("UIListLayout"), New("Frame"), New("UIListLayout")
    
    if Background:FindFirstChildWhichIsA("ScrollingFrame") then

      Button.BackgroundTransparency = 1
      
      New_Container.Visible = false
      
    else
      
      Button.BackgroundTransparency = 0.1
      
      Current_Container = New_Container
      
    end
    
    Barrier.Parent = Container
    Barrier.BackgroundTransparency = 1
    Barrier.Size = UDim2.new(0.976, 0, 0.079, 0)
    
    Button.Parent = Barrier
    Button.AutoButtonColor = false
    Button.BackgroundColor3 = Color3.fromRGB(15, 62, 89)
    Button.BorderSizePixel = 0
    Button.Position = UDim2.new(0.063, 0, 0, 0)
    Button.Size = UDim2.new(0.909, 0, 0.868, 0)
    Button.TextTransparency = 1
    
    Image.Parent = Button
    Image.BackgroundTransparency = 1
    Image.Position = UDim2.new(0.08, 0, 0.182, 0)
    Image.Size = UDim2.new(0.131, 0, 0.682, 0)
    Image.Image = Icon
    Image.ImageColor3 = Color3.fromRGB(85, 192, 238)
    
    Title.Parent = Button
    Title.Position = UDim2.new(0.27, 0, 0.273, 0)
    Title.Size = UDim2.new(0.7, 0, 0.523, 0)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.Gotham
    Title.Text = Name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    New_Container.Parent = Background
    New_Container.BackgroundTransparency = 1
    New_Container.ScrollBarImageTransparency = 1
    New_Container.ScrollBarThickness = 0
    New_Container.ScrollingDirection = Enum.ScrollingDirection.Y
    New_Container.CanvasSize = UDim2.new(0, 0, 0, 0)
    New_Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
    New_Container.Position = UDim2.new(0.034, 0, 0.156, 0)
    New_Container.Size = UDim2.new(0.935, 0, 0.84, 0)
    
    Layout.Parent = New_Container
    Layout.FillDirection = Enum.FillDirection.Horizontal
    
    if Info == false then

      Left_Side.Parent = New_Container
      Left_Side.BackgroundTransparency = 1
      Left_Side.Size = UDim2.new(0.5, 0, 1, 0)

      Left_Layout.Parent = Left_Side
      Left_Layout.SortOrder = Enum.SortOrder.LayoutOrder

      Right_Side.Parent = New_Container
      Right_Side.BackgroundTransparency = 1
      Right_Side.Size = UDim2.new(0.5, 0, 1, 0)

      Right_Layout.Parent = Right_Side
      Right_Layout.SortOrder = Enum.SortOrder.LayoutOrder
      Right_Layout.HorizontalAlignment = Enum.HorizontalAlignment.Right

    end
    
    Button.MouseButton1Click:Connect(function()
      
      if New_Container.Visible == false then
        
        Tween:Create(Button, TweenInfo.new(0.1), {BackgroundTransparency = 0.1}):Play()

        Button.Background_Transparency.Value = 0
        
        Current_Container = New_Container
        
        for _,Tab in pairs(Container:GetChildren()) do
          
          local New_Button = Tab:FindFirstChildWhichIsA("TextButton")

          if New_Button and New_Button ~= Button then

            Tween:Create(New_Button, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play()
            
            New_Button.Background_Transparency.Value = 1
            
          end

        end
        
        local Left_Barrier, Right_Barrier = New("Frame"), New("Frame")

        Left_Barrier.Parent = Left_Side
        Left_Barrier.BackgroundTransparency = 1
        Left_Barrier.LayoutOrder = -1

        Right_Barrier.Parent = Right_Side
        Right_Barrier.BackgroundTransparency = 1
        Right_Barrier.LayoutOrder = -1

        Ratio(Left_Barrier, 8.399)
        Ratio(Right_Barrier, 8.399)

        Tween:Create(Left_Barrier, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0.07, 0)}):Play()
        Tween:Create(Right_Barrier, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0.07, 0)}):Play()
        
        for _,Container in pairs(Background:GetChildren()) do

          if Container:IsA("ScrollingFrame") then
            
            for _,v in pairs(Container:GetDescendants()) do
              
              if v:IsA("GuiBase") then
              
                spawn(function()
                  
                  Tween:Create(v, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play()
                  
                  if v:IsA("TextButton") or v:IsA("TextLabel") then
                    
                    Tween:Create(v, TweenInfo.new(0.1), {TextTransparency = 1}):Play()
                    
                  end
                  
                  if v:IsA("ImageButton") or v:IsA("ImageLabel") then

                    Tween:Create(v, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()

                  end

                  task.wait(0.1)

                  if v:FindFirstChild("Background_Transparency") then

                    Tween:Create(v, TweenInfo.new(0.1), {BackgroundTransparency = v.Background_Transparency.Value}):Play()

                  end

                  if v:FindFirstChild("Image_Transparency") then

                    Tween:Create(v, TweenInfo.new(0.1), {ImageTransparency = v.Image_Transparency.Value}):Play()

                  end

                  if v:FindFirstChild("Text_Transparency") then

                    Tween:Create(v, TweenInfo.new(0.1), {TextTransparency = v.Text_Transparency.Value}):Play()

                  end
                  
                end)
                
              end
              
            end
            
          end
          
        end
        
        task.wait(0.1)
        
        Left_Barrier:Destroy()
        Right_Barrier:Destroy()
        
        for _,Container in pairs(Background:GetChildren()) do

          if Container:IsA("ScrollingFrame") then
            
            if Container == New_Container then
            
              Container.Visible = true
              
              for _,v in pairs(Container:GetDescendants()) do

                if v:IsA("GuiBase") then

                  if (v.Name == "Toggle" and v.BoolValue.Value == true) then

                    v.Button_Name.TextColor3 = Color3.fromRGB(182, 197, 213)
                    v.Frame.Frame.BackgroundColor3 = Color3.fromRGB(182, 197, 213)
                    v.Frame.Frame.Position = UDim2.new(0.1, 0, 0.152, 0)

                    spawn(function()

                      task.wait()

                      Tween:Create(v.Frame.Frame, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(3, 168, 235), Position = UDim2.new(0.545, 0, 0.152, 0)}):Play()
                      
                      task.wait(0.05)
                      
                      Tween:Create(v.Button_Name, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

                    end)
                      
                  elseif (v.Name == "Slider") then
                    
                    local Old_Trail_Size = v.Frame.Slider_Trail.Size
                    local Old_Circle_Position = v.Frame.Slider_Circle.Position
                    
                    v.Frame.Slider_Trail.Size = UDim2.new(0, 0, 1, 0)
                    v.Frame.Slider_Circle.Position = UDim2.new(0, 0, -1.5, 0)

                    spawn(function()

                      task.wait()

                      Tween:Create(v.Frame.Slider_Trail, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {Size = Old_Trail_Size}):Play()
                      Tween:Create(v.Frame.Slider_Circle, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {Position = Old_Circle_Position}):Play()

                    end)
                    
                  end

                  if v:FindFirstChild("Background_Transparency") then

                    Tween:Create(v, TweenInfo.new(0.25), {BackgroundTransparency = v.Background_Transparency.Value}):Play()

                  end
                  
                  if v:FindFirstChild("Image_Transparency") then

                    Tween:Create(v, TweenInfo.new(0.25), {ImageTransparency = v.Image_Transparency.Value}):Play()

                  end

                  if v:FindFirstChild("Text_Transparency") then

                    Tween:Create(v, TweenInfo.new(0.25), {TextTransparency = v.Text_Transparency.Value}):Play()

                  end

                end

              end
              
            else
              
              Container.Visible = false
              
            end

          end

        end
        
        local Left_Barrier, Right_Barrier = New("Frame"), New("Frame")
        
        Left_Barrier.Parent = Left_Side
        Left_Barrier.Size = UDim2.new(1, 0, 0.07, 0)
        Left_Barrier.BackgroundTransparency = 1
        Left_Barrier.LayoutOrder = -1
        
        Right_Barrier.Parent = Right_Side
        Right_Barrier.Size = UDim2.new(1, 0, 0.07, 0)
        Right_Barrier.BackgroundTransparency = 1
        Right_Barrier.LayoutOrder = -1
        
        Ratio(Left_Barrier, 8.399)
        Ratio(Right_Barrier, 8.399)
        
        Tween:Create(Left_Barrier, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        Tween:Create(Right_Barrier, TweenInfo.new(0.25), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        
        task.wait(0.2)
        
        Left_Barrier:Destroy()
        Right_Barrier:Destroy()
        
      end
      
    end)
    
    Give_Transparency_Value(Button)
    Give_Transparency_Value(Image)
    Give_Transparency_Value(Title)
    
    Corner(Button, 6)
    
    Ratio(Image, 1)
    
    local Sections_Count = 0
    
    local Tab_Functions = {}
    
    if Info == false then
    
      function Tab_Functions:Section(Name)
        
        Sections_Count += 1
        
        local Section, Layout, Barrier, Text, Main, Main_Layout, Space = New("Frame"), New("UIListLayout"), New("Frame"), New("TextLabel"), New("Frame"), New("UIListLayout"), New("Frame")
        
        if Sections_Count % 2 == 0 then
          
          Section.Parent = Right_Side
          
        else
          
          Section.Parent = Left_Side
          
        end
        
        Section.Size = UDim2.new(0.975, 0, 0, 0)
        Section.AutomaticSize = Enum.AutomaticSize.Y
        Section.BackgroundTransparency = 1
        
        Layout.Parent = Section
        Layout.Padding = UDim.new(0, 2)
        Layout.SortOrder = Enum.SortOrder.LayoutOrder
        Layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
        
        Barrier.Parent = Section
        Barrier.BackgroundTransparency = 1
        Barrier.Size = UDim2.new(1, 0, 1, 0)
        
        Text.Parent = Barrier
        Text.BackgroundTransparency = 1
        Text.Font = Enum.Font.Gotham
        Text.Text = Name
        Text.TextScaled = true
        Text.Position = UDim2.new(0.032, 0, 0.484, 0)
        Text.Size = UDim2.new(0.96, 0, 0.409, 0)
        Text.TextColor3 = Color3.fromRGB(255, 255, 255)
        Text.TextTransparency = 0.61
        Text.TextXAlignment = Enum.TextXAlignment.Left
        Text.LayoutOrder = 0
        
        Main.Parent = Section
        Main.Size = UDim2.new(1, 0, 0, 0)
        Main.AutomaticSize = Enum.AutomaticSize.Y
        Main.BackgroundColor3 = Color3.fromRGB(3, 13, 26)
        Main.BackgroundTransparency = 0
        
        Main_Layout.Parent = Main
        Main_Layout.Padding = UDim.new(0, 2)
        Main_Layout.SortOrder = Enum.SortOrder.LayoutOrder
        
        Space.Parent = Main
        Space.BackgroundTransparency = 1
        Space.Size = UDim2.new(1, 0, 0, 2)
        
        Give_Transparency_Value(Text)
        Give_Transparency_Value(Main)
        
        Corner(Section, 4)
        Corner(Main, 4)
        
        Ratio(Barrier, 6.979)
        
        local Button_Count = 0
        
        local Section_Functions = {}
        
        local function Add_Space()
          
          if Button_Count >= 2 then
            
            local Barrier, Space = New("Frame"), New("Frame")

            Barrier.Parent = Main
            Barrier.BackgroundTransparency = 1
            Barrier.Size = UDim2.new(1, 0, 1, 0)

            Space.Parent = Barrier
            Space.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Space.BackgroundTransparency = 0.976
            Space.BorderSizePixel = 0
            Space.Position = UDim2.new(0.1, 0, 0, 0)
            Space.Size = UDim2.new(0.8, 0, 1.134, 0)

            Give_Transparency_Value(Space)

            Ratio(Barrier, 212.637)

          end
          
        end
        
        local function External_Button_Functions(Instance)
          
          local Button_Functions = {}
          
          function Button_Functions:Visiblity(Bool)
            
            if Bool == true or Bool == false then
              
              Instance.Visible = Bool
              
            end 
            
          end
          
          function Button_Functions:Destroy()
            
            Instance:Destroy()
            
          end
          
          function Button_Functions:ReName(Name)
            
            if Instance:FindFirstChild("Button_Name") then
              
              Instance.Button_Name.Text = Name
                
            end
            
          end
          
          return Button_Functions
          
        end
        
        function Section_Functions:Button(Name, Callback)
          
          local Button, Text = New("TextButton"), New("TextLabel")
          
          Button_Count += 1
          
          Add_Space()
          
          Button.Parent = Main
          Button.Name = "Button"
          Button.Size = UDim2.new(1, 0, 2, 0)
          Button.BackgroundTransparency = 1
          Button.TextTransparency = 1
          
          Text.Parent = Button
          Text.Name = "Button_Name"
          Text.BackgroundTransparency = 1
          Text.Position = UDim2.new(0.037, 0, 0.25, 0)
          Text.Size = UDim2.new(0.948, 0, 0.4, 0)
          Text.Font = Enum.Font.Gotham
          Text.Text = Name
          Text.TextColor3 = Color3.fromRGB(182, 197, 213)
          Text.TextScaled = true
          Text.TextXAlignment = Enum.TextXAlignment.Left
          
          Give_Transparency_Value(Text)
          
          Ratio(Button, 6.515)
          Ratio(Text, 14.833)
          
          Button.MouseButton1Click:Connect(function()
            
            pcall(Callback)
            
            Tween:Create(Text, TweenInfo.new(0.01), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

            task.wait(0.07)
            
            Tween:Create(Text, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(182, 197, 213)}):Play()

          end)
          
          return External_Button_Functions(Button)
          
        end
        
        function Section_Functions:Toggle(Name, Bool, Callback)
          
          local Button, Text, Path, Circle, Bool_Value =  New("TextButton"), New("TextLabel"), New("Frame"), New("Frame"), New("BoolValue")
          
          Button_Count += 1
          
          if Bool == true then
            
            pcall(Callback, Bool)
            
            Text.TextColor3 = Color3.fromRGB(255, 255, 255)
            
            Circle.BackgroundColor3 = Color3.fromRGB(3, 168, 235)
            Circle.Position = UDim2.new(0.545, 0, 0.152, 0)
            
            Path.BackgroundColor3 = Color3.fromRGB(5, 23, 39)
            
          else
            
            Text.TextColor3 = Color3.fromRGB(182, 197, 213)
            
            Circle.BackgroundColor3 = Color3.fromRGB(182, 197, 213)
            Circle.Position = UDim2.new(0.1, 0, 0.152, 0)
            
            Path.BackgroundColor3 = Color3.fromRGB(0, 7, 19)
            
          end
          
          Add_Space()

          Button.Parent = Main
          Button.Name = "Toggle"
          Button.Size = UDim2.new(1, 0, 2, 0)
          Button.BackgroundTransparency = 1
          Button.TextTransparency = 1

          Path.Parent = Button
          Path.Position = UDim2.new(0.817, 0, 0.251, 0)
          Path.Size = UDim2.new(0.14, 0, 0.504, 0)
          
          Circle.Parent = Path
          Circle.Size = UDim2.new(0.377, 0, 0.682, 0)

          Text.Parent = Button
          Text.Name = "Button_Name"
          Text.BackgroundTransparency = 1
          Text.Position = UDim2.new(0.037, 0, 0.25, 0)
          Text.Size = UDim2.new(0.948, 0, 0.4, 0)
          Text.Font = Enum.Font.Gotham
          Text.Text = Name
          Text.TextScaled = true
          Text.TextXAlignment = Enum.TextXAlignment.Left
          
          Bool_Value.Parent = Button
          Bool_Value.Name = "BoolValue"
          Bool_Value.Value = Bool
          
          Give_Transparency_Value(Path)
          Give_Transparency_Value(Circle)
          Give_Transparency_Value(Text)
          
          Corner(Path, 100)
          Corner(Circle, 100)
          
          Ratio(Button, 6.515)
          Ratio(Text, 14.833)
          Ratio(Path, 1.807)
          Ratio(Circle, 1)
          
          Button.MouseButton1Click:Connect(function()
            
            Bool = not Bool
            
            pcall(Callback, Bool)
            
            Bool_Value.Value = Bool
            
            if Bool == true then
              
              Tween:Create(Text, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
              Tween:Create(Circle, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(3, 168, 235), Position = UDim2.new(0.545, 0, 0.152, 0)}):Play()
              Tween:Create(Path, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(5, 23, 39)}):Play()
              
            else
              
              Tween:Create(Text, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(182, 197, 213)}):Play()
              Tween:Create(Circle, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(182, 197, 213), Position = UDim2.new(0.1, 0, 0.152, 0)}):Play()
              Tween:Create(Path, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(0, 7, 19)}):Play()

            end

          end)

          return External_Button_Functions(Button)
          
        end
        
        function Section_Functions:Slider(Name, Minimum, Maximum, Start, Callback)

          local SliderFunc = External_Button_Functions()
          local SliderDescToggled = false
          local dragging = false
          local mouseX, val
          
          local Button, Text, CurrentValueFrame, SlideFrame, SlideCircle, Value = New("TextButton"), New("TextLabel"), New("Frame"), New("Frame"), New("TextButton"), New("TextBox")
          
          Button_Count += 1
          
          Add_Space()
          
          Button.Parent = Main
          Button.Name = "Slider"
          Button.BackgroundTransparency = 1
          Button.AutoButtonColor = false
          Button.TextTransparency = 1
          Button.Size = UDim2.new(1, 0, 2, 0)

          Text.Parent = Button
          Text.Name = "Button_Name"
          Text.BackgroundTransparency = 1
          Text.Position = UDim2.new(0.037, 0, 0.25, 0)
          Text.Size = UDim2.new(0.948, 0, 0.4, 0)
          Text.TextColor3 = Color3.fromRGB(182, 197, 213)
          Text.Font = Enum.Font.Gotham
          Text.Text = Name
          Text.TextScaled = true
          Text.TextXAlignment = Enum.TextXAlignment.Left
          
          SlideFrame.Parent = Button
          SlideFrame.BackgroundColor3 = Color3.fromRGB(6, 18, 34)
          SlideFrame.BorderSizePixel = 0
          SlideFrame.Position = UDim2.new(0.45, 0, 0.465, 0)
          SlideFrame.Size = UDim2.new(0.346, 0, 0.069, 0)

          CurrentValueFrame.Parent = SlideFrame
          CurrentValueFrame.Name = "Slider_Trail"
          CurrentValueFrame.BorderSizePixel = 0
          CurrentValueFrame.BackgroundColor3 = Color3.fromRGB(3, 168, 235)
          CurrentValueFrame.Size = UDim2.new(math.clamp((Start - Minimum) / (Maximum - Minimum), 0, 1), 0, 1, 0)
          
          SlideCircle.Parent = SlideFrame
          SlideCircle.Name = "Slider_Circle"
          SlideCircle.BackgroundColor3 = Color3.fromRGB(3, 168, 235)
          SlideCircle.Position = UDim2.new(math.clamp((Start - Minimum) / (Maximum - Minimum), 0, 1), 0, -1.5, 0)
          SlideCircle.Size = UDim2.new(0.123, 0, 4, 0)
          SlideCircle.TextTransparency = 1
          SlideCircle.AutoButtonColor = false

          Value.Parent = Button
          Value.BackgroundTransparency = 1
          Value.Position = UDim2.new(0.817, 0, 0.304, 0)
          Value.Size = UDim2.new(0.176, 0, 0.347, 0)
          Value.Font = Enum.Font.Gotham
          Value.Text = tostring(Start and math.floor((Start / Maximum) * (Maximum - Minimum) + Minimum) or 0)
          Value.TextColor3 = Color3.fromRGB(255, 255, 255)
          Value.Font = Enum.Font.Gotham
          Value.TextScaled = true
          Value.ClearTextOnFocus = false
          
          Give_Transparency_Value(Button)
          Give_Transparency_Value(Text)
          Give_Transparency_Value(CurrentValueFrame)
          Give_Transparency_Value(SlideFrame)
          Give_Transparency_Value(SlideCircle)
          Give_Transparency_Value(Value)
          
          Ratio(Button, 6.515)
          Ratio(Text, 14.833)
          Ratio(SlideCircle, 1)
          
          Corner(SlideCircle, 80)
          
          local function move(input, time)
            
            local pos = UDim2.new(math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1), mouseX, -1.5, 0)
            local pos1 = UDim2.new(math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1), mouseX, 1, 0)
            
            Tween:Create(CurrentValueFrame, TweenInfo.new(time), {Size = pos1}):Play()
            Tween:Create(SlideCircle, TweenInfo.new(time), {Position = pos}):Play()
            
            val = math.floor(((pos.X.Scale * Maximum) / Maximum) * (Maximum - Minimum) + Minimum)
            Value.Text = tostring(val)
            
            pcall(Callback, val)
            
          end
          
          Button.MouseEnter:Connect(function()
            
            Tween:Create(Text, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(173, 173, 173)}):Play()
            
            Tween:Create(SlideCircle, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(2, 123, 167)}):Play()
            
          end)
          
          Button.MouseLeave:Connect(function()
            
            Tween:Create(Text, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(182, 197, 213)}):Play()
            
            Tween:Create(SlideCircle, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(3, 168, 235)}):Play()
            
          end)
          
          Button.InputBegan:Connect(function(input)
            
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
              
              dragging = true
              mouseX = -4
              
              move(input, 0.04)
              
            end
            
          end)
          
          Button.InputEnded:Connect(function(input)
            
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
              
              dragging = false
              
            end
            
          end)
          
          SlideCircle.InputBegan:Connect(function(input)
            
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
              
              dragging = true
              
              mouseX = SlideCircle.AbsolutePosition.X - Player:GetMouse().X
              
            end
            
          end)
          
          SlideCircle.InputEnded:Connect(function(input)
            
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
              
              dragging = false
              
            end
            
          end)
          
          UIS.InputChanged:Connect(function(input)
            
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
              
              move(input, 0.1)
              
            end
            
          end)
          
          function SliderFunc:Change(tochange)
            
            local pos = UDim2.new(math.clamp((tochange - Minimum) / (Maximum - Minimum), 0, 1), 0, -1.5, 0)
            local pos1 = UDim2.new(math.clamp((tochange - Minimum) / (Maximum - Minimum), 0, 1), 0, 1, 0)
            
            if tochange > Maximum  then
              
              pos = UDim2.new(1, -4, -1.5, 0)
              pos1 = UDim2.new(1, -4, 1, 0)
              
            end
            
            Tween:Create(CurrentValueFrame, TweenInfo.new(0.1), {Size = pos1}):Play()
            Tween:Create(SlideCircle, TweenInfo.new(0.1), {Position = pos}):Play()

            val = tochange
            Value.Text = tostring(tochange)

            pcall(Callback, tochange)
            
          end
          
          Value.FocusLost:Connect(function(Enter)
            
            if Enter == false then return end
            
            if tonumber(Value.Text) ~= nil then
              
              SliderFunc:Change(tonumber(Value.Text))
              
            end
            
          end)
          
          return SliderFunc

        end

        function Section_Functions:TextBox(Name, Callback)
          
          
          
          return External_Button_Functions()
          
        end
        
        function Section_Functions:DropDown(Name, Childs, Toggle, Callback)
          
          
          
          return External_Button_Functions()
          
        end
      
        return Section_Functions
        
      end
      
    else
      
      Layout.FillDirection = Enum.FillDirection.Vertical
      
      function Tab_Functions:Text(Text, Color)
        
        local Label = New("TextLabel")
        
        Label.Parent = New_Container
        Label.BackgroundTransparency = 1
        Label.Size = UDim2.new(1, 0, 0.037, 0)
        Label.Font = Enum.Font.Gotham
        Label.Text = Text
        Label.TextColor3 = Color
        Label.TextScaled = true
        
        Ratio(Label, 31.4)
        Give_Transparency_Value(Label)
        
      end
      
    end
      
    return Tab_Functions
    
  end
  
  UIS.InputBegan:Connect(function(Key, IsChatting)
    
    if IsChatting then return end
    
    if Key.KeyCode == Bind then
      
      Bool.Value = not Bool.Value
      
      Gui_Is_Visible = Bool.Value
      
      for _,GUI in pairs(Screen:GetDescendants()) do
        
        if GUI:IsA("GuiBase") and GUI:FindFirstChild("Background_Transparency") then
          
          local Gui_Hide_Speed = 0.2
          
          if Bool.Value == true then
            
            Screen.Enabled = true
            
            Tween:Create(GUI, TweenInfo.new(Gui_Hide_Speed), {BackgroundTransparency = GUI.Background_Transparency.Value}):Play()

            if (GUI:IsA("TextButton") or GUI:IsA("TextLabel") or GUI:IsA("TextBox")) then
              
              Tween:Create(GUI, TweenInfo.new(Gui_Hide_Speed), {TextTransparency = GUI.Text_Transparency.Value}):Play()

            elseif (GUI:IsA("ImageButton") or GUI:IsA("ImageLabel")) then
              
              Tween:Create(GUI, TweenInfo.new(Gui_Hide_Speed), {ImageTransparency = GUI.Image_Transparency.Value}):Play()
              
            end
            
          else
            
            Tween:Create(GUI, TweenInfo.new(Gui_Hide_Speed), {BackgroundTransparency = 1}):Play()

            if (GUI:IsA("TextButton") or GUI:IsA("TextLabel") or GUI:IsA("TextBox")) then

              Tween:Create(GUI, TweenInfo.new(Gui_Hide_Speed), {TextTransparency = 1}):Play()

            elseif (GUI:IsA("ImageButton") or GUI:IsA("ImageLabel")) then

              Tween:Create(GUI, TweenInfo.new(Gui_Hide_Speed), {ImageTransparency = 1}):Play()

            end
            
            local Function
            local Hide = true
            
            Function = Bool:GetPropertyChangedSignal("Value"):Connect(function()
              Hide = false
              Function:Disconnect()
            end)
            
            task.spawn(function()

              task.wait(Gui_Hide_Speed + 0.05)

              Function:Disconnect()

              if Hide == true then

                Screen.Enabled = false

              end

            end)
            
          end
          
        end
        
      end
      
      if Bool.Value == true then
        
        for _,v in pairs(Current_Container:GetDescendants()) do

          if v:IsA("GuiBase") then

            if (v.Name == "Toggle" and v.BoolValue.Value == true) then

              v.Button_Name.TextColor3 = Color3.fromRGB(182, 197, 213)
              v.Frame.Frame.BackgroundColor3 = Color3.fromRGB(182, 197, 213)
              v.Frame.Frame.Position = UDim2.new(0.1, 0, 0.152, 0)
              v.Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

              spawn(function()

                task.wait()
                
                Tween:Create(v.Frame, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(5, 20, 39)}):Play()
                Tween:Create(v.Frame.Frame, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(3, 168, 235), Position = UDim2.new(0.545, 0, 0.152, 0)}):Play()

                task.wait(0.05)

                Tween:Create(v.Button_Name, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

              end)

            elseif (v.Name == "Slider") then

              local Old_Trail_Size = v.Frame.Slider_Trail.Size
              local Old_Circle_Position = v.Frame.Slider_Circle.Position

              v.Frame.Slider_Trail.Size = UDim2.new(0, 0, 1, 0)
              v.Frame.Slider_Circle.Position = UDim2.new(0, 0, -1.5, 0)

              spawn(function()

                task.wait()

                Tween:Create(v.Frame.Slider_Trail, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {Size = Old_Trail_Size}):Play()
                Tween:Create(v.Frame.Slider_Circle, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {Position = Old_Circle_Position}):Play()

              end)

            end

          end

        end
        
      end
      
    end
    
  end)
  
  return Window_Functions
  
end

return Library
