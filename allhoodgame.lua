
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera


local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")


local function createNotificationGui()
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    
    if playerGui:FindFirstChild("NotificationSystem") then
        return playerGui.NotificationSystem
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NotificationSystem"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui
    
    return screenGui
end


local function createNotificationSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9086208694" -- صوت ديسكورد
    sound.Volume = 0.8
    sound.Parent = workspace
    return sound
end


local function showNotificationWithSound(title, message, duration)
    duration = duration or 5

    local screenGui = createNotificationGui()

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 350, 0, 0)
    frame.Position = UDim2.new(1, 10, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

    local titleLabel = Instance.new("TextLabel", frame)
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 16
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local msgLabel = Instance.new("TextLabel", frame)
    msgLabel.Size = UDim2.new(1, -20, 0, 40)
    msgLabel.Position = UDim2.new(0, 10, 0, 40)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = Color3.fromRGB(185, 187, 190)
    msgLabel.TextSize = 14
    msgLabel.Font = Enum.Font.Gotham
    msgLabel.TextWrapped = true
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left

    local signature = Instance.new("TextLabel", frame)
    signature.Size = UDim2.new(1, -20, 0, 15)
    signature.Position = UDim2.new(0, 10, 1, -25)
    signature.BackgroundTransparency = 1
    signature.Text = "Made by aldble • discord"
    signature.TextColor3 = Color3.fromRGB(114, 137, 218)
    signature.TextSize = 13
    signature.Font = Enum.Font.GothamBold
    signature.TextXAlignment = Enum.TextXAlignment.Center

    local sound = createNotificationSound()
    sound:Play()

    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 350, 0, 100),
        Position = UDim2.new(1, -360, 0, 20)
    }):Play()

    task.wait(duration)

    TweenService:Create(frame, TweenInfo.new(0.5), {
        Position = UDim2.new(1, 10, 0, 20),
        BackgroundTransparency = 1
    }):Play()
    TweenService:Create(titleLabel, TweenInfo.new(0.5), { TextTransparency = 1 }):Play()
    TweenService:Create(msgLabel, TweenInfo.new(0.5), { TextTransparency = 1 }):Play()
    TweenService:Create(signature, TweenInfo.new(0.5), { TextTransparency = 1 }):Play()

    task.delay(0.5, function()
        frame:Destroy()
        sound:Destroy()
    end)
end



task.wait(1)

showNotificationWithSound("Welcome!", "The script has been successfully loaded!", 5)

-- نظام اللغة
local isArabic = nil 
local Translations = {
    Arabic = {
        Title = "⚠️ TRIGGER BOT - ",
        Warning = "made by aldble",
        StatusDisabled = "الحالة: معطّل",
        StatusEnabled = "الحالة: مفعّل ⚠️",
        StatusShooting = "🎯 إطلاق #%d على: %s",
        StatusNoTool = "⚠️ لا توجد أداة مجهزة",
        ToggleEnable = " تفعيل",
        SliderDistance = "المسافة القصوى",
        SliderFOV = "مجال الرؤية (FOV)",
        SliderDelay = "التأخير (ms)",
        LanguageButton = "EN",
        ShotsCount = "طلقات: "
    },
    English = {
        Title = "⚠️ TRIGGER BOT - ",
        Warning = "made by aldble",
        StatusDisabled = "Status: Disabled",
        StatusEnabled = "Status: Enabled ⚠️",
        StatusShooting = "🎯 Shot #%d at: %s",
        StatusNoTool = "⚠️ No tool equipped",
        ToggleEnable = "Enable ",
        SliderDistance = "Max Distance",
        SliderFOV = "Field of View (FOV)",
        SliderDelay = "Delay (ms)",
        LanguageButton = "ع",
        ShotsCount = "Shots: "
    }
}

local function getText(key)
    return isArabic and Translations.Arabic[key] or Translations.English[key]
end

