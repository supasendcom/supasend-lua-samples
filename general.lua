--[[ 
  Run Lua code before request.

  Globals: 
    lead: Object of posted field data
    math: Do stuff with numbers
    string: Manipulate text
    
    Formats Available:
      create_timestamp(format, custom)
        format:
          iso8601  2025-01-16T05:03:13Z
          iso8601_with_offset          2025-01-15T23:03:13-0600
          iso8601_with_colon_offset    2025-01-15T23:03:13-0600
          iso_with_microseconds        2025-01-16 05:03:13.712047
          with_offset                  2025-01-15 23:03:13 -0600
          with_colon_offset            2025-01-15 23:03:13-0600
          epoch_seconds                1737003793
          epoch_milliseconds           1737003793712
          custom
        custom:
          %Y/%m/%d %H:%M:%S %z
--]]
(function()
    local key, default_value
    
    -- Rewrite Homeownership
    key = 'Homeowner'
    
    -- change this to the default buyer value
    default_value = "Own" 
    default_map_value = ""
    
    if safe_has(key, lead) == true then
        -- update the values on the right
        -- values on the left are our values
        -- values on the right are the buyer's expected values
        local map = {
           ["Yes"] = "",  -- change the values on the right
           ["No"] = "",
        }
        lead[key] = safe_map(safe_get(key, lead, default_value), map, default_map_value)
    end
    
    -- Rewrite Credit Rating
    key = 'CreditScore'
    
    -- change this to the default buyer value
    default_value = "Good" 
    
    if safe_has(key, lead) == true then
        -- update the values on the right
        -- values on the left are our values
        -- values on the right are the buyer's expected values
        local map = {
           ["Great"] = "",  -- change the values on the right
           ["Good"] = "",
           ["Poor"] = "",
        }
        lead[key] = safe_map(safe_get(key, lead), map, default_value)
    end
    
    -- Rewrite Project Type
    key = 'ProjectType'
    
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
           ["Not Sure"] = "",
        }
        lead[key] = safe_map(safe_get(key, lead), map, default_value)
    end
    
    -- Rewrite Project Type
    key = 'LeadType'
    
    -- change this to the default buyer value
    default_value = "" 
    
    if safe_has('.lead_type', lead) == true then
        -- update the values on the right
        -- values on the left are our values
        -- values on the right are the buyer's expected values
        local map = {
           ["HVAC"] = "HVAC",
           ["Home Security"] = "Security",
           ["Gutters"] = "Gutter",
           ["Windows"] = "Windows",
           ["Roofing"] = "Roofing",
        }
        lead[key] = safe_map(safe_get(key, lead), map, default_value)
    end
    
    
    -- Rewrite Project Type
    key = 'MobilePhone'
    
    -- change this to the default buyer value
    default_value = "" 
    
    if safe_has(key, lead) == true then
        local phone = safe_get(key, lead)
        lead[key] = "+1 " .. phone:sub(1, 3) .. " " .. phone:sub(4, 6) .. " " .. phone:sub(7, 10)
    end
    
    lead['now'] = create_timestamp('iso8601')
    return lead
end)()
