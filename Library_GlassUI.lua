--[[
	
					            .         
					 _ ._. _  _ | _  _   .
					(_)[  (/,(_)|(_)(_]\_|
					                ._|._|

					Glass UI Library
					Version 1.3
					
					
	Changelog :
	
	0.1		//	Started Project.
	
	0.2		// 	CreateFrame() function
	
	0.3		//	Create_MenuBar() function
	
	0.4		//	Create_ScrollList() function
				Create_ScrollList_Image() function
				Added MenuBar width option
				
	0.5		//	Create_TextButton() function
				Create_Notification() function
				
	0.6		//	Reworked notification system
				Create_Overflow_Menu() function
	
	0.7		//	Create_Indicator_Bar() function
	
	0.8		//	Create_DynamicList() function
	
	0.9		//	Create_Slider() function	[x]
				Added new animation option for Dynamic List
	

--]]

local UserInputService = game:GetService("UserInputService")
local FunctionTable = {}

function FunctionTable.Create_MenuBar(Object_Name, Object_Directory, Menu_Width, Item_Table, Item_Button_Directory, Return_Object)
	local FrameContainer = Instance.new("Frame", Object_Directory)
	FrameContainer.Name = tostring(Object_Name)
	FrameContainer.Size = UDim2.new(tonumber(Menu_Width),0,1,0)
	FrameContainer.Position = UDim2.new(0,0,0,0)
	FrameContainer.BackgroundColor3 = Color3.new(0,0,0)
	FrameContainer.BackgroundTransparency = 0.8
	FrameContainer.BorderSizePixel = 0
	FrameContainer.ZIndex = 9
	
	local D1 = Instance.new("Frame", FrameContainer)		-- Right Bar
	D1.Size = UDim2.new(0,2,1,0)
	D1.Position = UDim2.new(1,-5,0,0)
	D1.BackgroundColor3 = Color3.new(1,1,1)
	D1.BackgroundTransparency = 0.5
	D1.BorderSizePixel = 0
	D1.Name = "DecorBar_Rht"
	D1.ZIndex = 9
	
	local VisualFrame = Instance.new("Frame", FrameContainer)
	VisualFrame.BackgroundTransparency = 2
	VisualFrame.BorderSizePixel = 0
	VisualFrame.Position = UDim2.new(0,0,0,0)
	VisualFrame.Size = UDim2.new(1,0,1,0)
	VisualFrame.ZIndex = 9
	
	local CenterFrame = Instance.new("Frame", VisualFrame)
	CenterFrame.BackgroundColor3 = Color3.new(0,0,0)
	CenterFrame.BorderSizePixel = 0
	CenterFrame.BackgroundTransparency = 0.6
	CenterFrame.Position = UDim2.new(0,0,0.45,0)
	CenterFrame.Size = UDim2.new(1,0,0.1,0)
	CenterFrame.ZIndex = 9
	
	local TextContainer = Instance.new("Frame", VisualFrame)
	TextContainer.BackgroundTransparency = 2
	TextContainer.BorderSizePixel = 0
	TextContainer.Size = UDim2.new(1,0,1,0)
	TextContainer.Position = UDim2.new(0,0,0,0)
	TextContainer.ZIndex = 9
	
	local NumberItems = #Item_Table
	local Difference = (1/NumberItems)
	local TextPos = 0.45
	local TextPosDifference = 0.1
	local ButtonPos = 0
	for x = 1, NumberItems do
		--[[ Create Visual Representation ]]
		local NewText = Instance.new("TextLabel", TextContainer)
		NewText.BackgroundTransparency = 2
		NewText.BorderSizePixel = 0
		NewText.Name = tostring(Item_Table[x][2])
		NewText.TextColor3 = Color3.new(1,1,1)
		NewText.Position = UDim2.new(0,0,TextPos,0)
		NewText.Size = UDim2.new(1,0,0.1,0)
		NewText.ZIndex = 9
		NewText.Font = "SourceSans"
		NewText.FontSize = "Size18"
		NewText.Text = tostring(Item_Table[x][2])
		local NumberTag = Instance.new("NumberValue", NewText)
		NumberTag.Name = "ItemNumber"
		NumberTag.Value = x
		TextPos = TextPos + TextPosDifference
		local NewButton = Instance.new("ImageButton", FrameContainer)
		NewButton.Name = tostring(Item_Table[x][2])
		NewButton.BackgroundTransparency = 2
		NewButton.BorderSizePixel = 0
		NewButton.Position = UDim2.new(0,0,ButtonPos,0)
		NewButton.Size = UDim2.new(1,0,Difference,0)
		NewButton.ZIndex = 9
		ButtonPos = ButtonPos + Difference
		NewButton.MouseEnter:Connect(function()
			local VisText = TextContainer[NewButton.Name]
			if (not VisText) then return end
			TextContainer:TweenPosition(UDim2.new(0,0,(-(VisText["ItemNumber"].Value/10)+0.1),0),"Out","Quad",0.25,true)
			VisText.FontSize = "Size36"
			wait(0)
		end)
		NewButton.MouseLeave:Connect(function()
			TextContainer[NewButton.Name].FontSize = "Size14"
			wait(0)
		end)
		local Button_CodeConnection = Item_Button_Directory[Item_Table[x][1]]:Clone()
		Button_CodeConnection.Parent = NewButton
		Button_CodeConnection.Disabled = false
	end
	if (Return_Object) then
		return FrameContainer
	end
end

function FunctionTable.Create_Frame(Object_Name, Object_Directory, Object_Size, Object_Position, Object_ZIndex, Contain, Return_Object)
	local NewFrame = Instance.new("Frame", Object_Directory)
	NewFrame.Size = Object_Size
	NewFrame.Position = Object_Position
	NewFrame.BackgroundColor3 = Color3.new(0,0,0)
	NewFrame.BackgroundTransparency = 0.8
	NewFrame.BorderSizePixel = 0
	NewFrame.Name = tostring(Object_Name)
	NewFrame.ZIndex = tonumber(Object_ZIndex)
	NewFrame.ClipsDescendants = Contain
	
	local D1 = Instance.new("Frame", NewFrame)		-- Top Bar
	D1.Size = UDim2.new(1,0,0,2)
	D1.Position = UDim2.new(0,0,0,3)
	D1.BackgroundColor3 = Color3.new(1,1,1)
	D1.BackgroundTransparency = 0.5
	D1.BorderSizePixel = 0
	D1.Name = "DecorBar_Top"
	D1.ZIndex = Object_ZIndex
	
	local D2 = Instance.new("Frame", NewFrame)		-- Bottom Bar
	D2.Size = UDim2.new(1,0,0,2)
	D2.Position = UDim2.new(0,0,1,-5)
	D2.BackgroundColor3 = Color3.new(1,1,1)
	D2.BackgroundTransparency = 0.5
	D2.BorderSizePixel = 0
	D2.Name = "DecorBar_Bot"
	D2.ZIndex = Object_ZIndex
	
	local D3 = Instance.new("Frame", NewFrame)		-- Right Bar
	D3.Size = UDim2.new(0,2,1,0)
	D3.Position = UDim2.new(1,-5,0,0)
	D3.BackgroundColor3 = Color3.new(1,1,1)
	D3.BackgroundTransparency = 0.5
	D3.BorderSizePixel = 0
	D3.Name = "DecorBar_Rht"
	D3.ZIndex = Object_ZIndex
	
	local D4 = Instance.new("Frame", NewFrame)		-- Left Bar
	D4.Size = UDim2.new(0,2,1,0)
	D4.Position = UDim2.new(0,3,0,0)
	D4.BackgroundColor3 = Color3.new(1,1,1)
	D4.BackgroundTransparency = 0.5
	D4.BorderSizePixel = 0
	D4.Name = "DecorBar_Lft"
	D4.ZIndex = Object_ZIndex
	
	if (Return_Object) then
		return NewFrame
	end
end

function FunctionTable.Create_TextButton(Object_Name, Button_Text, Object_Directory, Object_Size, Object_Position, Object_ZIndex)
	local Button = Instance.new("TextButton", Object_Directory)
	Button.Name = tostring(Object_Name)
	Button.Size = Object_Size
	Button.Position = Object_Position
	Button.ZIndex = Object_ZIndex
	Button.BackgroundTransparency = 1
	Button.BorderSizePixel = 0
	Button.BackgroundColor3 = Color3.new(0,0,0)
	Button.Text = tostring(Button_Text)
	Button.FontSize = "Size24"
		if (not Button.TextFits) then
		Button.TextScaled = true
		else 
		Button.TextScaled = false
		end
	Button.TextXAlignment = "Center"
	Button.TextYAlignment = "Center"
	Button.TextColor3 = Color3.new(1,1,1)
	Button.Font = "SourceSans"
	local Ylight = Instance.new("Frame", Button)
	Ylight.BorderSizePixel = 0
	Ylight.Size = UDim2.new(0,0,0,0)
	Ylight.Position = UDim2.new(0,-2,0.5,0)
	Ylight.BackgroundTransparency = 0.4
	Ylight.BackgroundColor3 = Color3.new(1,1,1)
	Ylight.ZIndex = Object_ZIndex
	local Highlight = Instance.new("Frame", Button)
	Highlight.BorderSizePixel = 0
	Highlight.Position = UDim2.new(0.5,0,0.5,0)
	Highlight.Size = UDim2.new(1,0,0,0)
	Highlight.BackgroundTransparency = 0.8
	Highlight.BackgroundColor3 = Color3.new(0,0,0)
	Highlight.ZIndex = Object_ZIndex
	Button.MouseEnter:Connect(function()
		Ylight:TweenSizeAndPosition(UDim2.new(0,2,1,0), UDim2.new(0,-2,0,0), "Out", "Quad", 0.2, true)
		Highlight:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), "Out", "Quad", 0.2, true)
	end)
	Button.MouseLeave:Connect(function()
		Ylight:TweenSizeAndPosition(UDim2.new(0,0,0,0), UDim2.new(0,-2,0.5,0), "Out", "Quad", 0.2, true)
		Highlight:TweenSizeAndPosition(UDim2.new(1,0,0,0), UDim2.new(0,0,0.5,0), "Out", "Quad", 0.2, true)
	end)
	return Button
