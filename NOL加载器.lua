



local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "小西 | 免费版",
    Footer = "加载器",
    Icon = "moon",
    NotifySide = "Right",
    ShowCustomCursor = true,
    AutoShow = true,
    Resizable = true,
    Center = true,
    TabPadding = 2,
    MenuFadeTime = 0.5,
    Position = UDim2.fromOffset(6, 6),
    Size = UDim2.fromOffset(620, 600),
    IconSize = UDim2.fromOffset(50, 50)
})

local Tabs = {    
    Main = Window:AddTab("选择需要执行的服务器", "house"),
    ["UI Settings"] = Window:AddTab("UI调试", "settings"),
}

local Tab = Tabs.Main:AddLeftGroupbox('服务器')

local Server = loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/%E6%B2%99%E8%84%9A%E6%9C%AC%E6%BA%90%E7%A0%81.lua"))()

for Name, Link in next, Server do
    Tab:AddButton({
        Text = Name,
        Func = function()
            loadstring(game:HttpGet(Link))()  
            Library:Unload()  
        end,
        DoubleClick = false,
        Tooltip = '打开 NOL ' .. Name .. '脚本'
    })
end


local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("调试功能")



local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox('菜单')
MenuGroup:AddButton("删除UI", function()
    Library:Unload()  
end)
