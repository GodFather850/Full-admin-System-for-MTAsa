function addWarning(player, text, type)
	if (player and text and type) then
		triggerClientEvent(player, 'addWarning', player, text, type);
	end
end