end

function FunctionTable.Create_OverflowMenu_TextButton(Object_Name, Object_Directory, Object_Size, Object_Position, Object_ZIndex, MenuOptions, ExpandSize)
	local Button = FunctionTable["Create_TextButton"](tostring(Object_Name), tostring(MenuOptions[1][2]), Object_Directory, Object_Size, Object_Position, Object_ZIndex)
	local ButtonValue = Instance.new("StringValue", Button)
	ButtonValue.Name = "Value"
	Button.MouseButton1Click:Connect(function()
		local ScrollSize = UDim2.new(Object_Size.X.Scale, Object_Size.X.Offset, Object_Size.Y.Scale, Object_Size.Y.Offset+ExpandSize)
		local ScrollPosition = UDim2.new(Object_Position.X.Scale, Object_Position.X.Offset, Object_Position.Y.Scale, Object_Position.Y.Offset-(ExpandSize/2))
		Button:TweenSizeAndPosition(ScrollSize, ScrollPosition, "Out", "Quad", 0.25, true)		
		Button.Text = ""		
		local ScrollList = FunctionTable["Create_ScrollList_Text"](tostring(Object_Name), Object_Directory, ScrollSize, ScrollPosition, false, MenuOptions, Object_ZIndex+1, nil, true, true)
		local Items = ScrollList:GetChildren()
		for x = 1, #Items do
			local Item = Items[x]
			if (Item:IsA("ImageButton")) then
				Item.MouseButton1Click:Connect(function()
					ButtonValue.Value = tostring(Item.Parent.Frame.Frame[Item.Name].Text)
					Button.Text = ButtonValue.Value
					Button:TweenSizeAndPosition(Object_Size, Object_Position, "Out", "Quad", 0.25, true)
					ScrollList:Destroy()
				end)
			end
		end
	end)
	return Button, ButtonValue
end