-- إنشاء الـ GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TriggerBotEducational"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- ============================
-- شاشة اختيار اللغة
-- ============================
local LanguageSelectionFrame = Instance.new("Frame")
LanguageSelectionFrame.Name = "LanguageSelection"
LanguageSelectionFrame.Size = UDim2.new(0, 0, 0, 0) -- نبدأ من صفر
LanguageSelectionFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
LanguageSelectionFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LanguageSelectionFrame.BorderSizePixel = 0
LanguageSelectionFrame.BackgroundTransparency = 1 -- شفاف في البداية
LanguageSelectionFrame.Parent = ScreenGui

local LangSelCorner = Instance.new("UICorner")
LangSelCorner.CornerRadius = UDim.new(0, 12)
LangSelCorner.Parent = LanguageSelectionFrame

-- Shadow
local LangShadow = Instance.new("ImageLabel")
LangShadow.Name = "Shadow"
LangShadow.BackgroundTransparency = 1
LangShadow.Position = UDim2.new(0, -15, 0, -15)
LangShadow.Size = UDim2.new(1, 30, 1, 30)
LangShadow.ZIndex = -1
LangShadow.Image = "rbxasset://textures/ui/Shadow.png"
LangShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
LangShadow.ImageTransparency = 1 -- شفاف في البداية
LangShadow.ScaleType = Enum.ScaleType.Slice
LangShadow.SliceCenter = Rect.new(10, 10, 118, 118)
LangShadow.Parent = LanguageSelectionFrame

-- Border
local LangBorder = Instance.new("Frame")
LangBorder.Size = UDim2.new(1, 0, 0, 2)
LangBorder.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
LangBorder.BorderSizePixel = 0
LangBorder.BackgroundTransparency = 1 -- شفاف في البداية
LangBorder.Parent = LanguageSelectionFrame

local LangBorderGradient = Instance.new("UIGradient")
LangBorderGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 150, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 50, 50))
}
LangBorderGradient.Parent = LangBorder

-- تأثير الوميض على البوردر
task.spawn(function()
    while LanguageSelectionFrame and LanguageSelectionFrame.Parent do
        for i = 0, 1, 0.05 do
            if not LangBorderGradient or not LangBorderGradient.Parent then break end
            LangBorderGradient.Offset = Vector2.new(i, 0)
            task.wait(0.03)
        end
    end
end)

-- Title
local LangTitle = Instance.new("TextLabel")
LangTitle.Size = UDim2.new(1, -40, 0, 60)
LangTitle.Position = UDim2.new(0, 20, 0, 30)
LangTitle.BackgroundTransparency = 1
LangTitle.Text = "🌐"
LangTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LangTitle.TextSize = 48
LangTitle.Font = Enum.Font.GothamBold
LangTitle.TextTransparency = 1 -- شفاف في البداية
LangTitle.Parent = LanguageSelectionFrame

-- Subtitle
local LangSubtitle = Instance.new("TextLabel")
LangSubtitle.Size = UDim2.new(1, -40, 0, 40)
LangSubtitle.Position = UDim2.new(0, 20, 0, 90)
LangSubtitle.BackgroundTransparency = 1
LangSubtitle.Text = "Select Language | اختر اللغة"
LangSubtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
LangSubtitle.TextSize = 18
LangSubtitle.Font = Enum.Font.GothamMedium
LangSubtitle.TextTransparency = 1 -- شفاف في البداية
LangSubtitle.Parent = LanguageSelectionFrame

-- زر العربي
local ArabicButton = Instance.new("TextButton")
ArabicButton.Size = UDim2.new(0, 160, 0, 60)
ArabicButton.Position = UDim2.new(0.5, -170, 0, 160)
ArabicButton.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
ArabicButton.Text = "🇸🇦 العربية"
ArabicButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ArabicButton.TextSize = 20
ArabicButton.Font = Enum.Font.GothamBold
ArabicButton.BackgroundTransparency = 1 -- شفاف في البداية
ArabicButton.TextTransparency = 1 -- شفاف في البداية
ArabicButton.Parent = LanguageSelectionFrame

