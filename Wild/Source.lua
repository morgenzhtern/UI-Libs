local New = Instance.new

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
local Inject_Path = game.CoreGui

local Tween = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Run = game:GetService("RunService")

local function Make_Text_Bold(Text)

  local Font_Face = Text.FontFace
  
  Font_Face.Weight = Enum.FontWeight.Bold

  Text.FontFace = Font_Face

end

local function Make_Draggable(GUI, Visible)

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

    if Input == Drag_Input and Dragging and Visible then

      local Delta = Input.Position - Drag_Start
      local Position = UDim2.new(Start_Position.X.Scale, Start_Position.X.Offset + Delta.X, Start_Position.Y.Scale, Start_Position.Y.Offset + Delta.Y)

      Tween:Create(GUI, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {Position = Position}):Play()

    end

  end)

end

local function Add_Ratio(Object, Value)

  local Ratio = New("UIAspectRatioConstraint")

  Ratio.Parent = Object
  Ratio.AspectRatio = Value

end

local function Make_Darker(Color, Value)

  local H, S, V = Color:ToHSV()

  V = math.clamp(V - Value, 0, 1)

  return Color3.fromHSV(H, S, V)

end


local Found = Inject_Path:FindFirstChild("Eternal")

if Found then

  Found:Destroy()

end


local UI = New("ScreenGui")

UI.Parent = Inject_Path
UI.DisplayOrder = 7777777
UI.IgnoreGuiInset = true
UI.Name = "Wild"
UI.ResetOnSpawn = false

local Library_Functions = {}