function FunctionTable.Create_LoadBar_Continuous(Object_Name, Object_Directory, Object_Size, Object_Position, Object_ZIndex, Delay, FadeIn, Speed)
	local Container = Instance.new("Frame", Object_Directory)
	Container.Name = tostring(Object_Name)
	Container.Size = Object_Size
	Container.Position = Object_Position
	Container.BackgroundColor3 = Color3.new(1,1,1)
	Container.BorderSizePixel = 0
	Container.ZIndex = tonumber(Object_ZIndex)
	Container.Visible = false
	Container.ClipsDescendants = true
	local B1 = Instance.new("Frame", Container)
	B1.BackgroundColor3 = Color3.new(1,1,1)
	B1.Visible = false
	B1.Size = UDim2.new(0,50,1,0)
	B1.Position = UDim2.new(0,-50,0,0)
	B1.BorderSizePixel = 0
	B1.ZIndex = Object_ZIndex
	local B2 = Instance.new("Frame", Container)
	B2.BackgroundColor3 = Color3.new(1,1,1)
	B2.Visible = false
	B2.Size = UDim2.new(0,50,1,0)
	B2.Position = UDim2.new(0,-50,0,0)
	B2.BorderSizePixel = 0
	B2.ZIndex = tonumber(Object_ZIndex)
	local B3 = Instance.new("Frame", Container)
	B3.BackgroundColor3 = Color3.new(1,1,1)
	B3.Visible = false
	B3.Size = UDim2.new(0,50,1,0)
	B3.Position = UDim2.new(0,-50,0,0)
	B3.BorderSizePixel = 0
	B3.ZIndex = tonumber(Object_ZIndex)
	local B4 = Instance.new("Frame", Container)
	B4.BackgroundColor3 = Color3.new(1,1,1)
	B4.Visible = false
	B4.Size = UDim2.new(0,50,1,0)
	B4.Position = UDim2.new(0,-50,0,0)
	B4.BorderSizePixel = 0
	B4.ZIndex = tonumber(Object_ZIndex)
	Spawn(function()
		while wait(Speed/2) do
			B1.Position = UDim2.new(0,-50,0,0)
			B2.Position = UDim2.new(0,-50,0,0)
			B3.Position = UDim2.new(0,-50,0,0)
			B4.Position = UDim2.new(0,-50,0,0)
			wait(0)
			B1:TweenPosition(UDim2.new(1,0,0,0), "InOut", "Quint", (Speed/2), true)
			wait(Speed/12)
			B2:TweenPosition(UDim2.new(1,0,0,0), "InOut", "Quint", (Speed/2), true) 
			wait(Speed/12)
			B3:TweenPosition(UDim2.new(1,0,0,0), "InOut", "Quint", (Speed/2), true)
			wait(Speed/12)
			B4:TweenPosition(UDim2.new(1,0,0,0), "InOut", "Quint", (Speed/2), true) 
			wait(Speed/12)
		end
	end)
	if FadeIn then
		Container.BackgroundTransparency = 1
		B1.BackgroundTransparency = 1
		B2.BackgroundTransparency = 1
		B3.BackgroundTransparency = 1
		B4.BackgroundTransparency = 1
		Container.Visible = true
		B1.Visible = true
		B2.Visible = true
		B3.Visible = true
		B4.Visible = true
		for x = 1, 5 do
			B1.BackgroundTransparency = B1.BackgroundTransparency - 0.08
			B2.BackgroundTransparency = B2.BackgroundTransparency - 0.08
			B3.BackgroundTransparency = B3.BackgroundTransparency - 0.08
			B4.BackgroundTransparency = B4.BackgroundTransparency - 0.08
			Container.BackgroundTransparency = Container.BackgroundTransparency - 0.025
			wait(1/30)
		end
		wait(Delay-Delay/4)
		for x = 1, 5 do
			B1.BackgroundTransparency = B1.BackgroundTransparency + 0.08
			B2.BackgroundTransparency = B2.BackgroundTransparency + 0.08
			B3.BackgroundTransparency = B3.BackgroundTransparency + 0.08
			B4.BackgroundTransparency = B4.BackgroundTransparency + 0.08
			Container.BackgroundTransparency = Container.BackgroundTransparency + 0.025
			wait(1/30)
		end
		wait(0)
		Container:Destroy()
	elseif (not FadeIn) then
		Container.BackgroundTransparency = 0.8
		B1.BackgroundTransparency = 0.6
		B2.BackgroundTransparency = 0.6
		B3.BackgroundTransparency = 0.6
		B4.BackgroundTransparency = 0.6
		Container.Visible = true
		B1.Visible = true
		B2.Visible = true
		B3.Visible = true
		B4.Visible = true
		wait(Delay)
		Container:Destroy()
	end
end

function FunctionTable.Create_LoadBar_Fixed(Object_Name, Object_Directory, Object_Size, Object_Position, Delay, FadeIn, LoadPercent)
	
end

function FunctionTable.Create_LoadCircle(Object_Name, Object_Directory, Object_Size, Object_Position, Delay, FadeIn)
	
end

function FunctionTable.Create_Slider(Object_Name, Object_Directory, Object_Size, Object_Position, Object_ZIndex, Create_Container, Maximum, Minimum, Steps, Value)
	if (Create_Container) then
		repeat wait() until FunctionTable.Create_Frame
		local Container = FunctionTable.Create_Frame(Object_Name, Object_Directory, Object_Size, Object_Position, Object_ZIndex, true, true)
		local Line = Instance.new("Frame", Container)
		Line.BorderSizePixel = 0
		Line.ZIndex = Object_ZIndex
		Line.BackgroundTransparency = 0.4
		Line.BackgroundColor3 = Color3.new(1,1,1)
		Line.Size = UDim2.new(1,-20,0,2)
		Line.Position = UDim2.new(0,10,0.5,-1)
		local MinStep = Instance.new("Frame", Line)
		MinStep.Position = UDim2.new(0,0,-1,0)
		MinStep.Size = UDim2.new(0,2,2,0)
		MinStep.BorderSizePixel = 0
		MinStep.BackgroundTransparency = 0.2
		MinStep.BackgroundColor3 = Color3.new(1,1,1)
		MinStep.ZIndex = Object_ZIndex
		local MaxStep = Instance.new("Frame", Line)
		MaxStep.Position = UDim2.new(1,-2,-1,0)
		MaxStep.Size = UDim2.new(0,2,2,0)
		MaxStep.BorderSizePixel = 0
		MaxStep.BackgroundTransparency = 0.2
		MaxStep.BackgroundColor3 = Color3.new(1,1,1)
		MaxStep.ZIndex = Object_ZIndex
		local StepValues = {}
		table.insert(StepValues, Minimum)
		for x = 1, Steps do
			local Positions = (1/(Steps+1))
			local StepFrame = Instance.new("Frame", Line)				
			StepFrame.Position = UDim2.new((Positions*x),-1,-1.5,0)
			StepFrame.Size = UDim2.new(0,2,3,0)
			StepFrame.BorderSizePixel = 0
			StepFrame.BackgroundTransparency = 0.2
			StepFrame.BackgroundColor3 = Color3.new(1,1,1)
			StepFrame.ZIndex = Object_ZIndex
			table.insert(StepValues, (((Maximum-Minimum)/(Steps+1)))*x)
		end
		table.insert(StepValues, Maximum)
		for x = 1, #StepValues do
			print(StepValues[x])
		end
	end
end