local ArabicCorner = Instance.new("UICorner")
ArabicCorner.CornerRadius = UDim.new(0, 10)
ArabicCorner.Parent = ArabicButton

-- زر الإنجليزي
local EnglishButton = Instance.new("TextButton")
EnglishButton.Size = UDim2.new(0, 160, 0, 60)
EnglishButton.Position = UDim2.new(0.5, 10, 0, 160)
EnglishButton.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
EnglishButton.Text = "🇺🇸 English"
EnglishButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EnglishButton.TextSize = 20
EnglishButton.Font = Enum.Font.GothamBold
EnglishButton.BackgroundTransparency = 1 -- شفاف في البداية
EnglishButton.TextTransparency = 1 -- شفاف في البداية
EnglishButton.Parent = LanguageSelectionFrame

local EnglishCorner = Instance.new("UICorner")
EnglishCorner.CornerRadius = UDim.new(0, 10)
EnglishCorner.Parent = EnglishButton

-- تأثير الظهور الأنيق مع وميض
task.spawn(function()
    task.wait(0.1) -- انتظار صغير
    
    -- تأثير الظهور
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    
    -- تكبير الإطار
    local sizeTween = TweenService:Create(
        LanguageSelectionFrame,
        tweenInfo,
        {Size = UDim2.new(0, 400, 0, 300)}
    )
    
    -- إظهار الخلفية
    local bgTween = TweenService:Create(
        LanguageSelectionFrame,
        TweenInfo.new(0.3),
        {BackgroundTransparency = 0}
    )
    
    -- إظهار الظل
    local shadowTween = TweenService:Create(
        LangShadow,
        TweenInfo.new(0.3),
        {ImageTransparency = 0.5}
    )
    
    -- إظهار البوردر
    local borderTween = TweenService:Create(
        LangBorder,
        TweenInfo.new(0.3),
        {BackgroundTransparency = 0}
    )
    
    sizeTween:Play()
    bgTween:Play()
    shadowTween:Play()
    borderTween:Play()
    
    -- انتظار نصف ثانية ثم إظهار المحتوى
    task.wait(0.3)
    
    -- إظهار الأيقونة مع تأثير bounce
    local titleTween = TweenService:Create(
        LangTitle,
        TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
        {TextTransparency = 0}
    )
    titleTween:Play()
    
    task.wait(0.15)
    
    -- إظهار النص
    local subtitleTween = TweenService:Create(
        LangSubtitle,
        TweenInfo.new(0.3),
        {TextTransparency = 0}
    )
    subtitleTween:Play()
    
    task.wait(0.15)
    
    -- إظهار الأزرار مع تأثير من الجانبين
    local arabicTweenBg = TweenService:Create(
        ArabicButton,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0}
    )
    local arabicTweenText = TweenService:Create(
        ArabicButton,
        TweenInfo.new(0.3),
        {TextTransparency = 0}
    )
    
    local englishTweenBg = TweenService:Create(
        EnglishButton,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0}
    )
    local englishTweenText = TweenService:Create(
        EnglishButton,
        TweenInfo.new(0.3),
        {TextTransparency = 0}
    )
    
    arabicTweenBg:Play()
    arabicTweenText:Play()
    englishTweenBg:Play()
    englishTweenText:Play()
    
    -- تأثير وميض على الأزرار
    task.wait(0.3)
    for i = 1, 3 do
        local pulseTween1 = TweenService:Create(
            ArabicButton,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(70, 170, 255)}
        )
        local pulseTween2 = TweenService:Create(
            EnglishButton,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(70, 220, 120)}
        )
        pulseTween1:Play()
        pulseTween2:Play()
        
        task.wait(0.4)
        
        local reverseTween1 = TweenService:Create(
            ArabicButton,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(50, 150, 255)}
        )
        local reverseTween2 = TweenService:Create(
            EnglishButton,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(50, 200, 100)}
        )
        reverseTween1:Play()
        reverseTween2:Play()
        
        task.wait(0.4)
    end
