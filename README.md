# shyStress
STANDALONE | FiveM Stress System<br>

Very simple & easy stress system for your roleplay server.<br>

# Usage:
<b>Triggers:</b> <br>
- "shyStress:AddStress" - This trigger adds stress to a client.<br>
- "shyStress:RelieveStress" This trigger removes stress from a client.<br>
- "shyStress:devmode" This trigger toggles devmode for specified client, making them immune to stress.<br>

<b>Explained</b> <br>
- Triggers listed above are client sided. Trigger from server with TriggerClientEvent("shyStress:AddStress", source, stress), or from client with TriggerEvent("shyStress:AddStress", stress)<br> 
- Stress levels are factored in 3 stages. Level 1 (0-4000), level 2 (4001 - 7000), and level 3 (7001+). Change values based on your needs.<br>
- The stress is expressed to the client via blurring their screen for a brief moment.

Feel free to recommend me changes. <br>