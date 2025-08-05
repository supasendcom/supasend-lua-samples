--[[ 
  Run Lua code before request.

  Globals: 
    lead: Object of posted field data
    math: Do stuff with numbers
    string: Manipulate text
--]]
(function()
    local key, default_value
    key = 'BathroomProjectType'
    
    -- change this to the default buyer value
    default_value = "Tub to Shower Conversion" 
    
    if safe_has(key, lead) == true then
        -- update the values on the right
        -- values on the left are our values
        -- values on the right are the buyer's expected values
        local map = {
           ["Full Bathroom Renovation"] = "",  -- change the values on the right
           ["Tub to Shower Conversion"] = "",
           ["Walk-in Bath Conversion"] = "",
           ["Walk-in Shower Remodel"] = "",
           ["Bath/Shower Updates"] = "",
        }
        lead['BathroomProjectType'] = safe_map(safe_get(key, lead), map, default_value)
    end
    
    lead['now'] = create_timestamp('iso8601')
    return lead
end)()
