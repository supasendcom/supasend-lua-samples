--[[ 
  Run Lua code before request.

  Globals: 
    lead: Object of posted field data
    math: Do stuff with numbers
    string: Manipulate text
--]]
(function()
    local key, default_value
    
    -- Rewrite Homeownership
    key = 'HvacProjectType'
    
    -- change this to the default buyer value
    default_value = "Replace" 
    
    if safe_has(key, lead) == true then
        -- update the values on the right
        -- values on the left are our values
        -- values on the right are the buyer's expected values
        local map = {
           ["Replace"] = "",  -- change the values on the right
           ["Install"] = "",
           ["Repair"] = "",
        }
        lead['AirSubType'] = safe_map(safe_get(key, lead), map, default_value)
    end
    
    -- Rewrite Homeownership
    key = 'HvacAirType'
    
    -- change this to the default buyer value
    default_value = "Both" 
    
    if safe_has(key, lead) == true then
        -- update the values on the right
        -- values on the left are our values
        -- values on the right are the buyer's expected values
        local map = {
           ["Heating"] = "",  -- change the values on the right
           ["Cooling"] = "",
           ["Both"] = "",
        }
        lead[key] = safe_map(safe_get(key, lead), map, default_value)
    end
    
    -- Rewrite Homeownership
    key = 'HvacSystemPower'
    
    -- change this to the default buyer value
    default_value = "Both" 
    
    if safe_has(key, lead) == true then
        -- update the values on the right
        -- values on the left are our values
        -- values on the right are the buyer's expected values
        local map = {
           ["Natural Gas"] = "",  -- change the values on the right
           ["Electric"] = "",
           ["Oil"] = "",
           ["Propane"] = "",
           ["Not Sure"] = "",
        }
        lead[key] = safe_map(safe_get(key, lead), map, default_value)
    end
    
    -- Rewrite Homeownership
    key = 'HvacSystem'
    
    -- change this to the default buyer value
    default_value = "Both" 
    
    if safe_has(key, lead) == true then
        -- update the values on the right
        -- values on the left are our values
        -- values on the right are the buyer's expected values
        local map = {
           ["Central Heating / Furnace"] = "",  -- change the values on the right
           ["Heat Pump"] = "",
           ["Boiler / Radiator"] = "",
           ["Air Conditioner"] = "",
           ["Not Sure"] = "",
        }
        lead[key] = safe_map(safe_get(key, lead), map, default_value)
    end
    
    lead['now'] = create_timestamp('iso8601')
    return lead
end)()
