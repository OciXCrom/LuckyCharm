local mod = RegisterMod("Lucky Charm", 1)
local trinket = Isaac.GetTrinketIdByName("Lucky Charm")
local TRINKET_CHANCE = 2

function mod:OnPickupInit(entity)
	if entity.SubType == CoinSubType.COIN_PENNY or entity.SubType == CoinSubType. COIN_DOUBLEPACK then
		if Isaac.GetPlayer(0):HasTrinket(trinket) and GetChance(TRINKET_CHANCE) then
			local sprite = entity:GetSprite()

			if sprite:IsPlaying("Appear") or sprite:IsPlaying("AppearFast") then
				entity:Morph(entity.Type, entity.Variant, CoinSubType.COIN_LUCKYPENNY)
			end
		end
	end
end

function GetChance(chance)
	return math.random(1, 100) <= chance and true or false
end

mod:AddCallback(ModCallbacks.MC_POST_PICKUP_INIT, mod.OnPickupInit, PickupVariant.PICKUP_COIN)