end)

-- تأثيرات عند التحويم
local function addHoverEffect(button, originalColor, hoverColor)
    button.MouseEnter:Connect(function()
        local tween = TweenService:Create(
            button,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad),
            {BackgroundColor3 = hoverColor}
        )
        tween:Play()
    end)
    
    button.MouseLeave:Connect(function()
        local tween = TweenService:Create(
            button,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad),
            {BackgroundColor3 = originalColor}
        )
        tween:Play()
    end)
end

addHoverEffect(ArabicButton, Color3.fromRGB(50, 150, 255), Color3.fromRGB(70, 170, 255))
addHoverEffect(EnglishButton, Color3.fromRGB(50, 200, 100), Color3.fromRGB(70, 220, 120))

-- ============================
-- الواجهة الرئيسية (مخفية في البداية)
-- ============================

-- زر الفتح/الإغلاق (Toggle Button)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0, 20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "⚙️"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 28
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Parent = ScreenGui
ToggleButton.ZIndex = 10
ToggleButton.Visible = false

local ToggleButtonCorner = Instance.new("UICorner")
ToggleButtonCorner.CornerRadius = UDim.new(0, 15)
ToggleButtonCorner.Parent = ToggleButton

local ToggleButtonShadow = Instance.new("ImageLabel")
ToggleButtonShadow.Name = "Shadow"
ToggleButtonShadow.BackgroundTransparency = 1
ToggleButtonShadow.Position = UDim2.new(0, -10, 0, -10)
ToggleButtonShadow.Size = UDim2.new(1, 20, 1, 20)
ToggleButtonShadow.ZIndex = 9
ToggleButtonShadow.Image = "rbxasset://textures/ui/Shadow.png"
ToggleButtonShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
ToggleButtonShadow.ImageTransparency = 0.5
ToggleButtonShadow.ScaleType = Enum.ScaleType.Slice
ToggleButtonShadow.SliceCenter = Rect.new(10, 10, 118, 118)
ToggleButtonShadow.Parent = ToggleButton

-- الإطار الرئيسي
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
MainFrame.Visible = false

-- حالة الـ GUI
local isOpen = false

-- دالة فتح/إغلاق الـ GUI
local function toggleGUI()
    isOpen = not isOpen
    
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    if isOpen then
        ToggleButton.Visible = false
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        
        local openTween = TweenService:Create(
            MainFrame,
            tweenInfo,
            {Size = UDim2.new(0, 400, 0, 500)}
        )
        openTween:Play()
    else
        local closeTween = TweenService:Create(
            MainFrame,
            tweenInfo,
            {Size = UDim2.new(0, 0, 0, 0)}
        )
        closeTween:Play()
        closeTween.Completed:Connect(function()
            MainFrame.Visible = false
            ToggleButton.Visible = true
        end)
    end
end

ToggleButton.Activated:Connect(function()
    print("✅ Toggle button activated!")
    toggleGUI()
end)

-- تأثير الظل
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.ZIndex = -1
Shadow.Image = "rbxasset://textures/ui/Shadow.png"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Parent = MainFrame

-- الحواف المضيئة
local TopBorder = Instance.new("Frame")
TopBorder.Size = UDim2.new(1, 0, 0, 2)
TopBorder.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
TopBorder.BorderSizePixel = 0
TopBorder.Parent = MainFrame

local BorderGradient = Instance.new("UIGradient")
BorderGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 150, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 50, 50))
}
BorderGradient.Parent = TopBorder

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- العنوان
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -100, 0, 50)
Title.Position = UDim2.new(0, 20, 0, 15)
Title.BackgroundTransparency = 1
Title.Text = ""
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

