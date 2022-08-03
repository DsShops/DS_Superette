ESX = nil  

Citizen.CreateThread(function()     
    while ESX == nil do         
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj 
    end)         
    Citizen.Wait(400)
    end 
end)

function Subtitle(text, time)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(time and math.ceil(time) or 0, true)
end

RMenu.Add("superette", "superette_main", RageUI.CreateMenu("Superette","By Shimey"))
RMenu:Get("superette", "superette_main").Closed = function()end

RMenu.Add("superette", "superette_bouf", RageUI.CreateSubMenu(RMenu:Get("superette", "superette_main"), "A Manger", nil))
RMenu:Get("superette", "superette_bouf").Closed = function()end

RMenu.Add("superette", "superette_glouglou", RageUI.CreateSubMenu(RMenu:Get("superette", "superette_main"), "A Boire", nil))
RMenu:Get("superette", "superette_glouglou").Closed = function()end

RMenu.Add("superette", "superette_chepo", RageUI.CreateSubMenu(RMenu:Get("superette", "superette_main"), "Diverse Choses", nil))
RMenu:Get("superette", "superette_chepo").Closed = function()end

Citizen.CreateThread(function()
            local gh = GetHashKey("a_m_m_prolhost_01")
            RequestModel(gh)
            while not HasModelLoaded(gh) do 
                Wait(1)
                RequestModel(gh)
            end
            for k,v in pairs (Superette.ltd) do
            local heading = GetEntityHeading(ped)
            local np = CreatePed(1, gh, v.pos, v.rotation, false, false)
            SetEntityInvincible(np, true)
            SetBlockingOfNonTemporaryEvents(np, true)
            Citizen.Wait(500)
            FreezeEntityPosition(np, true)

            if Superette.blip then
                local blip = AddBlipForCoord(v.pos)
                SetBlipSprite (blip, 52)
                SetBlipScale (blip, 1.0)
                SetBlipColour (blip, 2)
                SetBlipAsShortRange(blip, true)
            
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("LTD Shops")
                EndTextCommandSetBlipName(blip)
            end
        end

    while true do
        for k,v in pairs (Superette.ltd) do
                local interval = 1
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local dest = v.pos
                local distance = GetDistanceBetweenCoords(pos, dest, true)
            if distance > 90 then
                interval = 200
            else
                interval = 1
                if distance < 3.5 then
                    AddTextEntry("menu", "Appuiez sur ~INPUT_CONTEXT~ ~w~pour parler au monsieur")
                    DisplayHelpTextThisFrame("menu", false)
                    if IsControlJustPressed(1, 51) then
                    Subtitle("[~b~Domingo~s~] Bonjour Monsieur bienvenue a ~g~LTD Shops !", 3000)
                    Citizen.Wait(3000)
                    Subtitle("[~b~Domingo~s~] Vous avez le choix entre de la nourriture et plein d'autre choses !", 3000)
                    Citizen.Wait(3000)
                    Subtitle("[~b~Domingo~s~] Bref, Je vous laisse choisir ce dont vous avez besoin.", 3000)
                    Citizen.Wait(3000)
                    Subtitle("[~y~Vous~s~] Super Merci Beaucoup!", 3000)
                    Citizen.Wait(1500)
                    RageUI.Visible(RMenu:Get("superette", "superette_main"), true)
                    end
                end
            end
        end 
        Citizen.Wait(interval)    
    end
end)



local array = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30"
}


local arrayIndex = 1

local bouf = {
}

RegisterNetEvent("arnaquee")
AddEventHandler("arnaquee", function()
Subtitle("[~b~Domingo~s~] ~r~Exuser moi monsieur mais vous n'avais pas acces d'argent...", 3000)
Citizen.Wait(5000)
end)

RegisterNetEvent("niquele")
AddEventHandler("niquele", function()
Subtitle("[~b~Domingo~s~] ~y~Niquel y'a bien le compte je vous remet votre article et bonne journée ^^", 3000)
Citizen.Wait(5000)
end)

