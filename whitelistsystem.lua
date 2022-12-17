local hwid = syn.crypt.hash(game:GetService("RbxAnalyticsService"):GetClientId(), data)
setclipboard(hwid)
local userid = syn.crypt.hash(game.Players.LocalPlayer.UserId, data)
local whitelisted = {"any whitelisted hwid"} -- put every whitelisted hwid here

for i, v in pairs(whitelisted) do
    if v == hwid then
        writefile("whiteliststatus.txt", syn.crypt.hash(
            "the current status of the user: whitelisted! whitelist security code: add a security code here so unwhitelisted ppl cant just hash this"))
    else
        writefile("whiteliststatus.txt", syn.crypt.hash("not whitelisted lol", data))
    end
end
for i, v in pairs(whitelisted) do
    if v == hwid and readfile("whiteliststatus.txt") == syn.crypt.hash(
        "the current status of the user: whitelisted! whitelist security code: add a security code here so unwhitelisted ppl cant just hash this",
        data) then
        -- change this if statement to your script. DM Kersh#0001 if you need help
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "awesome!",
            Text = "you are whitelisted!",
            Duration = 3

        })
    else

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "oops!",
            Text = "not whitelisted!",
            Duration = 3
        })
        writefile("whiteliststatus.txt",
            syn.crypt.hash("current status of the user: not whitelisted! this file has been hashed.", data))

    end
end