-- زر تغيير اللغة
local LanguageButton = Instance.new("TextButton")
LanguageButton.Size = UDim2.new(0, 45, 0, 35)
LanguageButton.Position = UDim2.new(1, -90, 0, 15)
LanguageButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
LanguageButton.Text = ""
LanguageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LanguageButton.TextSize = 16
LanguageButton.Font = Enum.Font.GothamBold
LanguageButton.Parent = MainFrame

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 8)
LangCorner.Parent = LanguageButton

-- زر الإغلاق
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(1, -45, 0, 15)
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 22
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

CloseButton.Activated:Connect(function()
    print("✅ Close button activated!")
    toggleGUI()
end)

-- التحذير
local Warning = Instance.new("TextLabel")
Warning.Size = UDim2.new(1, -40, 0, 40)
Warning.Position = UDim2.new(0, 20, 0, 60)
Warning.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Warning.Text = ""
Warning.TextColor3 = Color3.fromRGB(255, 100, 100)
Warning.TextSize = 12
Warning.Font = Enum.Font.Gotham
Warning.TextWrapped = true
Warning.Parent = MainFrame

local WarningCorner = Instance.new("UICorner")
WarningCorner.CornerRadius = UDim.new(0, 8)
WarningCorner.Parent = Warning

-- حاوية الإعدادات
local SettingsFrame = Instance.new("ScrollingFrame")
SettingsFrame.Size = UDim2.new(1, -40, 1, -180)
SettingsFrame.Position = UDim2.new(0, 20, 0, 120)
SettingsFrame.BackgroundTransparency = 1
SettingsFrame.BorderSizePixel = 0
SettingsFrame.ScrollBarThickness = 4
SettingsFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)
SettingsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
SettingsFrame.Parent = MainFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 10)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Parent = SettingsFrame

ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    SettingsFrame.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 10)
end)

-- معلومات الحالة
local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.new(1, -40, 0, 50)
StatusFrame.Position = UDim2.new(0, 20, 1, -70)
StatusFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
StatusFrame.BorderSizePixel = 0
StatusFrame.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 8)
StatusCorner.Parent = StatusFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -20, 1, 0)
StatusLabel.Position = UDim2.new(0, 10, 0, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusLabel.TextSize = 13
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = StatusFrame

-- الإعدادات
local Config = {
    Enabled = false,
    MaxDistance = 100,
    FOV = 90,
    TriggerDelay = 0.1,
}

-- حفظ العناصر لتحديث اللغة
local toggleItems = {}
local sliderItems = {}

-- دالة لتحديث اللغة
local function updateLanguage()
    Title.Text = getText("Title")
    Warning.Text = getText("Warning")
    StatusLabel.Text = Config.Enabled and getText("StatusEnabled") or getText("StatusDisabled")
    StatusLabel.TextColor3 = Config.Enabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(180, 180, 180)
    LanguageButton.Text = getText("LanguageButton")
    
    for _, item in pairs(toggleItems) do
        item.label.Text = getText(item.key)
    end
    
    for _, item in pairs(sliderItems) do
        item.label.Text = getText(item.key)
    end
end

-- ربط زر اللغة
LanguageButton.Activated:Connect(function()
    isArabic = not isArabic
    print("✅ Language changed to:", isArabic and "Arabic" or "English")
    updateLanguage()
end)

-- دالة لإنشاء Toggle
local function createToggle(translationKey, defaultValue, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, 0, 0, 50)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = SettingsFrame
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 8)
    ToggleCorner.Parent = ToggleFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = getText(translationKey)
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.TextSize = 14
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = ToggleFrame
    
    table.insert(toggleItems, {label = Label, key = translationKey})
    
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 50, 0, 26)
    ToggleBtn.Position = UDim2.new(1, -60, 0.5, -13)
    ToggleBtn.BackgroundColor3 = defaultValue and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(60, 60, 60)
    ToggleBtn.Text = ""
    ToggleBtn.Parent = ToggleFrame
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(1, 0)
    ButtonCorner.Parent = ToggleBtn
    
    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 20, 0, 20)
    Circle.Position = defaultValue and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
    Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Circle.BorderSizePixel = 0
    Circle.Parent = ToggleBtn
    
    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = Circle
    
    local toggled = defaultValue
    
    ToggleBtn.Activated:Connect(function()
        toggled = not toggled
        print("✅ Toggle clicked:", translationKey, "=", toggled)
        
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        
        local colorTween = TweenService:Create(
            ToggleBtn,
            tweenInfo,
            {BackgroundColor3 = toggled and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(60, 60, 60)}
        )
        
        local positionTween = TweenService:Create(
            Circle,
            tweenInfo,
            {Position = toggled and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)}
        )
        
        colorTween:Play()
        positionTween:Play()
        
        callback(toggled)
    end)
    
    return toggled