function FunctionTable.Create_Indicator_Bar(Object_Name, Object_Directory, Object_Size, Object_Position, Create_Container, Indicator_Value, Include_Tag, Object_ZIndex, Return_Object)
	if (Create_Container) then
		repeat wait() until FunctionTable.Create_Frame
		local Container = FunctionTable.Create_Frame(Object_Name, Object_Directory, Object_Size, Object_Position, Object_ZIndex, true, true)
		
		local IndicatorFrame = Instance.new("Frame", Container)
		IndicatorFrame.ZIndex = Object_ZIndex
		IndicatorFrame.Size = UDim2.new(1,-6,1,-6)
		IndicatorFrame.Position = UDim2.new(0,3,0,3)
		IndicatorFrame.BackgroundTransparency = 0.8
		IndicatorFrame.BorderSizePixel = 0
		IndicatorFrame.BackgroundColor3 = Color3.new(1,1,1)
		
		local Bar = Instance.new("Frame", IndicatorFrame)
		Bar.ZIndex = Object_ZIndex
		Bar.Size = UDim2.new(1,0,1,0)
		Bar.Position = UDim2.new(0,0,0,0)
		Bar.BackgroundTransparency = 0.6
		Bar.BorderSizePixel = 0
		Bar.BackgroundColor3 = Color3.new(1,1,1)
		Indicator_Value.Changed:Connect(function()
		local Percentage = (Indicator_Value.Value / Indicator_Value.MaxValue)
		Bar:TweenSize(UDim2.new(Percentage,0,1,0),"Out","Quad",0.125,true)
		end)
	else
		local IndicatorFrame = Instance.new("Frame", Object_Directory)
		IndicatorFrame.Name = tostring(Object_Name)
		IndicatorFrame.ZIndex = Object_ZIndex
		IndicatorFrame.Size = Object_Size
		IndicatorFrame.Position = Object_Position
		IndicatorFrame.BackgroundTransparency = 0.8
		IndicatorFrame.BorderSizePixel = 0
		IndicatorFrame.BackgroundColor3 = Color3.new(1,1,1)
		
		local Bar = Instance.new("Frame", IndicatorFrame)
		Bar.ZIndex = Object_ZIndex
		Bar.Size = UDim2.new(1,0,1,0)
		Bar.Position = UDim2.new(0,0,0,0)
		Bar.BackgroundTransparency = 0.6
		Bar.BorderSizePixel = 0
		Bar.BackgroundColor3 = Color3.new(1,1,1)
		Indicator_Value.Changed:Connect(function()
		local Percentage = (Indicator_Value.Value / Indicator_Value.MaxValue)
		Bar:TweenSize(UDim2.new(Percentage,0,1,0),"Out","Quad",0.125,true)
		end)
	end
end

FunctionTable["Create_Notification"] = function(Notification_Title, Notification_Description, Duration)
	repeat wait() until FunctionTable.Create_Frame
	local TemporaryUI = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer.PlayerGui)
	local Container = FunctionTable.Create_Frame("Notification", TemporaryUI, UDim2.new(0,0,0,0), UDim2.new(0,0,0,0), 10, true, true)
	Container.Position = UDim2.new(math.random(25/100,75/100),0,math.random(25/100,75/100),0)
	
	local Title = Instance.new("TextLabel", Container)
	Title.ZIndex = 10
	Title.BorderSizePixel = 0
	Title.BackgroundTransparency = 2
	Title.Position = UDim2.new(0,0,0,0)
	Title.Size = UDim2.new(1,0,0.45,0)
	Title.Font = "SourceSans"
	Title.FontSize = "Size24"
	Title.Text = tostring(Notification_Title)
	Title.TextColor3 = Color3.new(1,1,1)
	Title.TextTransparency = 1
	Title.TextScaled = true
	Title.TextWrapped = true
	
	local Description = Instance.new("TextLabel", Container)
	Description.ZIndex = 10
	Description.BorderSizePixel = 0
	Description.BackgroundTransparency = 2
	Description.Position = UDim2.new(0,0,0.45,0)
	Description.Size = UDim2.new(1,0,0.5,0)
	Description.Font = "SourceSans"
	Description.FontSize = "Size24"
	Description.Text = tostring(Notification_Description)
	Description.TextColor3 = Color3.new(1,1,1)
	Description.TextScaled = true
	Description.TextTransparency = 1
	Description.TextWrapped = true
	Container:TweenSizeAndPosition(UDim2.new(0.2,0,0.2,0), UDim2.new(0.4,0,0.05,0),"Out","Quad",0.5,true)	
	Spawn(function()
		wait(0.15)
		for x = 1, 0, -0.1 do
			Title.TextTransparency = x
			Description.TextTransparency = x
			wait(0)
		end
		wait(Duration)
		Container:TweenSizeAndPosition(UDim2.new(0,0,0,0),UDim2.new(math.random(25/100,75/100),0,math.random(25/100,75/100),0),"Out","Quad",0.5,true)
		for x = 0, 1, 0.1 do
			Title.TextTransparency = x
			Description.TextTransparency = x
			wait(0)
		end
		wait(1)
		Container:Destroy()
	end)
end

