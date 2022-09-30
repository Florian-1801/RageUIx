---
--- @author Dylan MALANDAIN, Kalyptus
--- @version 1.0.0
--- created at [24/05/2021 10:02]
---

---@class Panels
Panels = {};

local GridType = {
    Default = 1,
    Horizontal = 2,
    Vertical = 3
}

local GridSprite = {
    [GridType.Default] = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "nose_grid", },
    [GridType.Horizontal] = { Dictionary = "RageUI_", Texture = "horizontal_grid", },
    [GridType.Vertical] = { Dictionary = "RageUI_", Texture = "vertical_grid", },
}

local Grid = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 275 },
    Grid = { X = 115.5, Y = 47.5, Width = 200, Height = 200 },
    Circle = { Dictionary = "mpinventory", Texture = "in_world_circle", X = 115.5, Y = 47.5, Width = 20, Height = 20 },
    Text = {
        Top = { X = 215.5, Y = 15, Scale = 0.35 },
        Bottom = { X = 215.5, Y = 250, Scale = 0.35 },
        Left = { X = 57.75, Y = 130, Scale = 0.35 },
        Right = { X = 373.25, Y = 130, Scale = 0.35 },
    },
}

local Percentage = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 76 },
    Bar = { X = 9, Y = 50, Width = 413, Height = 10 },
    Text = {
        Left = { X = 25, Y = 15, Scale = 0.35 },
        Middle = { X = 215.5, Y = 15, Scale = 0.35 },
        Right = { X = 398, Y = 15, Scale = 0.35 },
    },
}

local Slider = {
	Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 76 },
	Text = {
		Left = { X = 18, Y = 8, Scale = 0.32 },
		Right = { X = 380, Y = 8, Scale = 0.32 },
		Upper = {X = 230, Y = 8, Scale = 0.32},
	},
	Bar = { X = 25, Y = 36, Width = 250, Height = 16 },
	Slider = { X = 20, Y = 14.5, Width = 35, Height = 9 },
	LeftArrow = { Dictionary = "commonmenu", Texture = "arrowleft", X = 12, Y = 32.5, Width = 25, Height = 25 },
	RightArrow = { Dictionary = "commonmenu", Texture = "arrowright", X = 389, Y = 32.5, Width = 25, Height = 25 },
}

local Statistics = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 42 },
    Text = {
        Left = { X = -40, Y = 15, Scale = 0.35 },
    },
    Bar = { Right = 8, Y = 27, Width = 200, Height = 10, OffsetRatio = 0.5 },
    Divider = {
        [1] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [2] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [3] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [4] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [5] = { X = 200, Y = 27, Width = 2, Height = 10 },
    }
}

