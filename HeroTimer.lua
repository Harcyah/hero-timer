
local function DisplayWorldPvpStatus(id)
	local _, localizedName, isActive, _, startTime = GetWorldPVPAreaInfo(id)
	DEFAULT_CHAT_FRAME:AddMessage('[world pvp status] ' .. localizedName .. ' active ? ' .. tostring(isActive) .. ', ' .. SecondsToTime(startTime) .. ' seconds', 0.8, 0.8, 0.8);
end

local function UpdateWorldPvpStatus()
	local WINTERGRASP = 1;
	local TOLBARAD = 2;
	DisplayWorldPvpStatus(WINTERGRASP);
	DisplayWorldPvpStatus(TOLBARAD);
end

local eventFrame = CreateFrame('Frame', 'HeroTimerFrame', UIParent);
eventFrame:RegisterEvent('PLAYER_ENTERING_WORLD');

eventFrame:SetScript('OnEvent', function(self, event, ...)

	if (event == 'PLAYER_ENTERING_WORLD') then
		UpdateWorldPvpStatus();
	end

end)