function FunctionTable.Create_TabbedMenu(Object_Name, Object_Directory, Object_Size, Object_Position, Object_ZIndex, Menu_Option_Table)
	local Container = FunctionTable.Create_Frame(tostring(Object_Name), Object_Directory, Object_Size, Object_Position, Object_ZIndex, true, true)
	local MenuTabs = Instance.new("Frame", Container)
	MenuTabs.Size = UDim2.new(1,0,0,75)	
	MenuTabs.ZIndex = Object_ZIndex
	MenuTabs.Position = UDim2.new(0,0,0,0)
	MenuTabs.BorderSizePixel = 0
	MenuTabs.BackgroundTransparency = 0.9
	MenuTabs.BackgroundColor3 = Color3.new(0,0,0)
	--[[local DecorBar = Instance.new("Frame", MenuTabs)
	DecorBar.Size = UDim2.new(1,0,0,3)
	DecorBar.Position = UDim2.new(0,0,0,-5)
	DecorBar.BorderSizePixel = 0
	DecorBar.BackgroundTransparency = 0.8
	DecorBar.BackgroundColor3 = Color3.new(1,1,1)
	DecorBar.ZIndex = Object_ZIndex]]
	local Dif = 1/#Menu_Option_Table
	local Selected
	local SelectBar = Instance.new("Frame", MenuTabs)
	SelectBar.Size = UDim2.new(Dif,0,0,2)
	SelectBar.Position = UDim2.new(0,0,1,-5)
	SelectBar.BorderSizePixel = 0
	SelectBar.BackgroundTransparency = 0.5
	SelectBar.BackgroundColor3 = Color3.new(1,1,1)
	SelectBar.ZIndex = Object_ZIndex
	for x = 1, #Menu_Option_Table do
		local MenuButton = FunctionTable.Create_TextButton(tostring(Menu_Option_Table[x][1]), tostring(Menu_Option_Table[x][2]), MenuTabs, UDim2.new(Dif,0,0.8,0), UDim2.new(((Dif*x)-Dif),0,0.1,0), Object_ZIndex)
		--local ItemContainer = FunctionTable.Create_Frame(tostring(Menu_Option_Table[x][1]), Container, UDim2.new(1,0,1,-75), UDim2.new(0,0,0,-1), Object_ZIndex, true, true)
		local ItemContainer = Instance.new("Frame", Container)
		ItemContainer.Name = tostring(Menu_Option_Table[x][1])
		ItemContainer.Size = UDim2.new(1,0,1,-75)		
		ItemContainer.Position = UDim2.new(0,0,0,1)
		ItemContainer.ZIndex = Object_ZIndex
		ItemContainer.BackgroundColor3 = Color3.new(0,0,0)
		ItemContainer.BackgroundTransparency = 0.75
		ItemContainer.BorderSizePixel = 0
		MenuButton.MouseEnter:Connect(function()
			if (Selected ~= ItemContainer) then
			ItemContainer:TweenPosition(UDim2.new(0,0,0.75,75), "Out", "Quint", 0.25, true)
				if (Selected~=nil) then
					Selected:TweenPosition(UDim2.new(0,0,-0.2,75), "Out", "Quint", 0.25, true)
				end
			end
		end)
		MenuButton.MouseLeave:Connect(function()
			if (Selected ~= ItemContainer) then
			ItemContainer:TweenPosition(UDim2.new(0,0,1,75), "Out", "Quint", 0.25, true)
				if (Selected~=nil) then
					Selected:TweenPosition(UDim2.new(0,0,0,75), "Out", "Quint", 0.25, true)
				end
			end
		end)
		MenuButton.MouseButton1Click:Connect(function()
			if (Selected ~= ItemContainer) then 
			Selected:TweenPosition(UDim2.new(0,0,1,0), "Out", "Quint", 0.4, true)
			Selected = ItemContainer
			SelectBar:TweenPosition(UDim2.new(MenuTabs[Selected.Name].Position.X.Scale, 0, 1, -5), "Out", "Quad", 0.25, true)
			ItemContainer:TweenPosition(UDim2.new(0,0,0,75), "Out", "Quint", 0.4, true)
			end
		end)
	end
	Selected = Container[Menu_Option_Table[1][1]]
	Container[Menu_Option_Table[1][1]]:TweenPosition(UDim2.new(0,0,0,75), "Out", "Quint", 0.25, true)
	SelectBar:TweenPosition(UDim2.new(MenuTabs[Selected.Name].Position.X.Scale, 0, 1, -5), "Out", "Quad", 0.25, true)
end

