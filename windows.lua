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
    
    -- Rewrite Window Count
    key = 'WindowCount'
    
    -- change this to the default buyer value
    default_value = "6 - 9" 
    
    if safe_has(key, lead) == true then
        -- update the values on the right
        -- values on the left are our values
        -- values on the right are the buyer's expected values
        local map = {
           ["1 - 2"] = "",  -- change the values on the right
           ["3 - 5"] = "",
           ["6 - 9"] = "",
           ["10+"] = "",
           ["Not Sure"] = "",
        }
        lead[key] = safe_map(safe_get(key, lead), map, default_value)
    end
    
    -- Rewrite Window Project Type
    key = 'WindowProjectType'
    
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
    lead['now'] = create_timestamp('iso8601')
    return lead
end)()
