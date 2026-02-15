function addNotification(sourceElement, msg, type)
    triggerClientEvent(sourceElement, "addNotification", sourceElement, msg, type)
end
addEvent("addNotification", true)
addEventHandler("addNotification", root, addNotification)