FunctionTable["Create_DynamicList_Scroll"] = function(Object_Name, Object_Directory, Object_Size, Object_Position, Create_Container, List_Table, Object_ZIndex, Return_Objects, Add_Direction)
	local TableNo = #List_Table
	if (Create_Container) then
		local Frame = FunctionTable.Create_Frame(tostring(Object_Name), Object_Directory, Object_Size, Object_Position, Object_ZIndex, true, true)
		local Container = Instance.new("Frame", Frame)
		Container.BackgroundTransparency = 1
		Container.Size = UDim2.new(1,0,1,0)
		Container.Position = UDim2.new(0,0,0,0)
		Container.ZIndex = Object_ZIndex
		Spawn(function()
			if (Add_Direction == "Downward") then
			while wait(1) do
				if (#List_Table > TableNo) then
					TableNo = #List_Table
					local OldShit = Container:GetChildren()
					for x = 1, #OldShit do
						if (OldShit[x]:IsA("TextLabel")) then
							OldShit[x]:TweenPosition(UDim2.new(0,0,0,OldShit[x].Position.Y.Offset + 50), "Out", "Quint", 0.5, true)
						end
					end
					local Label = Instance.new("TextLabel", Container)
					Label.BackgroundTransparency = 1
					Label.Size = UDim2.new(1,0,0,50)
					Label.Position = UDim2.new(-1,0,0,0)
					Label.BorderSizePixel = 0
					Label.Text = tostring(List_Table[TableNo])
					Label.FontSize = "Size24"
					if (not Label.TextFits) then
						Label.TextScaled = true
					end
					Label.TextColor3 = Color3.new(1,1,1)
					Label.Font = "SourceSans"
					Label:TweenPosition(UDim2.new(0,0,0,0), "Out", "Quad", 0.35, true)
				end
			end
			elseif (Add_Direction == "Upward") then
			while wait(1) do
				if (#List_Table > TableNo) then
					TableNo = #List_Table
					local OldShit = Container:GetChildren()
					for x = 1, #OldShit do
						if (OldShit[x]:IsA("TextLabel")) then
							if (OldShit[x].Position.Y.Scale <= -0.5) then
								OldShit[x]:Destroy()
							end
							OldShit[x]:TweenPosition(UDim2.new(0,0,1,OldShit[x].Position.Y.Offset - 50), "Out", "Quint", 0.5, true)
						end
					end
					local Label = Instance.new("TextLabel", Container)
					Label.BackgroundTransparency = 1
					Label.Size = UDim2.new(1,0,0,50)
					Label.Position = UDim2.new(-1,0,1,-50)
					Label.BorderSizePixel = 0
					Label.Text = tostring(List_Table[TableNo])
					Label.FontSize = "Size24"
					if (not Label.TextFits) then
						Label.TextScaled = true
					end
					Label.TextColor3 = Color3.new(1,1,1)
					Label.Font = "SourceSans"
					Label:TweenPosition(UDim2.new(0,0,1,-50), "Out", "Quad", 0.35, true)
				end
			end
			end
		end)
	local InFrame = false
	Frame.MouseEnter:Connect(function()
		InFrame = true
		while InFrame do
		if (not InFrame) then break end
		Container.Position = UDim2.new(0,0,0,(Container.AbsoluteSize.Y - UserInputService.GetMouseLocation().Y))
		wait(1/30)
		end
	end)
	Frame.MouseLeave:Connect(function()
		InFrame = false
		Container:TweenPosition(UDim2.new(0,0,0,0), "Out", "Quint", 0.4, true)
	end)
	end
end

function FunctionTable.Create_DynamicList_Fixed(Object_Name, Object_Directory, Object_Size, Object_Position, Create_Container, List_Table, Object_ZIndex, Return_Objects, Add_Direction)
	local TableNo = #List_Table
	--[[local NewChild = Instance.new("BindableEvent", game:GetService("Players").LocalPlayer)
	setmetatable(Table, {
		__newindex = function(Table, i, v)
			rawset(Table, i, v)
			NewChild:Fire()
		end,
		__index = function(Table, i, v)
			rawset(Table, i, v)
			NewChild:Fire()
		end
	})]]
	if (Create_Container) then
		local Frame = FunctionTable.Create_Frame(tostring(Object_Name), Object_Directory, Object_Size, Object_Position, Object_ZIndex, true, true)
		local Container = Instance.new("Frame", Frame)
		Container.BackgroundTransparency = 1
		Container.Size = UDim2.new(1,0,1,0)
		Container.Position = UDim2.new(0,0,0,0)
		Container.ZIndex = Object_ZIndex
		Spawn(function()
			if (Add_Direction == "Downward") then
			while wait(1) do
				if (#List_Table > TableNo) then
					TableNo = #List_Table
					local OldShit = Container:GetChildren()
					for x = 1, #OldShit do
						if (OldShit[x]:IsA("TextLabel")) then
							OldShit[x]:TweenPosition(UDim2.new(0,0,0,OldShit[x].Position.Y.Offset + 50), "Out", "Quint", 0.5, true)
						end
					end
					local Label = Instance.new("TextLabel", Container)
					Label.BackgroundTransparency = 1
					Label.Size = UDim2.new(1,0,0,50)
					Label.Position = UDim2.new(-1,0,0,0)
					Label.BorderSizePixel = 0
					Label.Text = tostring(List_Table[TableNo])
					Label.FontSize = "Size24"
					if (not Label.TextFits) then
						Label.TextScaled = true
					end
					Label.TextColor3 = Color3.new(1,1,1)
					Label.Font = "SourceSans"
					Label:TweenPosition(UDim2.new(0,0,0,0), "Out", "Quad", 0.35, true)
				end
			end
			elseif (Add_Direction == "Upward") then
			while wait(1) do
				if (#List_Table > TableNo) then
					TableNo = #List_Table
					local OldShit = Container:GetChildren()
					for x = 1, #OldShit do
						if (OldShit[x]:IsA("TextLabel")) then
							if (OldShit[x].Position.Y.Scale <= -0.5) then
								OldShit[x]:Destroy()
							end
							OldShit[x]:TweenPosition(UDim2.new(0,0,1,OldShit[x].Position.Y.Offset - 50), "Out", "Quint", 0.5, true)
						end
					end
					local Label = Instance.new("TextLabel", Container)
					Label.BackgroundTransparency = 1
					Label.Size = UDim2.new(1,0,0,50)
					Label.Position = UDim2.new(-1,0,1,-50)
					Label.BorderSizePixel = 0
					Label.Text = tostring(List_Table[TableNo])
					Label.FontSize = "Size24"
					if (not Label.TextFits) then
						Label.TextScaled = true
					end
					Label.TextColor3 = Color3.new(1,1,1)
					Label.Font = "SourceSans"
					Label:TweenPosition(UDim2.new(0,0,1,-50), "Out", "Quad", 0.35, true)
				end
			end
			end
		end)
		--[[NewChild.Event:Connect(function()
			local Oldshit = Container:GetChildren()
			for x = 1, #Oldshit do
				if (OldShit[x]:IsA("TextLabel")) then
					OldShit[x]:TweenPosition(UDim2.new(0,0,0,OldShit[x].Position.x.Offset - 50), "Out", "Quint", 0.25, true)
				end
			end
			local Label = Instance.new("TextLabel", Container)
			Label.BackgroundTransparency = 1
			Label.Size = UDim2.new(1,0,0,50)
			Label.Position = UDim2.new(-1,0,0,0)
			Label.BackgroundColor3 = Color3.new(0,0,0)
			Label.BorderSizePixel = 0
			Label.ZIndex = Object_ZIndex
			Label.Font = "SourceSans"
			Label.Text = tostring(Table[#Table])
			Label.FontSize = "Size24"
			if (not Label.TextFits) then
				Label.TextScaled = true
			end
			Label:TweenPosition(UDim2.new(0,0,0,0), "Out", "Quint", 0.25, true)
		end)]]
	end
	
end

function FunctionTable.Create_ScrollList_Image(Object_Name, Object_Directory, Object_Size, Object_Position, Create_Container, Item_Table, Object_ZIndex, Item_Names, Item_Button_Directory, Contain, Return_Objects)
	if (Create_Container) then
		repeat wait() until FunctionTable.Create_Frame
		local Container = FunctionTable.Create_Frame(tostring(Object_Name), Object_Directory, Object_Size, Object_Position, Object_ZIndex, true, true)
		
		local FrameContainer = Instance.new("Frame", Container)
		FrameContainer.Size = UDim2.new(1,0,1,0)
		FrameContainer.Position = UDim2.new(0,0,0,0)
		FrameContainer.BackgroundColor3 = Color3.new(0,0,0)
		FrameContainer.BackgroundTransparency = 2
		FrameContainer.BorderSizePixel = 0
		FrameContainer.ZIndex = Object_ZIndex
		
		local VisualFrame = Instance.new("Frame", FrameContainer)
		VisualFrame.BackgroundTransparency = 2
		VisualFrame.BorderSizePixel = 0
		VisualFrame.Position = UDim2.new(0,0,0,0)
		VisualFrame.Size = UDim2.new(1,0,1,0)
		VisualFrame.ZIndex = Object_ZIndex
		
		local NumberItems = #Item_Table
		local Difference = (1/NumberItems)
		local VisualDifference = 0.25
		local CenterPos = UDim2.new(0,0,0.375,0)
		local CenterSize = UDim2.new(1,0,0.25,0)
		local OtherSize = UDim2.new(0.75,0,0.125,0)
		local VisualPos = 0.675
		local ButtonPos = 0
		for x = 1, NumberItems do
			local ImageFrame = Instance.new("Frame", VisualFrame)
			ImageFrame.Transparency = 2
			ImageFrame.Name = Item_Table[x][1]
			ImageFrame.ZIndex = Object_ZIndex
			ImageFrame.Size = UDim2.new(0.75,0,0.125,0)
			ImageFrame.Position = UDim2.new(0.125,0,VisualPos,0)
			ImageFrame.BorderSizePixel = 0
			local ImageTag = Instance.new("NumberValue", ImageFrame)
			ImageTag.Name = "ItemNumber"
			ImageTag.Value = x
			local ImageLabel = Instance.new("ImageLabel", ImageFrame)
			ImageLabel.Name = "ItemImage"
			ImageLabel.BackgroundTransparency = 2
			ImageLabel.Image = Item_Table[x][3]
			ImageLabel.Size = UDim2.new(0.5,0,1,0)
			ImageLabel.Position = UDim2.new(0,0,0,0)
			ImageLabel.ZIndex = Object_ZIndex
				if (Item_Names) then
				local ImageName = Instance.new("TextLabel", ImageFrame)
				ImageName.BackgroundTransparency = 2
				ImageName.BorderSizePixel = 0
				ImageName.Name = "ItemName"
				ImageName.Position = UDim2.new(0.1,0,0,0)
				ImageName.Size = UDim2.new(1,0,1,0)
				ImageName.Text = Item_Table[x][2]
				ImageName.ZIndex = Object_ZIndex
				ImageName.Font = "SourceSans"
				ImageName.FontSize = "Size18"
				ImageName.TextColor3 = Color3.new(1,1,1)
				end
			local NewButton = Instance.new("ImageButton", FrameContainer)
			NewButton.Name = Item_Table[x][1]
			NewButton.BackgroundTransparency = 2
			NewButton.BorderSizePixel = 0
			NewButton.Size = UDim2.new(1,0,Difference,0)
			NewButton.Position = UDim2.new(0,0,ButtonPos,0)
			NewButton.ZIndex = Object_ZIndex
			local Button_CodeConnection = Item_Button_Directory[Item_Table[x][1]]:Clone()
			Button_CodeConnection.Parent = NewButton
			Button_CodeConnection.Disabled = false
			ButtonPos = (ButtonPos+Difference)
			VisualPos = (VisualPos+VisualDifference)
			NewButton.MouseEnter:Connect(function()
				VisualFrame:TweenPosition(UDim2.new(0,0,(-0.25*(VisualFrame[NewButton.Name].ItemNumber.Value)),0), "Out", "Quad", 0.25, true)
				VisualFrame[NewButton.Name]:TweenSize(CenterSize, "Out", "Quad", 0.25, true)
				if (Item_Names) then
					VisualFrame[NewButton.Name].ItemName.TextTransparency = 0
				end
			end)
			NewButton.MouseLeave:Connect(function()
				VisualFrame[NewButton.Name]:TweenSize(OtherSize, "Out", "Quad", 0.25, true)
				if (Item_Names) then
					VisualFrame[NewButton.Name].ItemName.TextTransparency = 0.75
				end
			end)
		end
	else
		local FrameContainer = Instance.new("Frame", Object_Directory)
		FrameContainer.Size = Object_Size
		FrameContainer.Position = Object_Position
		FrameContainer.BackgroundColor3 = Color3.new(0,0,0)
		FrameContainer.BackgroundTransparency = 2
		FrameContainer.BorderSizePixel = 0
		FrameContainer.ZIndex = Object_ZIndex
		
		local VisualFrame = Instance.new("Frame", FrameContainer)
		VisualFrame.BackgroundTransparency = 2
		VisualFrame.BorderSizePixel = 0
		VisualFrame.Position = UDim2.new(0,0,0,0)
		VisualFrame.Size = UDim2.new(1,0,1,0)
		VisualFrame.ZIndex = Object_ZIndex
		
		local NumberItems = #Item_Table
		local Difference = (1/NumberItems)
		local VisualDifference = 0.25
		local CenterPos = UDim2.new(0,0,0.375,0)
		local CenterSize = UDim2.new(1,0,0.25,0)
		local OtherSize = UDim2.new(0.75,0,0.125,0)
		local VisualPos = 0.675
		local ButtonPos = 0
		for x = 1, NumberItems do
			local ImageFrame = Instance.new("Frame", VisualFrame)
			ImageFrame.Transparency = 2
			ImageFrame.Name = Item_Table[x][1]
			ImageFrame.ZIndex = Object_ZIndex
			ImageFrame.Size = UDim2.new(0.75,0,0.125,0)
			ImageFrame.Position = UDim2.new(0.125,0,VisualPos,0)
			ImageFrame.BorderSizePixel = 0
			local ImageTag = Instance.new("NumberValue", ImageFrame)
			ImageTag.Name = "ItemNumber"
			ImageTag.Value = x
			local ImageLabel = Instance.new("ImageLabel", ImageFrame)
			ImageLabel.Name = "ItemImage"
			ImageLabel.BackgroundTransparency = 2
			ImageLabel.Image = Item_Table[x][3]
			ImageLabel.Size = UDim2.new(0.5,0,1,0)
			ImageLabel.Position = UDim2.new(0,0,0,0)
			ImageLabel.ZIndex = Object_ZIndex
				if (Item_Names) then
				local ImageName = Instance.new("TextLabel", ImageFrame)
				ImageName.BackgroundTransparency = 2
				ImageName.BorderSizePixel = 0
				ImageName.Name = "ItemName"
				ImageName.Text = Item_Table[x][2]
				ImageName.ZIndex = Object_ZIndex
				ImageName.Font = "SourceSans"
				ImageName.FontSize = "Size18"
				ImageName.TextColor3 = Color3.new(1,1,1)
				end
			local NewButton = Instance.new("ImageButton", FrameContainer)
			NewButton.Name = Item_Table[x][1]
			NewButton.BackgroundTransparency = 2
			NewButton.BorderSizePixel = 0
			NewButton.Size = UDim2.new(1,0,Difference,0)
			NewButton.Position = UDim2.new(0,0,ButtonPos,0)
			NewButton.ZIndex = Object_ZIndex
			local Button_CodeConnection = Item_Button_Directory[Item_Table[x][1]]:Clone()
			Button_CodeConnection.Parent = NewButton
			Button_CodeConnection.Disabled = false
			ButtonPos = (ButtonPos+Difference)
			VisualPos = (VisualPos+VisualDifference)
			NewButton.MouseEnter:Connect(function()
				VisualFrame:TweenPosition(UDim2.new(0,0,(-0.25*(VisualFrame[NewButton.Name].ItemNumber.Value)),0), "Out", "Quad", 0.25, true)
				VisualFrame[NewButton.Name]:TweenSize(CenterSize, "Out", "Quad", 0.25, true)
				if (Item_Names) then
					VisualFrame[NewButton.Name].ItemName.TextTransparency = 0
				end
			end)
			NewButton.MouseLeave:Connect(function()
				VisualFrame[NewButton.Name]:TweenSize(OtherSize, "Out", "Quad", 0.25, true)
				if (Item_Names) then
					VisualFrame[NewButton.Name].ItemName.TextTransparency = 0.75
				end
			end)
		end
	end
end

function FunctionTable.Create_ScrollList_Text(Object_Name, Object_Directory, Object_Size, Object_Position, Create_Container, Item_Table, Object_ZIndex, Item_Button_Directory, Contain, Return_Objects)
	if (Create_Container) then
		repeat wait() until FunctionTable.Create_Frame
		local Container = FunctionTable.Create_Frame(tostring(Object_Name), Object_Directory, Object_Size, Object_Position, Object_ZIndex, true, true)
		
		local FrameContainer = Instance.new("Frame", Container)
		FrameContainer.Size = UDim2.new(1,0,1,0)
		FrameContainer.Position = UDim2.new(0,0,0,0)
		FrameContainer.BackgroundColor3 = Color3.new(0,0,0)
		FrameContainer.BackgroundTransparency = 2
		FrameContainer.BorderSizePixel = 0
		FrameContainer.ZIndex = Object_ZIndex
		
		local VisualFrame = Instance.new("Frame", FrameContainer)
		VisualFrame.BackgroundTransparency = 2
		VisualFrame.BorderSizePixel = 0
		VisualFrame.Position = UDim2.new(0,0,0,0)
		VisualFrame.Size = UDim2.new(1,0,1,0)
		VisualFrame.ZIndex = Object_ZIndex
		
		local TextContainer = Instance.new("Frame", VisualFrame)
		TextContainer.BackgroundTransparency = 2
		TextContainer.BorderSizePixel = 0
		TextContainer.Size = UDim2.new(1,0,1,0)
		TextContainer.Position = UDim2.new(0,0,0,0)
		TextContainer.ZIndex = Object_ZIndex
		
		local NumberItems = #Item_Table
		local Difference = (1/NumberItems)
		local TextPos = 0.45
		local TextPosDifference = 0.1
		local ButtonPos = 0
		for x = 1, NumberItems do
			--[[ Create Visual Representation ]]
			local NewText = Instance.new("TextLabel", TextContainer)
			NewText.BackgroundTransparency = 2
			NewText.BorderSizePixel = 0
			NewText.Name = tostring(Item_Table[x][1])
			NewText.TextColor3 = Color3.new(1,1,1)
			NewText.TextTransparency = 0.75
			NewText.Position = UDim2.new(0,0,TextPos,0)
			NewText.Size = UDim2.new(1,0,0.1,0)
			NewText.ZIndex = Object_ZIndex
			NewText.Font = "SourceSans"
			NewText.FontSize = "Size14"
			NewText.Text = tostring(Item_Table[x][2])
			local NumberTag = Instance.new("NumberValue", NewText)
			NumberTag.Name = "ItemNumber"
			NumberTag.Value = x
			TextPos = TextPos + TextPosDifference
			local NewButton = Instance.new("ImageButton", FrameContainer)
			NewButton.Name = tostring(Item_Table[x][1])
			NewButton.BackgroundTransparency = 2
			NewButton.BorderSizePixel = 0
			NewButton.Position = UDim2.new(0,0,ButtonPos,0)
			NewButton.Size = UDim2.new(1,0,Difference,0)
			NewButton.ZIndex = Object_ZIndex
			ButtonPos = ButtonPos + Difference
			NewButton.MouseEnter:Connect(function()
				local VisText = TextContainer[NewButton.Name]
				if (not VisText) then return end
				TextContainer:TweenPosition(UDim2.new(0,0,(-(VisText["ItemNumber"].Value/10)+0.1),0),"Out","Quad",0.25,true)
				VisText.FontSize = "Size24"
				VisText.TextTransparency = 0
				wait(0)
			end)
			NewButton.MouseLeave:Connect(function()
				TextContainer[NewButton.Name].FontSize = "Size14"
				TextContainer[NewButton.Name].TextTransparency = 0.75
				wait(0)
			end)
			if (Item_Button_Directory~=nil) then
			local Button_CodeConnection = Item_Button_Directory[Item_Table[x][1]]:Clone()
			Button_CodeConnection.Parent = NewButton
			Button_CodeConnection.Disabled = false
			end
		end
		if (Return_Objects) then
			return Container
		end
	else
		local FrameContainer = Instance.new("Frame", Object_Directory)
		FrameContainer.Name = Object_Name
		FrameContainer.Size = Object_Size
		FrameContainer.Position = Object_Position
		FrameContainer.BackgroundColor3 = Color3.new(0,0,0)
		FrameContainer.BackgroundTransparency = 2
		FrameContainer.BorderSizePixel = 0
		FrameContainer.ZIndex = Object_ZIndex
		
		local VisualFrame = Instance.new("Frame", FrameContainer)
		VisualFrame.BackgroundTransparency = 2
		VisualFrame.BorderSizePixel = 0
		VisualFrame.Position = UDim2.new(0,0,0,0)
		VisualFrame.Size = UDim2.new(1,0,1,0)
		VisualFrame.ZIndex = Object_ZIndex
		
		local TextContainer = Instance.new("Frame", VisualFrame)
		TextContainer.BackgroundTransparency = 2
		TextContainer.BorderSizePixel = 0
		TextContainer.Size = UDim2.new(1,0,1,0)
		TextContainer.Position = UDim2.new(0,0,0,0)
		TextContainer.ZIndex = Object_ZIndex
		
		local NumberItems = #Item_Table
		local Difference = (1/NumberItems)
		local TextPos = 0.45
		local TextPosDifference = 0.1
		local ButtonPos = 0
		for x = 1, NumberItems do
			--[[ Create Visual Representation ]]
			local NewText = Instance.new("TextLabel", TextContainer)
			NewText.BackgroundTransparency = 2
			NewText.BorderSizePixel = 0
			NewText.Name = tostring(Item_Table[x][1])
			NewText.TextColor3 = Color3.new(1,1,1)
			NewText.TextTransparency = 0.75
			NewText.Position = UDim2.new(0,0,TextPos,0)
			NewText.Size = UDim2.new(1,0,0.1,0)
			NewText.ZIndex = Object_ZIndex
			NewText.Font = "SourceSans"
			NewText.FontSize = "Size14"
			NewText.Text = tostring(Item_Table[x][2])
			local NumberTag = Instance.new("NumberValue", NewText)
			NumberTag.Name = "ItemNumber"
			NumberTag.Value = x
			TextPos = TextPos + TextPosDifference
			local NewButton = Instance.new("ImageButton", FrameContainer)
			NewButton.Name = tostring(Item_Table[x][1])
			NewButton.BackgroundTransparency = 2
			NewButton.BorderSizePixel = 0
			NewButton.Position = UDim2.new(0,0,ButtonPos,0)
			NewButton.Size = UDim2.new(1,0,Difference,0)
			NewButton.ZIndex = Object_ZIndex
			ButtonPos = ButtonPos + Difference
			NewButton.MouseEnter:Connect(function()
				local VisText = TextContainer[NewButton.Name]
				if (not VisText) then return end
				TextContainer:TweenPosition(UDim2.new(0,0,(-(VisText["ItemNumber"].Value/10)+0.1),0),"Out","Quad",0.25,true)
				VisText.FontSize = "Size24"
				VisText.TextTransparency = 0
				wait(0)
			end)
			NewButton.MouseLeave:Connect(function()
				TextContainer[NewButton.Name].FontSize = "Size14"
				TextContainer[NewButton.Name].TextTransparency = 0.75
				wait(0)
			end)
			if (Item_Button_Directory~=nil) then
			local Button_CodeConnection = Item_Button_Directory[Item_Table[x][1]]:Clone()
			Button_CodeConnection.Parent = NewButton
			Button_CodeConnection.Disabled = false
			end
		end
		if (Return_Objects) then
			return FrameContainer
		end
	end
end

return FunctionTable