end

-- دالة لإنشاء Slider
local function createSlider(translationKey, min, max, defaultValue, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, 0, 0, 60)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = SettingsFrame
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 8)
    SliderCorner.Parent = SliderFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -30, 0, 20)
    Label.Position = UDim2.new(0, 15, 0, 8)
    Label.BackgroundTransparency = 1
    Label.Text = getText(translationKey)
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = SliderFrame
    
    table.insert(sliderItems, {label = Label, key = translationKey})
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0, 60, 0, 20)
    ValueLabel.Position = UDim2.new(1, -70, 0, 8)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(defaultValue)
    ValueLabel.TextColor3 = Color3.fromRGB(255, 150, 50)
    ValueLabel.TextSize = 13
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = SliderFrame
    
    local SliderBar = Instance.new("Frame")
    SliderBar.Size = UDim2.new(1, -30, 0, 6)
    SliderBar.Position = UDim2.new(0, 15, 1, -18)
    SliderBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SliderBar.BorderSizePixel = 0
    SliderBar.Parent = SliderFrame
    
    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = SliderBar
    
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((defaultValue - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    Fill.BorderSizePixel = 0
    Fill.Parent = SliderBar
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = Fill
    
    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 14, 0, 14)
    Knob.Position = UDim2.new((defaultValue - min) / (max - min), -7, 0.5, -7)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.BorderSizePixel = 0
    Knob.Parent = SliderBar
    
    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob
    
    local dragging = false
    
    local function updateValue(inputPosition)
        local pos = (inputPosition.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X
        pos = math.clamp(pos, 0, 1)
        
        local value = math.floor(min + (max - min) * pos)
        
        Fill.Size = UDim2.new(pos, 0, 1, 0)
        Knob.Position = UDim2.new(pos, -7, 0.5, -7)
        ValueLabel.Text = tostring(value)
        
        callback(value)
    end
    
    SliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateValue(input.Position)
        end
    end)
    
    SliderBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging then
            if input.UserInputType == Enum.UserInputType.MouseMovement or 
               input.UserInputType == Enum.UserInputType.Touch then
                updateValue(input.Position)
            end
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- دالة لبدء الواجهة الرئيسية
local function startMainGUI()
    -- إنشاء الـ Toggles والـ Sliders
    createToggle("ToggleEnable", false, function(value)
        Config.Enabled = value
        StatusLabel.Text = value and getText("StatusEnabled") or getText("StatusDisabled")
        StatusLabel.TextColor3 = value and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(180, 180, 180)
        print("✅ Enabled:", value)
    end)

    createSlider("SliderDistance", 50, 500, 100, function(value)
        Config.MaxDistance = value
        print("✅ Max Distance:", value)
    end)

    createSlider("SliderFOV", 5, 90, 15, function(value)
        Config.FOV = value
        print("✅ FOV:", value)
    end)

    createSlider("SliderDelay", 10, 500, 100, function(value)
        Config.TriggerDelay = value / 1000
        print("✅ Delay:", value, "ms")
    end)

    -- تحديث جميع النصوص
    updateLanguage()
    
    -- إظهار الواجهة الرئيسية
    MainFrame.Visible = true
    isOpen = true
    
    -- الوظائف التعليمية
    local function getTargetUnderCrosshair()
        local viewportSize = Camera.ViewportSize
        local screenCenter = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
        
        local unitRay = Camera:ViewportPointToRay(screenCenter.X, screenCenter.Y)
        
        local rayParams = RaycastParams.new()
        rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
        rayParams.FilterType = Enum.RaycastFilterType.Blacklist
        
        local rayResult = workspace:Raycast(unitRay.Origin, unitRay.Direction * Config.MaxDistance, rayParams)
        
        if not rayResult then return nil end
        
        local hit = rayResult.Instance
        local targetPlayer = nil
        
        local currentPart = hit
        for i = 1, 10 do
            if not currentPart then break end
            
            local humanoid = currentPart:FindFirstChild("Humanoid")
            if humanoid then
                for _, player in pairs(Players:GetPlayers()) do
                    if player.Character == currentPart and player ~= LocalPlayer then
                        targetPlayer = player
                        break
                    end
                end
                break
            end
            currentPart = currentPart.Parent
        end
        
        if not targetPlayer then return nil end
        
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not humanoid or humanoid.Health <= 0 then return nil end
        
        return targetPlayer
    end

    local function activateTool()
        local character = LocalPlayer.Character
        if not character then return false end
        
        local tool = character:FindFirstChildOfClass("Tool")
        if tool then
            tool:Activate()
            return true
        end
        return false
    end

    -- الحلقة الرئيسية
    local lastTriggerTime = 0
    local shotCount = 0

    RunService.RenderStepped:Connect(function()
        if not Config.Enabled then return end
        
        local currentTime = tick()
        
        if (currentTime - lastTriggerTime) < Config.TriggerDelay then 
            return 
        end
        
        local target = getTargetUnderCrosshair()
        
        if target then
            local success = activateTool()
            
            if success then
                shotCount = shotCount + 1
                lastTriggerTime = currentTime
                
                StatusLabel.Text = string.format(getText("StatusShooting"), shotCount, target.Name)
                StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                
                print("🎯 Shot fired at:", target.Name)
                
                task.spawn(function()
                    task.wait(0.15)
                    if Config.Enabled then
                        StatusLabel.Text = getText("StatusEnabled") .. " | " .. getText("ShotsCount") .. shotCount
                        StatusLabel.TextColor3 = Color3.fromRGB(50, 255, 50)
                    end
                end)
            else
                StatusLabel.Text = getText("StatusNoTool")
                StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 50)
            end
        end
    end)
end

-- ربط أزرار اختيار اللغة
ArabicButton.Activated:Connect(function()
    print("✅ Arabic selected")
    isArabic = true
    
    -- تأثير الاختفاء
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local tween = TweenService:Create(
        LanguageSelectionFrame,
        tweenInfo,
        {Size = UDim2.new(0, 0, 0, 0)}
    )
    tween:Play()
    
    tween.Completed:Connect(function()
        LanguageSelectionFrame:Destroy()
        startMainGUI()
    end)
end)

EnglishButton.Activated:Connect(function()
    print("✅ English selected")
    isArabic = false
    
    -- تأثير الاختفاء
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local tween = TweenService:Create(
        LanguageSelectionFrame,
        tweenInfo,
        {Size = UDim2.new(0, 0, 0, 0)}
    )
    tween:Play()
    
    tween.Completed:Connect(function()
        LanguageSelectionFrame:Destroy()
        startMainGUI()
    end)
end)

print("🌐 اختر اللغة | Select Language")
print("⚠️ تم صنعه من قبل aldble في ديسكورد!")
print("⚠️ It was made by aldble in discord!")
