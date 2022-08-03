ESX = nil
print("^4Shimey Devlopement ^7")
print("^4DS_Superette Initialized! ^7")

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent("achat")
AddEventHandler("achat", function(cbnfric, cbn, iteme, quoifeur)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local nom = GetPlayerName(source)
    local PlayerMoney = xPlayer.getMoney()

    if PlayerMoney >= cbnfric then
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local quoifeur = quoifeur
        
        xPlayer.removeMoney(cbnfric)
        local nom = GetPlayerName(source)
        xPlayer.addInventoryItem(iteme, cbn)
        print("Le Joueur "..nom.." a acheter "..cbn.." "..quoifeur.." Pour "..cbnfric.."$")
        TriggerClientEvent("niquele", source) 
    else
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        local nom = GetPlayerName(source)
        TriggerClientEvent("arnaquee", source)  
        print(""..nom.." a essayer de m'arnquer une "..iteme.."...")
    end
end)