Citizen.CreateThread(function()
	while true do
        RageUI.IsVisible(RMenu:Get("superette", "superette_main"),true,true,true,function()
            RageUI.ButtonWithStyle("A Boire!", nil, {}, true,function(h,a,s)
            end, RMenu:Get("superette", "superette_glouglou"))
            RageUI.ButtonWithStyle("A Manger!", nil, {}, true,function(h,a,s)
            end, RMenu:Get("superette", "superette_bouf"))
            RageUI.ButtonWithStyle("Divers!", nil, {}, true,function(h,a,s)
            end, RMenu:Get("superette", "superette_chepo"))
        
        end, function()end, 1)



        RageUI.IsVisible(RMenu:Get("superette", "superette_bouf"),true,true,true,function()
                for k,v in pairs (Superette.Bouf) do
                    local tdc = arrayIndex * v.prix
                    local label = v.label
                    RageUI.List(v.name, array, arrayIndex, "~g~Prix : ~g~" ..tdc.."$", {}, true, function(h, a, s, i) arrayIndex = i
                        if s then
                                    local tdc = arrayIndex * v.prix
                                    local labelo = v.label
                                    local nom = v.name
                                    local beboushka = v.vocab
                                    Subtitle("[~y~Vous~s~] Euh Monsieur, Je souhaite acheter ~r~"..arrayIndex.." "..v.vocab.."~w~ svp", 3000)
                                    Citizen.Wait(3000)
                                    Subtitle("[~b~Domingo~s~] Super sa fera ~r~"..tdc.."$~w~ Je vous prie", 3000)
                                    Citizen.Wait(3000)
                                    Subtitle("[~y~Vous~s~] Tenez...", 3000)
                                    Citizen.Wait(3000)
                                    RageUI.CloseAll()
                                    TriggerServerEvent("achat", tdc, arrayIndex, labelo, beboushka)
                        end
                    end)
                end

        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("superette", "superette_glouglou"),true,true,true,function()
            for k,v in pairs (Superette.Liquide) do
                local tdc = arrayIndex * v.prix
                local label = v.label
                RageUI.List(v.name, array, arrayIndex, "~g~Prix : ~g~" ..tdc.."$", {}, true, function(h, a, s, i) arrayIndex = i
                    if s then
                                local tdc = arrayIndex * v.prix
                                local label = v.label
                                local nom = v.name
                                local beboushka = v.vocab
                                Subtitle("[~y~Vous~s~] Euh Monsieur, Je souhaite acheter ~r~"..arrayIndex.." "..v.vocab.." svp", 3000)
                                Citizen.Wait(3000)
                                Subtitle("[~b~Domingo~s~] Super sa fera ~r~"..tdc.."$~w~ Je vous prie", 3000)
                                Citizen.Wait(3000)
                                Subtitle("[~y~Vous~s~] Tenez...", 3000)
                                Citizen.Wait(3000)
                                RageUI.CloseAll()
                                TriggerServerEvent("achat", tdc, arrayIndex, label, beboushka)
                    end
                end)
            end

    end, function()end, 1)

    RageUI.IsVisible(RMenu:Get("superette", "superette_chepo"),true,true,true,function()
        for k,v in pairs (Superette.Divers) do
            local tdc = arrayIndex * v.prix
            local label = v.label
            RageUI.List(v.name, array, arrayIndex, "~g~Prix : ~g~" ..tdc.."$", {}, true, function(h, a, s, i) arrayIndex = i
                if s then
                            local tdc = arrayIndex * v.prix
                            local label = v.label
                            local nom = v.name
                            local beboushka = v.vocab
                            Subtitle("[~y~Vous~s~] Euh Monsieur, Je souhaite acheter ~r~"..arrayIndex.." "..v.vocab.." svp", 3000)
                            Citizen.Wait(3000)
                            Subtitle("[~b~Domingo~s~] Super sa fera ~r~"..tdc.."$~w~ Je vous prie", 3000)
                            Citizen.Wait(3000)
                            Subtitle("[~y~Vous~s~] Tenez...", 3000)
                            Citizen.Wait(3000)
                            RageUI.CloseAll()
                            TriggerServerEvent("achat", tdc, arrayIndex, label, beboushka)
                end
            end)
        end

    end, function()end, 1)

        Citizen.Wait(1)
    end
end)