local function UIGridPanel(Type, StartedX, StartedY, TopText, BottomText, LeftText, RightText, Action, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if (CurrentMenu.Index == Index) then
        local X = Type == GridType.Default and StartedX or Type == GridType.Horizontal and StartedX or Type == GridType.Vertical and 0.5
        local Y = Type == GridType.Default and StartedY or Type == GridType.Horizontal and 0.5 or Type == GridType.Vertical and StartedY
        local Hovered = Graphics.IsMouseInBounds(431 + Grid.Grid.X + CurrentMenu.SafeZoneSize.X + 20, -690 + Grid.Grid.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20, Grid.Grid.Width + CurrentMenu.WidthOffset - 40, Grid.Grid.Height - 40)
        local Selected = false
        local CircleX = 431 + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20
        local CircleY = -690 + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20
        if X < 0.0 or X > 1.0 then
            X = 0.0
        end
        if Y < 0.0 or Y > 1.0 then
            Y = 0.0
        end
        CircleX = CircleX + ((Grid.Grid.Width - 40) * X) - (Grid.Circle.Width / 2)
        CircleY = CircleY + ((Grid.Grid.Height - 40) * Y) - (Grid.Circle.Height / 2)
        Graphics.Sprite("commonmenu", "gradient_bgd", 431, -690 + Grid.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Grid.Background.Width + CurrentMenu.WidthOffset, Grid.Background.Height)
        Graphics.Sprite(GridSprite[Type].Dictionary, GridSprite[Type].Texture, 431 + Grid.Grid.X + (CurrentMenu.WidthOffset / 2), -690 + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Grid.Grid.Width, Grid.Grid.Height)
        Graphics.Sprite(Grid.Circle.Dictionary, Grid.Circle.Texture, CircleX , CircleY, Grid.Circle.Width, Grid.Circle.Height)
        if (Type == GridType.Default) then
            Graphics.Text(TopText or "", 431 + Grid.Text.Top.X + (CurrentMenu.WidthOffset / 2), -690 + Grid.Text.Top.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Top.Scale, 245, 245, 245, 255, 1)
            Graphics.Text(BottomText or "", 431 + Grid.Text.Bottom.X + (CurrentMenu.WidthOffset / 2), -690 + Grid.Text.Bottom.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Bottom.Scale, 245, 245, 245, 255, 1)
            Graphics.Text(LeftText or "", 431 + Grid.Text.Left.X + (CurrentMenu.WidthOffset / 2), -690 + Grid.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Left.Scale, 245, 245, 245, 255, 1)
            Graphics.Text(RightText or "", 431 + Grid.Text.Right.X + (CurrentMenu.WidthOffset / 2), -690 + Grid.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Right.Scale, 245, 245, 245, 255, 1)
        end
        if (Type == GridType.Vertical) then
            Graphics.Text(TopText or "", 431 + Grid.Text.Top.X + (CurrentMenu.WidthOffset / 2), -690 + Grid.Text.Top.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Top.Scale, 245, 245, 245, 255, 1)
            Graphics.Text(BottomText or "", 431 + Grid.Text.Bottom.X + (CurrentMenu.WidthOffset / 2), -690 + Grid.Text.Bottom.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Bottom.Scale, 245, 245, 245, 255, 1)
        end
        if (Type == GridType.Horizontal) then
            Graphics.Text(LeftText or "", 431 + Grid.Text.Left.X + (CurrentMenu.WidthOffset / 2), -690 + Grid.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Left.Scale, 245, 245, 245, 255, 1)
            Graphics.Text(RightText or "", 431 + Grid.Text.Right.X + (CurrentMenu.WidthOffset / 2), -690 + Grid.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Right.Scale, 245, 245, 245, 255, 1)
        end
        if Hovered then
            if IsDisabledControlPressed(0, 24) then
                Selected = true
                CircleX = math.round(GetControlNormal(2, 239) * 1920) - CurrentMenu.SafeZoneSize.X - (Grid.Circle.Width / 2)
                CircleY = math.round(GetControlNormal(2, 240) * 1080) - CurrentMenu.SafeZoneSize.Y - (Grid.Circle.Height / 2)
                if CircleX > (431 + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20 + Grid.Grid.Width - 40) then
                    CircleX = 431 + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20 + Grid.Grid.Width - 40
                elseif CircleX < (431 + Grid.Grid.X + 20 - (Grid.Circle.Width / 2)) then
                    CircleX = 431 + Grid.Grid.X + 20 - (Grid.Circle.Width / 2)
                end
                if CircleY > (-690 + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 + Grid.Grid.Height - 40) then
                    CircleY = -690 + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 + Grid.Grid.Height - 40
                elseif CircleY < (-690 + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 - (Grid.Circle.Height / 2)) then
                    CircleY = -690 + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 - (Grid.Circle.Height / 2)
                end
                X = math.round((CircleX - (431 + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20) + (Grid.Circle.Width / 2)) / (Grid.Grid.Width - 40), 2)
                Y = math.round((CircleY - (-690 + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20) + (Grid.Circle.Height / 2)) / (Grid.Grid.Height - 40), 2)
                if (X ~= StartedX) and (Y ~= StartedY) then
                    Action(X, Y, (X * 2 - 1), (Y * 2 - 1))
                    --	Action.onPositionChange(X, Y, (X * 2 - 1), (Y * 2 - 1))
                end
                StartedX = X;
                StartedY = Y;
                if X > 1.0 then
                    X = 1.0
                end
                if Y > 1.0 then
                    Y = 1.0
                end
            end
        end
        RageUI.ItemOffset = RageUI.ItemOffset + Grid.Background.Height + Grid.Background.Y
        if Hovered and Selected then
            Audio.PlaySound(RageUI.Settings.Audio.Slider.audioName, RageUI.Settings.Audio.Slider.audioRef, true)
            --if (Action.onSelected ~= nil) then
            --	Action.onSelected(X, Y, (X * 2 - 1), (Y * 2 - 1));
            --end
        end
    end
end

---Grid
---@param StartedX number
---@param StartedY number
---@param TopText string
---@param BottomText string
---@param LeftText string
---@param RightText string
---@param Action fun(X:number, Y:number, CharacterX:number, CharacterY:number)
---@param Index number
---@public
---@return void
function Panels:Grid(StartedX, StartedY, TopText, BottomText, LeftText, RightText, Action, Index)
    UIGridPanel(GridType.Default, StartedX, StartedY, TopText, BottomText, LeftText, RightText, Action, Index)
end

---GridHorizontal
---@param StartedX number
---@param LeftText string
---@param RightText string
---@param Action fun(X:number, Y:number, CharacterX:number, CharacterY:number)
---@param Index number
---@public
---@return void
function Panels:GridHorizontal(StartedX, LeftText, RightText, Action, Index)
    UIGridPanel(GridType.Horizontal, StartedX, nil, nil, nil, LeftText, RightText, Action, Index)
end

---GridVertical
---@param StartedY number
---@param TopText string
---@param BottomText string
---@param Action fun(X:number, Y:number, CharacterX:number, CharacterY:number)
---@param Index number
---@public
---@return void
function Panels:GridVertical(StartedY, TopText, BottomText, Action, Index)
    UIGridPanel(GridType.Vertical, nil, StartedY, TopText, BottomText, nil, nil, Action, Index)
end

---Percentage
---@param Percent number
---@param HeaderText string
---@param MinText string
---@param MaxText string
---@param Actions fun(Percent:number, onSelected:boolean, onProgressChange:boolean)
---@param Index number
---@return nil
---@public
function Panels:Percentage(Percent, HeaderText, MinText, MaxText, Actions, Index)
    local CurrentMenu = RageUI.CurrentMenu

    if (CurrentMenu ~= nil) then
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then

            ---@type boolean
            local Hovered = Graphics.IsMouseInBounds(CurrentMenu.X + Percentage.Bar.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + Percentage.Bar.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset - 4, Percentage.Bar.Width + CurrentMenu.WidthOffset, Percentage.Bar.Height + 8)

            ---@type boolean
            local Selected = false

            ---@type number
            local Progress = Percentage.Bar.Width

            if (Percent < 0.0) then
                Percent = 0.0
            elseif (Percent > 1.0) then
                Percent = 1.0
            end

            Progress = Progress * Percent

            Graphics.Sprite(Percentage.Background.Dictionary, Percentage.Background.Texture, CurrentMenu.X, CurrentMenu.Y + Percentage.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percentage.Background.Width + CurrentMenu.WidthOffset, Percentage.Background.Height)
            Graphics.Rectangle(CurrentMenu.X + Percentage.Bar.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percentage.Bar.Width, Percentage.Bar.Height, 87, 87, 87, 255)
            Graphics.Rectangle(CurrentMenu.X + Percentage.Bar.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Progress, Percentage.Bar.Height, 245, 245, 245, 255)

            Graphics.Text(HeaderText or "Opacity", CurrentMenu.X + Percentage.Text.Middle.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Text.Middle.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Percentage.Text.Middle.Scale, 245, 245, 245, 255, 1)
            Graphics.Text(MinText or "0%", CurrentMenu.X + Percentage.Text.Left.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Percentage.Text.Left.Scale, 245, 245, 245, 255, 1)
            Graphics.Text(MaxText or "100%", CurrentMenu.X + Percentage.Text.Right.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Percentage.Text.Right.Scale, 245, 245, 245, 255, 1)

            if (Hovered) then
                if IsDisabledControlPressed(0, 24) or IsControlPressed(0, 24) then
                    Selected = true
                    
                    Progress = math.round((IsControlEnabled(2, 239) and GetControlNormal(2, 239) or GetDisabledControlNormal(2, 239)) * 1920 - CurrentMenu.SafeZoneSize.X - (CurrentMenu.X + Percentage.Bar.X + (CurrentMenu.WidthOffset / 2)))
                    
                    if Progress < 0 then
                        Progress = 0
                    elseif Progress > (Percentage.Bar.Width) then
                        Progress = Percentage.Bar.Width
                    end
                    
                    Percent = math.round(Progress / Percentage.Bar.Width, 2)
                    onProgressChange = true
                end
                Actions(Percent, Selected, onProgressChange)
                if (Selected) then
                    Audio.PlaySound(RageUI.Settings.Audio.Slider.audioName, RageUI.Settings.Audio.Slider.audioRef, true)
                end
            end
            
            RageUI.ItemOffset = RageUI.ItemOffset + Percentage.Background.Height + Percentage.Background.Y
        end
    end
end

---SliderPanel
---@param Value number
---@param MinValue number
---@param UpperText string
---@param MaxValue number
---@param Actions fun(Value:number, onSelected:boolean, onSliderChange:boolean)
---@param Index number
---@return nil
---@public
function Panels:SliderPanel(Value, MinValue, UpperText, MaxValue, Actions, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if (CurrentMenu ~= nil) then
        if CurrentMenu() and ((CurrentMenu.Index == Index)) then
            Value = Value or 0
            Slider.Bar.Width = Slider.RightArrow.X- Slider.LeftArrow.X - Slider.LeftArrow.Width - 5 + CurrentMenu.WidthOffset
            Slider.Bar.X = Slider.LeftArrow.X + Slider.LeftArrow.Width
            Slider.Text.Upper.X = (Slider.Bar.Width) / 2 + Slider.Bar.X
            Slider.Text.Right.X = Slider.RightArrow.X + Slider.LeftArrow.Width
            local Hovered = false
            local LeftArrowHovered, RightArrowHovered = false, false
            local SliderW = Slider.Bar.Width / (64 + 1)
            local SliderX =  CurrentMenu.X + Slider.Bar.X + Value * Slider.Bar.Width / MaxValue

            Hovered = Graphics.IsMouseInBounds(CurrentMenu.X + Slider.Bar.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + Slider.Bar.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset - 4, Slider.Bar.Width, Slider.Bar.Height + 8)

            Graphics.Sprite("commonmenu", "gradient_bgd", CurrentMenu.X, CurrentMenu.Y + Slider.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.Background.Width + CurrentMenu.WidthOffset, Slider.Background.Height, 0.0, 255, 255, 255, 255)
            Graphics.Text(MinValue, CurrentMenu.X + Slider.Text.Left.X, CurrentMenu.Y + Slider.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Slider.Text.Left.Scale, 255, 255, 255, 255)
            Graphics.Text(UpperText, CurrentMenu.X + Slider.Text.Upper.X, CurrentMenu.Y + Slider.Text.Upper.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Slider.Text.Upper.Scale, 255, 255, 255, 255, "Center")
            Graphics.Text(MaxValue, CurrentMenu.X + Slider.Text.Right.X + CurrentMenu.WidthOffset, CurrentMenu.Y + Slider.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Slider.Text.Right.Scale, 255, 255, 255, 255, "Right")

            Graphics.Sprite(Slider.LeftArrow.Dictionary, Slider.LeftArrow.Texture, CurrentMenu.X + Slider.LeftArrow.X, CurrentMenu.Y + Slider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.LeftArrow.Width, Slider.LeftArrow.Height, 0.0,  255, 255, 255, 255)
            Graphics.Sprite(Slider.RightArrow.Dictionary, Slider.RightArrow.Texture, CurrentMenu.X + Slider.RightArrow.X + CurrentMenu.WidthOffset , CurrentMenu.Y + Slider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.RightArrow.Width, Slider.RightArrow.Height, 0.0, 255, 255, 255, 255)
            Graphics.Rectangle(CurrentMenu.X + Slider.Bar.X, CurrentMenu.Y + Slider.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.Bar.Width, Slider.Bar.Height, 87, 87, 87, 255)
            Graphics.Rectangle(SliderX, CurrentMenu.Y + Slider.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SliderW, Slider.Bar.Height, 245, 245, 245, 255)

            LeftArrowHovered = Graphics.IsMouseInBounds(CurrentMenu.X + Slider.LeftArrow.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + Slider.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.LeftArrow.Width, Slider.LeftArrow.Height)
            RightArrowHovered = Graphics.IsMouseInBounds(CurrentMenu.X + Slider.RightArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + Slider.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Slider.RightArrow.Width, Slider.RightArrow.Height)

            if (Hovered) then
                if IsDisabledControlPressed(0, 24) then
                    Selected = true
                    local GetControl_X = GetDisabledControlNormal
                    Value = (math.round(GetControl_X(2, 239) * 1920) - CurrentMenu.SafeZoneSize.X - Slider.Bar.X )/ Slider.Bar.Width * MaxValue
                    if Value < 0 then
                        Value = 0
                    elseif Value >= MaxValue then
                        Value = MaxValue
                    end
                    Value = math.round(Value, 0)
                    -- print(Value)

                    onSliderChange = true
                    Actions(Value, Selected, onSliderChange)
                    if (Selected) then
                        Audio.PlaySound(RageUI.Settings.Audio.Slider.audioName, RageUI.Settings.Audio.Slider.audioRef, true)
                    end
                end
            elseif (CurrentMenu.Controls.Click.Active and (LeftArrowHovered or RightArrowHovered)) then
                Selected = true
                -- local max = type(Items) == "table" and #Items or MaxValue
                Value = Value + (LeftArrowHovered and -1 or RightArrowHovered and 1)
                if Value < MinValue then
                    Value = MaxValue
                elseif Value > MaxValue  then
                    Value = MinValue
                end
                -- print(Value)

                onSliderChange = true
                Actions(Value, Selected, onSliderChange)
                if (Selected) then
                    Audio.PlaySound(RageUI.Settings.Audio.LeftRight.audioName, RageUI.Settings.Audio.LeftRight.audioRef)
                end
            end
        end
    end
end

---@function StatisticPanel
---@param Percent number
---@param Text string
---@param Index number
---@return nil
---@public
function Panels:StatisticPanel(Percent, Text, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then

            ---@type number
            local BarWidth = Statistics.Bar.Width + CurrentMenu.WidthOffset * Statistics.Bar.OffsetRatio

            Graphics.Rectangle(CurrentMenu.X, CurrentMenu.Y + Statistics.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), Statistics.Background.Width + CurrentMenu.WidthOffset, Statistics.Background.Height, 0, 0, 0, 170)
            Graphics.Text(Text or "", CurrentMenu.X + 8.0, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Statistics.Text.Left.Scale, 245, 245, 245, 255, 0)
            Graphics.Rectangle(CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, BarWidth, Statistics.Bar.Height, 87, 87, 87, 255)
            Graphics.Rectangle(CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent * BarWidth, Statistics.Bar.Height, 255, 255, 255, 255)
            for i = 1, #Statistics.Divider, 1 do
                Graphics.Rectangle((CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right) + i * ((BarWidth - (#Statistics.Divider / Statistics.Divider[i].Width)) / (#Statistics.Divider + 1)) + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Divider[i].Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Statistics.Divider[i].Width, Statistics.Divider[i].Height, 0, 0, 0, 255)
            end
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

---@function StatisticPanelAdvanced
---@param Text string
---@param Percent number
---@param RGBA1 table<number, number, number>
---@param Percent2 number
---@param RGBA2 table<number, number, number>
---@param RGBA3 table<number, number, number>
---@param Index number
---@return nil
---@public
function Panels:StatisticPanelAdvanced(Text, Percent, RGBA1, Percent2, RGBA2, RGBA3, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then

            RGBA1 = RGBA1 or { 255, 255, 255, 255 }
            local BarWidth = Statistics.Bar.Width + CurrentMenu.WidthOffset * Statistics.Bar.OffsetRatio

            ---@type number
            Graphics.Rectangle(CurrentMenu.X, CurrentMenu.Y + Statistics.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), Statistics.Background.Width + CurrentMenu.WidthOffset, Statistics.Background.Height, 0, 0, 0, 170)
            Graphics.Text(Text or "", CurrentMenu.X + 8.0, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Statistics.Text.Left.Scale, 245, 245, 245, 255, 0)
            Graphics.Rectangle(CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, BarWidth, Statistics.Bar.Height, 87, 87, 87, 255)
            Graphics.Rectangle(CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent * BarWidth, Statistics.Bar.Height, RGBA1[1], RGBA1[2], RGBA1[3], RGBA1[4])
            RGBA2 = RGBA2 or { 0, 153, 204, 255 }
            RGBA3 = RGBA3 or { 185, 0, 0, 255 }

            if Percent2 and Percent2 > 0 then
                local X = CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset + Percent * BarWidth
                Graphics.Rectangle(X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent2 * BarWidth, Statistics.Bar.Height, RGBA2[1], RGBA2[2], RGBA2[3], RGBA2[4])
            elseif Percent2 and Percent2 < 0 then
                local X = CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset + Percent * BarWidth
                Graphics.Rectangle(X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent2 * BarWidth, Statistics.Bar.Height, RGBA3[1], RGBA3[2], RGBA3[3], RGBA3[4])
            end

            for i = 1, #Statistics.Divider, 1 do
                Graphics.Rectangle((CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right) + i * ((BarWidth - (#Statistics.Divider / Statistics.Divider[i].Width)) / (#Statistics.Divider + 1)) + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Divider[i].Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Statistics.Divider[i].Width, Statistics.Divider[i].Height, 0, 0, 0, 255)
            end

            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end