function Library_Functions:Window(Name, Main_Color, UI_Hide__Bind)

  local UI_Is_Visible, Current_Bind = true, nil

  UIS.InputBegan:Connect(function(Key)

    if Key.KeyCode == UI_Hide__Bind then

      UI_Is_Visible = not UI_Is_Visible

      UI.Enabled = not UI.Enabled

    end

  end)

  local Color_Change_Detector, Main, Logo_Section, Logo, Tabs, Layout, Tab_Container, Background, Container_Background, Text = New("Color3Value"), New("Frame"), New("Frame"), New("ImageLabel"), New("ScrollingFrame"), New("UIListLayout"), New("Frame"), New("Frame"), New("Frame"), New("TextLabel")
  
  Color_Change_Detector.Value = Main_Color
  
  Color_Change_Detector:GetPropertyChangedSignal("Value"):Connect(function()

    Main_Color = Color_Change_Detector.Value

  end)
  
  Main.Parent = UI
  Main.BackgroundTransparency = 1
  Main.Position = UDim2.new(0.172, 0, 0.102, 0)
  Main.Size = UDim2.new(0.649, 0, 0.792, 0)

  Logo_Section.Parent = Main
  Logo_Section.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
  Logo_Section.Size = UDim2.new(0.232, 0, 0.096, 0)
  Logo_Section.BorderSizePixel = 0

  if Name == "Eternal" then

    Logo.Parent = Logo_Section
    Logo.BackgroundTransparency = 1
    Logo.Position = UDim2.new(0.132, 0, -0.41, 0)
    Logo.Size = UDim2.new(0.729, 0, 1.82, 0)
    Logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Logo.Image = "http://www.roblox.com/asset/?id=18114735779"
    Logo.BorderSizePixel = 0

  else
    
    Text.Parent = Logo_Section
    Text.BackgroundTransparency = 1
    Text.Position = UDim2.new(0.074, 0, 0.164, 0)
    Text.Size = UDim2.new(0.841, 0, 0.655, 0)
    Text.Font = Enum.Font.Nunito
    Text.TextScaled = true
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.Text = Name
    
    Make_Text_Bold(Text)
    
  end
    
  Tabs.Parent = Main
  Tabs.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
  Tabs.Position = UDim2.new(0, 0, 0.125, 0)
  Tabs.Size = UDim2.new(0.232, 0, 0.875, 0)
  Tabs.ScrollBarImageTransparency = 1
  Tabs.CanvasSize = UDim2.new(0, 0, 0, 0)
  Tabs.AutomaticCanvasSize = Enum.AutomaticSize.Y
  Tabs.ScrollingDirection = Enum.ScrollingDirection.Y
  Tabs.BorderSizePixel = 0

  Layout.Parent = Tabs
  Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
  Layout.SortOrder = Enum.SortOrder.LayoutOrder
  Layout.VerticalAlignment = Enum.VerticalAlignment.Top

  Tab_Container.Parent = Main
  Tab_Container.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
  Tab_Container.Position = UDim2.new(0.245, 0, 0, 0)
  Tab_Container.Size = UDim2.new(0.733, 0, 1, 0)
  Tab_Container.BorderSizePixel = 0

  Container_Background.Parent = Tab_Container
  Container_Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Container_Background.BackgroundTransparency = 0.7
  Container_Background.Position = UDim2.new(1.015, 0, 0, 0)
  Container_Background.Size = UDim2.new(0.019, 0, 1, 0)
  Container_Background.BorderSizePixel = 0

  Background.Parent = Main
  Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  Background.BackgroundTransparency = 0.85
  Background.Position = UDim2.new(-0.011, 0, -0.017, 0)
  Background.Size = UDim2.new(1.026, 0, 1.033, 0)
  Background.BorderSizePixel = 0

  Make_Draggable(Main, UI_Is_Visible)

  Add_Ratio(Main, 1.37)

  local Window_Functions = {}

  function Window_Functions:Destroy()

    Main:Destroy()
    
  end
  
  function Window_Functions:ReColor(Color)
    
    Color_Change_Detector.Value = Color
    
  end

  function Window_Functions:Tab(Name, Image)

    local Button, Background, Second_Background, Icon, Text, Container, Layout = New("TextButton"), New("Frame"), New("Frame"), New("ImageLabel"), New("TextLabel"), New("ScrollingFrame"), New("UIListLayout")

    Color_Change_Detector:GetPropertyChangedSignal("Value"):Connect(function()

      Background.BackgroundColor3 = Color_Change_Detector.Value
      Second_Background.BackgroundColor3 = Make_Darker(Color_Change_Detector.Value, 0.1)
      Container.ScrollBarImageColor3 = Color_Change_Detector.Value

    end)

    if not Tabs:FindFirstChildWhichIsA("TextButton") then

      Background.Size = UDim2.new(1, 0, 1, 0)

      Second_Background.Size = UDim2.new(1, 0, 1, 0)

      Text.TextColor3 = Color3.fromRGB(0, 0, 0)

      Icon.ImageColor3 = Color3.fromRGB(0, 0, 0)

      Container.Visible = true

    else

      Background.Size = UDim2.new(0, 0, 1, 0)

      Second_Background.Size = UDim2.new(0, 0, 1, 0)

      Text.TextColor3 = Color3.fromRGB(255, 255, 255)

      Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)

      Container.Visible = false

    end

    Button.Parent = Tabs
    Button.BackgroundTransparency = 1
    Button.Size = UDim2.new(1, 0, 0.075, 0)
    Button.TextTransparency = 1

    Second_Background.Parent = Button
    Second_Background.Name = "2"
    Second_Background.BackgroundColor3 = Make_Darker(Main_Color, 0.1)
    Second_Background.BorderSizePixel = 0

    Background.Parent = Button
    Background.Name = "1"
    Background.BackgroundColor3 = Main_Color
    Background.BorderSizePixel = 0

    Icon.Parent = Button
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0.056, 0, 0.153, 0)
    Icon.Size = UDim2.new(0.152, 0, 0.732, 0)
    Icon.Image = Image

    Text.Parent = Button
    Text.BackgroundTransparency = 1
    Text.Position = UDim2.new(0.265, 0, 0.283, 0)
    Text.Size = UDim2.new(0.735, 0, 0.524, 0)
    Text.Font = Enum.Font.Nunito
    Text.Text = Name
    Text.TextScaled = true
    Text.TextXAlignment = Enum.TextXAlignment.Left

    Container.Parent = Tab_Container
    Container.BackgroundTransparency = 1
    Container.Size = UDim2.new(1.034, 0, 1, 0)
    Container.CanvasSize = UDim2.new(0, 0, 0, 0)
    Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Container.ScrollBarImageColor3 = Main_Color
    Container.ScrollBarThickness = 12
    Container.ScrollingDirection = Enum.ScrollingDirection.Y
    Container.TopImage = "http://www.roblox.com/asset/?id=18222840214"
    Container.MidImage = "http://www.roblox.com/asset/?id=18222840214"
    Container.BottomImage = "http://www.roblox.com/asset/?id=18222840214"
    Container.BorderSizePixel = 0

    Layout.Parent = Container
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.VerticalAlignment = Enum.VerticalAlignment.Top

    Button.MouseEnter:Connect(function()

      if Container.Visible == false then

        Tween:Create(Second_Background, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0.25, 0, 1, 0)}):Play()

        Tween:Create(Icon, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {ImageColor3 = Color3.fromRGB(0, 0, 0)}):Play()

      end

    end)

    Button.MouseButton1Click:Connect(function()

      for _,Tab in pairs(Tabs:GetChildren()) do

        if Tab:IsA("TextButton") then

          Tween:Create(Tab["1"], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 1, 0)}):Play()

          Tween:Create(Tab["2"], TweenInfo.new(0.3, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 1, 0)}):Play()

          Tween:Create(Tab.TextLabel, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

          Tween:Create(Tab.ImageLabel, TweenInfo.new(0.45, Enum.EasingStyle.Sine), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

        end

      end

      for _,Tab in pairs(Tab_Container:GetChildren()) do

        if Tab:IsA("ScrollingFrame") then

          Tab.Visible = false

        end

      end

      Tween:Create(Second_Background, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {Size = UDim2.new(1, 0, 1, 0)}):Play()

      Tween:Create(Background, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {Size = UDim2.new(1, 0, 1, 0)}):Play()

      Tween:Create(Icon, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {ImageColor3 = Color3.fromRGB(0, 0, 0)}):Play()

      Tween:Create(Text, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

      Container.Visible = true

    end)

    Button.MouseLeave:Connect(function()

      if Container.Visible == false then

        Tween:Create(Second_Background, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {Size = UDim2.new(0, 0, 1, 0)}):Play()

        Tween:Create(Icon, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

      end

    end)

    Make_Text_Bold(Text)

    local Tab_Functions = {}

    function Tab_Functions:Label(Name, TextXAlignment)

      local Box, Text = New("Frame"), New("TextLabel")

      Box.Parent = Container
      Box.BackgroundTransparency = 1
      Box.Size = UDim2.new(0.967, 0, 0.083, 0)

      Text.Parent = Box
      Text.BackgroundTransparency = 1
      Text.Position = UDim2.new(0.03, 0, 0.283, 0)
      Text.Size = UDim2.new(0.94, 0, 0.415, 0)
      Text.Font = Enum.Font.Nunito
      Text.Text = Name
      Text.TextColor3 = Color3.fromRGB(255, 255, 255)
      Text.TextScaled = true
      Text.TextXAlignment = TextXAlignment

      Make_Text_Bold(Text)

      local Label_Functions = {}

      function Label_Functions:Rename(Name)

        Text.Name = Name

      end

      function Label_Functions:Delete()

        Box:Destroy()

      end

      function Label_Functions:Visiblity(Value)

        Box.Visible = Value

      end

      return Label_Functions

    end

    function Tab_Functions:Button(Name, Start_Bind, Callback)

      local Mouse_On_Button, Mouse_Click_Time, Bind = false, tick(), Start_Bind or ""

      local Button, Background, Second_Background, Text, Indicator, Bind_Text = New("TextButton"), New("Frame"), New("Frame"), New("TextLabel"), New("ImageLabel"), New("TextLabel")
      
      Color_Change_Detector:GetPropertyChangedSignal("Value"):Connect(function()

        Second_Background.BackgroundColor3 = Make_Darker(Color_Change_Detector.Value, 0.1)
        Background.BackgroundColor3 = Color_Change_Detector.Value

      end)
      
      if Start_Bind ~= nil then
        
        Indicator.Visible = true
        
        Bind_Text.Text = string.sub(tostring(Start_Bind), 14)
        
      else
        
        Indicator.Visible = false
        
        Bind_Text.Text = "..."
        
      end
      
      Button.Parent = Container
      Button.BackgroundTransparency = 1
      Button.Size = UDim2.new(0.967, 0, 0.083, 0)
      Button.TextTransparency = 1

      Second_Background.Parent = Button
      Second_Background.BackgroundColor3 = Make_Darker(Main_Color, 0.1)
      Second_Background.BorderSizePixel = 0
      Second_Background.Size = UDim2.new(0, 0, 1, 0)

      Background.Parent = Button
      Background.BackgroundColor3 = Main_Color
      Background.BorderSizePixel = 0
      Background.Size = UDim2.new(0, 0, 1, 0)

      Text.Parent = Button
      Text.BackgroundTransparency = 1
      Text.Position = UDim2.new(0.03, 0, 0.283, 0)
      Text.Size = UDim2.new(0.97, 0, 0.415, 0)
      Text.Font = Enum.Font.Nunito
      Text.Text = Name
      Text.TextColor3 = Color3.fromRGB(255, 255, 255)
      Text.TextScaled = true
      Text.TextXAlignment = Enum.TextXAlignment.Left
      
      Indicator.Parent = Button
      Indicator.BackgroundTransparency = 1
      Indicator.Position = UDim2.new(0.87, 0, -0.198, 0)
      Indicator.Size = UDim2.new(0.111, 0, 1.342, 0)
      Indicator.Image = "http://www.roblox.com/asset/?id=18134722547"
      Indicator.ImageColor3 = Color3.fromRGB(62, 62, 62)

      Bind_Text.Parent = Indicator
      Bind_Text.BackgroundTransparency = 1
      Bind_Text.Position = UDim2.new(0.23, 0, 0.359, 0)
      Bind_Text.Size = UDim2.new(0.535, 0, 0.296, 0)
      Bind_Text.Font = Enum.Font.Nunito
      Bind_Text.TextScaled = true
      Bind_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
      
      Make_Text_Bold(Text)
      Make_Text_Bold(Bind_Text)
      
      local function OnPress()

        pcall(Callback)


        local Current_Tick = tick()

        Mouse_Click_Time = Current_Tick


        Tween:Create(Text, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

        Tween:Create(Second_Background, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {Size = UDim2.new(1, 0, 1, 0)}):Play()

        Tween:Create(Background, TweenInfo.new(0.1, Enum.EasingStyle.Circular), {Size = UDim2.new(1, 0, 1, 0)}):Play()


        task.wait(0.1)


        if Mouse_Click_Time ~= Current_Tick then return end

        if Mouse_On_Button then

          Tween:Create(Text, TweenInfo.new(0.5, Enum.EasingStyle.Circular), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

          Tween:Create(Second_Background, TweenInfo.new(0.6, Enum.EasingStyle.Circular), {Size = UDim2.new(0.35, 0, 1, 0)}):Play()

          Tween:Create(Background, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {Size = UDim2.new(0, 0, 1, 0)}):Play()

        else

          Tween:Create(Text, TweenInfo.new(0.5, Enum.EasingStyle.Circular), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

          Tween:Create(Background, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {Size = UDim2.new(0, 0, 1, 0)}):Play()

          Tween:Create(Second_Background, TweenInfo.new(0.35, Enum.EasingStyle.Circular), {Size = UDim2.new(0, 0, 1, 0)}):Play()

        end

      end
      
      UIS.InputBegan:Connect(function(Input, IsChatting)

        if IsChatting then return end

        if Bind ~= "" and Input.KeyCode == Bind then

          OnPress()

        end

      end)
      
      UIS.InputBegan:Connect(function(Input)
        
        if not Mouse_On_Button then return end
        
        if Input.UserInputType ~= Enum.UserInputType.MouseButton3 then return end
        
        Indicator.Visible = true
        
        Bind_Text.Text = "..."
        
        local Event
        Event = UIS.InputBegan:Connect(function(Input, IsChatting)
          
          task.wait()
          
          if IsChatting then return end
          
          if Input.KeyCode == Enum.KeyCode.Unknown then return end
          
          if Input.KeyCode == Enum.KeyCode.Backspace then
            
            if Bind ~= "" and Bind ~= nil then
            
              Bind_Text.Text = string.sub(tostring(Bind), 14)
            
            else
              
              Indicator.Visible = false
              
            end
              
          elseif Input.KeyCode == Enum.KeyCode.Delete then
            
            Bind = ""
            
            Bind_Text.Text = ""
            
            Indicator.Visible = false
            
          else
            
            Bind_Text.Text = string.sub(tostring(Input.KeyCode), 14)

            Bind = Input.KeyCode
            
          end
          
          Event:Disconnect()
          
        end)
        
      end)

      Button.MouseEnter:Connect(function()

        Mouse_On_Button = true

        Tween:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

        Tween:Create(Second_Background, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {Size = UDim2.new(0.35, 0, 1, 0)}):Play()

        Tween:Create(Background, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 1, 0)}):Play()

      end)

      Button.MouseButton1Click:Connect(function()

        OnPress()

      end)

      Button.MouseLeave:Connect(function()

        Mouse_On_Button = false

        Tween:Create(Text, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

        Tween:Create(Second_Background, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 1, 0)}):Play()

      end)

    end

    function Tab_Functions:Toggle(Name, Start_Bool, Start_Bind, Callback)

      local Mouse_On_Button, Bool, Bind = false, Start_Bool, Start_Bind

      local Button, Background, Text, Indicator, Circle, Corner, Bind_Indicator, Bind_Text = New("TextButton"), New("Frame"), New("TextLabel"), New("ImageLabel"), New("Frame"), New("UICorner"), New("ImageLabel"), New("TextLabel")
      
      Color_Change_Detector:GetPropertyChangedSignal("Value"):Connect(function()

        Background.BackgroundColor3 = Make_Darker(Color_Change_Detector.Value, 0.1)
        
        if Indicator.ImageColor3 ~= Color3.fromRGB(62, 62, 62) then
          
          Indicator.ImageColor3 = Color_Change_Detector.Value
          
        end

      end)
      
      if Start_Bool == true then

        pcall(Callback, true)

        Background.Size = UDim2.new(1, 0, 1, 0)

        Text.TextColor3 = Color3.fromRGB(0, 0, 0)
        
        Indicator.ImageColor3 = Main_Color
        
        Circle.Position = UDim2.new(0.5, 0, 0.365, 0)

      else

        Background.Size = UDim2.new(0, 0, 1, 0)

        Text.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        Indicator.ImageColor3 = Color3.fromRGB(62, 62, 62)
        
        Circle.Position = UDim2.new(0.23, 0, 0.365, 0)

      end
      
      if Start_Bind ~= nil then

        Bind_Indicator.Visible = true

        Bind_Text.Text = string.sub(tostring(Start_Bind), 14)

      else

        Bind_Indicator.Visible = false

        Bind_Text.Text = "..."

      end

      Button.Parent = Container
      Button.BackgroundTransparency = 1
      Button.Size = UDim2.new(0.967, 0, 0.083, 0)
      Button.TextTransparency = 1

      Background.Parent = Button
      Background.BackgroundColor3 = Make_Darker(Main_Color, 0.1)
      Background.BorderSizePixel = 0

      Text.Parent = Button
      Text.BackgroundTransparency = 1
      Text.Position = UDim2.new(0.03, 0, 0.283, 0)
      Text.Size = UDim2.new(0.97, 0, 0.415, 0)
      Text.Font = Enum.Font.Nunito
      Text.Text = Name
      Text.TextScaled = true
      Text.TextXAlignment = Enum.TextXAlignment.Left
      
      Indicator.Parent = Button
      Indicator.BackgroundTransparency = 1
      Indicator.Position = UDim2.new(0.87, 0, -0.198, 0)
      Indicator.Size = UDim2.new(0.111, 0, 1.342, 0)
      Indicator.Image = "http://www.roblox.com/asset/?id=18134722547"
      
      Circle.Parent = Indicator
      Circle.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
      Circle.Size = UDim2.new(0.28, 0, 0.28, 0)
      
      Corner.Parent = Circle
      Corner.CornerRadius = UDim.new(0, 999999)
      
      Bind_Indicator.Parent = Button
      Bind_Indicator.BackgroundTransparency = 1
      Bind_Indicator.Position = UDim2.new(0.759, 0, -0.198, 0)
      Bind_Indicator.Size = UDim2.new(0.111, 0, 1.342, 0)
      Bind_Indicator.Image = "http://www.roblox.com/asset/?id=18134722547"
      Bind_Indicator.ImageColor3 = Color3.fromRGB(62, 62, 62)

      Bind_Text.Parent = Bind_Indicator
      Bind_Text.BackgroundTransparency = 1
      Bind_Text.Position = UDim2.new(0.23, 0, 0.359, 0)
      Bind_Text.Size = UDim2.new(0.535, 0, 0.296, 0)
      Bind_Text.Font = Enum.Font.Nunito
      Bind_Text.TextScaled = true
      Bind_Text.TextColor3 = Color3.fromRGB(255, 255, 255)

      Make_Text_Bold(Text)
      Make_Text_Bold(Bind_Text)
      
      Add_Ratio(Indicator, 1)
      
      local function OnPress()
        
        Bool = not Bool

        pcall(Callback, Bool)

        if Bool == true then

          Tween:Create(Text, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

          Tween:Create(Background, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {Size = UDim2.new(1, 0, 1, 0)}):Play()

          Tween:Create(Indicator, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {ImageColor3 = Main_Color}):Play()

          Tween:Create(Circle, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {Position = UDim2.new(0.5, 0, 0.365, 0)}):Play()

        elseif Bool == false then

          Tween:Create(Circle, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {Position = UDim2.new(0.23, 0, 0.365, 0)}):Play()

          Tween:Create(Indicator, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {ImageColor3 = Color3.fromRGB(62, 62, 62)}):Play()

          if Mouse_On_Button then

            Tween:Create(Text, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

            Tween:Create(Background, TweenInfo.new(0.4, Enum.EasingStyle.Circular), {Size = UDim2.new(0.35, 0, 1, 0)}):Play()

          elseif not Mouse_On_Button then

            Tween:Create(Text, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

            Tween:Create(Background, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {Size = UDim2.new(0, 0, 1, 0)}):Play()

          end

        end
        
      end
      
      UIS.InputBegan:Connect(function(Input, IsChatting)

        if IsChatting then return end

        if Bind ~= "" and Input.KeyCode == Bind then

          OnPress()

        end

      end)

      UIS.InputBegan:Connect(function(Input)

        if not Mouse_On_Button then return end

        if Input.UserInputType ~= Enum.UserInputType.MouseButton3 then return end

        Bind_Indicator.Visible = true

        Bind_Text.Text = "..."

        local Event
        Event = UIS.InputBegan:Connect(function(Input, IsChatting)

          task.wait()

          if IsChatting then return end

          if Input.KeyCode == Enum.KeyCode.Unknown then return end

          if Input.KeyCode == Enum.KeyCode.Backspace then

            if Bind ~= "" and Bind ~= nil then

              Bind_Text.Text = string.sub(tostring(Bind), 14)

            else

              Bind_Indicator.Visible = false

            end

          elseif Input.KeyCode == Enum.KeyCode.Delete then

            Bind = ""

            Bind_Text.Text = ""

            Bind_Indicator.Visible = false

          else

            Bind_Text.Text = string.sub(tostring(Input.KeyCode), 14)

            Bind = Input.KeyCode

          end

          Event:Disconnect()

        end)

      end)

      Button.MouseEnter:Connect(function()

        Mouse_On_Button = true

        if Bool == false then

          Tween:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

          Tween:Create(Background, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {Size = UDim2.new(0.35, 0, 1, 0)}):Play()

        end

      end)

      Button.MouseButton1Click:Connect(function()

        OnPress()

      end)

      Button.MouseLeave:Connect(function()

        Mouse_On_Button = false

        if Bool == false then

          Tween:Create(Text, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

          Tween:Create(Background, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 1, 0)}):Play()
          
          Tween:Create(Indicator, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {ImageColor3 = Color3.fromRGB(62, 62, 62)}):Play()

        end

      end)

      Make_Text_Bold(Text)

    end
    
    function Tab_Functions:Slider(Name, Minimum, Maximum, Start, Callback)
      
      local Mouse_X, Dragging = nil, false
      
      local Button, Text, Path, Trail, Dragger, Background, Indicator, TextBox = New("TextButton"), New("TextLabel"), New("Frame"), New("Frame"), New("TextButton"), New("Frame"), New("ImageLabel"), New("TextBox")
      
      Color_Change_Detector:GetPropertyChangedSignal("Value"):Connect(function()

        Trail.BackgroundColor3 = Color_Change_Detector.Value
        Background.BackgroundColor3 = Color_Change_Detector.Value

      end)
      
      Button.Parent = Container
      Button.BackgroundTransparency = 1
      Button.Size = UDim2.new(0.967, 0, 0.083, 0)
      Button.TextTransparency = 1
      
      Text.Parent = Button
      Text.BackgroundTransparency = 1
      Text.Position = UDim2.new(0.03, 0, 0.283, 0)
      Text.Size = UDim2.new(0.97, 0, 0.415, 0)
      Text.Font = Enum.Font.Nunito
      Text.Text = Name
      Text.TextScaled = true
      Text.TextColor3 = Color3.fromRGB(255, 255, 255)
      Text.TextXAlignment = Enum.TextXAlignment.Left
      
      Path.Parent = Button
      Path.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
      Path.Position = UDim2.new(0.461, 0, 0.434, 0)
      Path.Size = UDim2.new(0.39, 0, 0.094, 0)
      Path.BorderSizePixel = 0
      
      Trail.Parent = Path
      Trail.BackgroundColor3 = Main_Color
      Trail.Size = UDim2.new(math.clamp((Start - Minimum) / (Maximum - Minimum), 0, 1), 0, 1, 0)
      Trail.BorderSizePixel = 0
      
      Dragger.Parent  = Path
      Dragger.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
      Dragger.AutoButtonColor = false
      Dragger.Rotation = 45
      Dragger.Position = UDim2.new(math.clamp((Start - Minimum) / (Maximum - Minimum), 0, 1), 0, -1.3, 0)
      Dragger.Size = UDim2.new(0.08, 0, 4, 0)
      Dragger.BorderSizePixel = 0
      Dragger.TextTransparency = 1
      
      Background.Parent = Dragger
      Background.BackgroundColor3 = Main_Color
      Background.Position = UDim2.new(0.25, 0, 0.25, 0)
      Background.Size = UDim2.new(0.5, 0, 0.5, 0)
      Background.BorderSizePixel = 0
      
      Indicator.Parent = Button
      Indicator.BackgroundTransparency = 1
      Indicator.Position = UDim2.new(0.87, 0, -0.198, 0)
      Indicator.Size = UDim2.new(0.111, 0, 1.342, 0)
      Indicator.Image = "http://www.roblox.com/asset/?id=18134722547"
      Indicator.ImageColor3 = Color3.fromRGB(62, 62, 62)
      
      TextBox.Parent = Indicator
      TextBox.BackgroundTransparency = 1
      TextBox.Position = UDim2.new(0.23, 0, 0.359, 0)
      TextBox.Size = UDim2.new(0.535, 0, 0.296, 0)
      TextBox.ClearTextOnFocus = false
      TextBox.Font = Enum.Font.Nunito
      TextBox.Text = Start
      TextBox.TextScaled = true
      TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
      
      Add_Ratio(Indicator, 1)
      
      Make_Text_Bold(Text)
      Make_Text_Bold(TextBox)
      
      local function Move(Input, Time)

        local Dragger_Position = UDim2.new(math.clamp((Input.Position.X - Path.AbsolutePosition.X) / Path.AbsoluteSize.X, 0, 1), Mouse_X, -1.3, 0)
        local Trail_Size = UDim2.new(math.clamp((Input.Position.X - Path.AbsolutePosition.X) / Path.AbsoluteSize.X, 0, 1), Mouse_X, 1, 0)

        Tween:Create(Dragger, TweenInfo.new(Time, Enum.EasingStyle.Circular), {Position = Dragger_Position}):Play()
        Tween:Create(Trail, TweenInfo.new(Time, Enum.EasingStyle.Circular), {Size = Trail_Size}):Play()

        local Value = math.floor(((Trail_Size.X.Scale * Maximum) / Maximum) * (Maximum - Minimum) + Minimum)
        
        TextBox.Text = Value

        pcall(Callback, Value)

      end

      Button.InputBegan:Connect(function(Input)

        if Input.UserInputType == Enum.UserInputType.MouseButton1 then

          Dragging = true
          Mouse_X = -Dragger.AbsoluteSize.X / 2 - 1

          Move(Input, 0.3)

        end

      end)

      Button.InputEnded:Connect(function(Input)

        if Input.UserInputType == Enum.UserInputType.MouseButton1 then

          Dragging = false

        end

      end)

      Dragger.InputBegan:Connect(function(Input)

        if Input.UserInputType == Enum.UserInputType.MouseButton1 then

          Dragging = true

          Mouse_X = Dragger.AbsolutePosition.X - Player:GetMouse().X

        end

      end)

      Dragger.InputEnded:Connect(function(Input)

        if Input.UserInputType == Enum.UserInputType.MouseButton1 then

          Dragging = false

        end

      end)

      UIS.InputChanged:Connect(function(Input)

        if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then

          Move(Input, 0.25)

        end

      end)
      
      local Slider_Functions = {}
      
      function Slider_Functions:Change(ToChange)

        local Dragger_Position = UDim2.new(math.clamp((ToChange - Minimum) / (Maximum - Minimum), 0, 1), 0, -1.3, 0)
        local Trail_Size = UDim2.new(math.clamp((ToChange - Minimum) / (Maximum - Minimum), 0, 1), 0, 1, 0)

        if ToChange > Maximum  then
          
          Dragger_Position = UDim2.new(1, -4, 1, 0)
          Trail_Size = UDim2.new(1, -4, -1.3, 0)

        end
        
        Tween:Create(Dragger, TweenInfo.new(0.25, Enum.EasingStyle.Circular), {Position = Dragger_Position}):Play()
        Tween:Create(Trail, TweenInfo.new(0.25, Enum.EasingStyle.Circular), {Size = Trail_Size}):Play()

        local Value = ToChange
        
        TextBox.Text = ToChange

        pcall(Callback, ToChange)

      end

      TextBox.FocusLost:Connect(function(Enter)

        if Enter == false then return end

        if tonumber(TextBox.Text) ~= nil then

          Slider_Functions:Change(tonumber(TextBox.Text))

        end

      end)
      
      return Slider_Functions
      
    end
    
    function Tab_Functions:TextBox(Name, Start_Text, Callback)
      
      local Button, Text, TextBox = New("TextButton"), New("TextLabel"), New("TextBox")

      Button.Parent = Container
      Button.BackgroundTransparency = 1
      Button.Size = UDim2.new(0.967, 0, 0.083, 0)
      Button.TextTransparency = 1

      Text.Parent = Button
      Text.BackgroundTransparency = 1
      Text.Position = UDim2.new(0.03, 0, 0.283, 0)
      Text.Size = UDim2.new(0.97, 0, 0.415, 0)
      Text.Font = Enum.Font.Nunito
      Text.Text = Name
      Text.TextColor3 = Color3.fromRGB(255, 255, 255)
      Text.TextScaled = true
      Text.TextXAlignment = Enum.TextXAlignment.Left

      TextBox.Parent = Button
      TextBox.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
      TextBox.Position = UDim2.new(0.461, 0, 0.283, 0)
      TextBox.Size = UDim2.new(0.507, 0, 0.398, 0)
      TextBox.Font = Enum.Font.Nunito
      TextBox.TextScaled = true
      TextBox.Text = Start_Text
      TextBox.ClearTextOnFocus = false
      TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextBox.TextXAlignment = Enum.TextXAlignment.Center
      TextBox.BorderSizePixel = 0
      
      Make_Text_Bold(Text)
      Make_Text_Bold(TextBox)
      
      TextBox.FocusLost:Connect(function(EnterPressed)
        
        if not EnterPressed then return end
        
        pcall(Callback, TextBox.Text)
        
      end)
      
    end
    
    function Tab_Functions:DropDown(Name, Start_Options, Toggle, Callback)
      
      local Bool, Button_Press__Time, Options, Functions_To_Disconnect = false, tick(), Start_Options, {}
      
      local Button, Text, Open, DropDown_Container, Layout = New("TextButton"), New("TextLabel"), New("ImageButton"), New("ScrollingFrame"), New("UIListLayout")
      
      Button.Parent = Container
      Button.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
      Button.Size = UDim2.new(0.967, 0, 0.083, 0)
      Button.TextTransparency = 1
      Button.AutoButtonColor = false
      Button.BorderSizePixel = 0

      Text.Parent = Button
      Text.BackgroundTransparency = 1
      Text.Position = UDim2.new(0.03, 0, 0.283, 0)
      Text.Size = UDim2.new(0.97, 0, 0.415, 0)
      Text.Font = Enum.Font.Nunito
      Text.Text = Name
      Text.TextColor3 = Color3.fromRGB(255, 255, 255)
      Text.TextScaled = true
      Text.TextXAlignment = Enum.TextXAlignment.Left
      
      Open.Parent = Button
      Open.BackgroundTransparency = 1
      Open.Position = UDim2.new(0.927, 0, 0.3, 0)
      Open.Size = UDim2.new(0.03, 0, 0.36, 0)
      Open.Image = "rbxassetid://11419703997"
      
      DropDown_Container.Parent = Container
      DropDown_Container.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
      DropDown_Container.Size = UDim2.new(0.967, 0, 0, 0)
      DropDown_Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
      DropDown_Container.CanvasSize = UDim2.new(0, 0, 0, 0)
      DropDown_Container.ScrollBarImageTransparency = 1
      DropDown_Container.BorderSizePixel = 0
      DropDown_Container.ScrollBarThickness = 0
      
      Layout.Parent = DropDown_Container
      
      Make_Text_Bold(Text)

      if Toggle then

        for _,Option in ipairs(Options) do

          pcall(Callback, {Option[1], Option[2]})

        end

      end
        
      Button.MouseButton1Click:Connect(function()
        
        Bool = not Bool
        
        if Bool == true then
          
          Button_Press__Time = tick()
          
          local Option_Selected = false
          
          for _,Option in pairs(DropDown_Container:GetChildren()) do

            if not Option:IsA("UIListLayout") then

              Option:Destroy()

            end

          end
          
          for Count,Option in ipairs(Options) do
            
            if Toggle == true then
              
              local Start_Bool, Name, Bool_2, Mouse_On_Button, Function = Option[2], Option[1], Option[2], false, nil
            
              local Button, Option_Background, Text, Indicator, Circle, Corner = New("TextButton"), New("Frame"), New("TextLabel"), New("ImageLabel"), New("Frame"), New("UICorner")
              
              Function = Color_Change_Detector:GetPropertyChangedSignal("Value"):Connect(function()

                if Indicator.ImageColor3 ~= Color3.fromRGB(62, 62, 62) then
                  
                  Indicator.ImageColor3 = Color_Change_Detector.Value
                  
                end
                
                Option_Background.BackgroundColor3 = Make_Darker(Color_Change_Detector.Value, 0.1)
                
              end)
              
              table.insert(Functions_To_Disconnect, Function)
              
              if Start_Bool == true then

                Option_Background.Size = UDim2.new(1, 0, 1, 0)

                Text.TextColor3 = Color3.fromRGB(0, 0, 0)

                Indicator.ImageColor3 = Main_Color

                Circle.Position = UDim2.new(0.5, 0, 0.365, 0)

              else

                Option_Background.Size = UDim2.new(0, 0, 1, 0)

                Text.TextColor3 = Color3.fromRGB(255, 255, 255)

                Indicator.ImageColor3 = Color3.fromRGB(62, 62, 62)

                Circle.Position = UDim2.new(0.23, 0, 0.365, 0)

              end

              Button.Parent = DropDown_Container
              Button.BackgroundTransparency = 1
              Button.Size = UDim2.new(1, 0, 10, 0)
              Button.TextTransparency = 1

              Option_Background.Parent = Button
              Option_Background.BackgroundColor3 = Make_Darker(Main_Color, 0.1)
              Option_Background.BorderSizePixel = 0

              Text.Parent = Button
              Text.BackgroundTransparency = 1
              Text.Position = UDim2.new(0.03, 0, 0.283, 0)
              Text.Size = UDim2.new(0.97, 0, 0.415, 0)
              Text.Font = Enum.Font.Nunito
              Text.Text = Name
              Text.TextColor3 = Color3.fromRGB(255, 255, 255)
              Text.TextScaled = true
              Text.TextXAlignment = Enum.TextXAlignment.Left

              Indicator.Parent = Button
              Indicator.BackgroundTransparency = 1
              Indicator.Position = UDim2.new(0.87, 0, -0.16, 0)
              Indicator.Size = UDim2.new(0.089, 0, 1.333, 0)
              Indicator.Image = "http://www.roblox.com/asset/?id=18134722547"
              Indicator.ZIndex = 2

              Circle.Parent = Indicator
              Circle.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
              Circle.Size = UDim2.new(0.28, 0, 0.28, 0)
              Circle.ZIndex = 3
              
              Corner.Parent = Circle
              Corner.CornerRadius = UDim.new(0, 999999)

              Make_Text_Bold(Text)

              Add_Ratio(Button, 14.942)

              Button.MouseEnter:Connect(function()

                Mouse_On_Button = true

                if Bool_2 == false then

                  Tween:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

                  Tween:Create(Option_Background, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {Size = UDim2.new(0.35, 0, 1, 0)}):Play()

                end

              end)

              Button.MouseButton1Click:Connect(function()

                Bool_2 = not Bool_2

                pcall(Callback, {Name, Bool_2})
                
                Options[Count][2] = Bool_2

                if Bool_2 == true then

                  Tween:Create(Text, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

                  Tween:Create(Option_Background, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {Size = UDim2.new(1, 0, 1, 0)}):Play()

                  Tween:Create(Indicator, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {ImageColor3 = Main_Color}):Play()

                  Tween:Create(Circle, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {Position = UDim2.new(0.5, 0, 0.365, 0)}):Play()

                elseif Bool_2 == false then

                  Tween:Create(Circle, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {Position = UDim2.new(0.23, 0, 0.365, 0)}):Play()

                  Tween:Create(Indicator, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {ImageColor3 = Color3.fromRGB(62, 62, 62)}):Play()

                  if Mouse_On_Button then

                    Tween:Create(Text, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

                    Tween:Create(Option_Background, TweenInfo.new(0.4, Enum.EasingStyle.Circular), {Size = UDim2.new(0.35, 0, 1, 0)}):Play()

                  elseif not Mouse_On_Button then

                    Tween:Create(Text, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

                    Tween:Create(Option_Background, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {Size = UDim2.new(0, 0, 1, 0)}):Play()

                  end

                end

              end)

              Button.MouseLeave:Connect(function()

                Mouse_On_Button = false

                if Bool_2 == false then

                  Tween:Create(Text, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

                  Tween:Create(Option_Background, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 1, 0)}):Play()

                  Tween:Create(Indicator, TweenInfo.new(0.15, Enum.EasingStyle.Circular), {ImageColor3 = Color3.fromRGB(62, 62, 62)}):Play()

                end

              end)
              
            else
              
              local Function
              
              local Button, Text, Option_Background = New("TextButton"), New("TextLabel"), New("Frame")
              
              Function = Color_Change_Detector:GetPropertyChangedSignal("Value"):Connect(function()

                Option_Background.BackgroundColor3 = Make_Darker(Color_Change_Detector.Value, 0.1)

              end)
              
              table.insert(Functions_To_Disconnect, Function)
              
              Button.Parent = DropDown_Container
              Button.BackgroundTransparency = 1
              Button.Size = UDim2.new(1, 0, 10, 0)
              Button.TextTransparency = 1

              Option_Background.Parent = Button
              Option_Background.BackgroundColor3 = Main_Color
              Option_Background.BorderSizePixel = 0
              Option_Background.Size = UDim2.new(0, 0, 1, 0)

              Text.Parent = Button
              Text.BackgroundTransparency = 1
              Text.Position = UDim2.new(0.03, 0, 0.283, 0)
              Text.Size = UDim2.new(0.97, 0, 0.415, 0)
              Text.Font = Enum.Font.Nunito
              Text.Text = Option
              Text.TextColor3 = Color3.fromRGB(255, 255, 255)
              Text.TextScaled = true
              Text.TextXAlignment = Enum.TextXAlignment.Left

              Make_Text_Bold(Text)

              Add_Ratio(Button, 14.942)

              Button.MouseEnter:Connect(function()

                if Option_Selected == true then return end

                Tween:Create(Text, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()

                Tween:Create(Option_Background, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {Size = UDim2.new(1, 0, 1, 0)}):Play()

              end)

              Button.MouseButton1Click:Connect(function()

                if Option_Selected == true then return end

                Option_Selected = true

                Bool = false

                local Current_Tick = tick()

                Button_Press__Time = Current_Tick

                pcall(Callback, Option)

                Tween:Create(Open, TweenInfo.new(0.2, Enum.EasingStyle.Circular), {Rotation = 0}):Play()

                Tween:Create(DropDown_Container, TweenInfo.new(0.2, Enum.EasingStyle.Circular), {Size = UDim2.new(0.967, 0, 0, 0)}):Play()

                task.wait(0.30)

                if Button_Press__Time == Current_Tick then

                  for _,Option in pairs(DropDown_Container:GetChildren()) do

                    if not Option:IsA("UIListLayout") then

                      Option:Destroy()

                    end

                  end

                end

              end)

              Button.MouseLeave:Connect(function()

                if Option_Selected == true then return end

                Tween:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()

                Tween:Create(Option_Background, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 1, 0)}):Play()

              end)
              
            end
            
          end

          Tween:Create(Open, TweenInfo.new(0.2, Enum.EasingStyle.Circular), {Rotation = 90}):Play()

          Tween:Create(DropDown_Container, TweenInfo.new(0.3, Enum.EasingStyle.Circular), {Size = UDim2.new(0.967, 0, 0.336, 0)}):Play()
          
        else
          
          local Current_Tick = tick()

          Button_Press__Time = Current_Tick

          Tween:Create(Open, TweenInfo.new(0.2, Enum.EasingStyle.Circular), {Rotation = 0}):Play()

          Tween:Create(DropDown_Container, TweenInfo.new(0.2, Enum.EasingStyle.Circular), {Size = UDim2.new(0.967, 0, 0, 0)}):Play()
          
          task.wait(0.3)
          
          if Button_Press__Time == Current_Tick then
            
            for Count,Function in pairs(Functions_To_Disconnect) do
              
              if Function ~= nil then
                
                Function:Disconnect()
                
                table.remove(Functions_To_Disconnect, Count)
                
              end
              
            end
            
            for _,Option in pairs(DropDown_Container:GetChildren()) do

              if not Option:IsA("UIListLayout") then

                Option:Destroy()

              end

            end

          end
          
        end
        
      end)
      
    end
    
    return Tab_Functions

  end

  return Window_Functions

end

return Library_Functions
