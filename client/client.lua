local Core = exports.vorp_core:GetCore()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        
        local playerPed = PlayerPedId()
        local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, playerPed) 
        
        if holding and holding ~= 0 then
            Wait(3000)
            if not IsPedWalking(playerPed) then
                Citizen.InvokeNative(0xAE99FB955581844A,playerPed,10000,2)
                SetPedRagdollForceFall(playerPed)
                Core.NotifyRightTip("You can't run while carrying a body", 4000)
            end
        end
    end
end)
