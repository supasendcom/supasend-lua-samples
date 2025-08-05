--[[ 
  Run Lua code before request.

  Globals: 
    lead: Object of posted field data
    math: Do stuff with numbers
    string: Manipulate text
    create_timestamp: Create timestamp
    
    Formats Available:
      create_timestamp(format, custom)
        format:
          iso8601                       2025-01-16T05:03:13Z
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
    
    -- Rewrite Roof Shade
    key = 'GutterServiceType'
    
    -- change this to the default buyer value
    default_value = "" 
    
    if safe_has(key, lead) == true then
        local service_type = safe_get(key, lead, default_value)
        
        -- update the values on the right
        -- values on the left are our values
        -- values on the right are the buyer's expected values
        local map = {
           ["Cleaning"] = "",  -- change the values on the right
           ["New Gutters"] = "",
           ["Gutter Guards"] = "",
           ["Gutter Repair"] = "",
        }
        lead[key] = safe_map(service_type, map, "")
        local map = {
           ["Cleaning"] = "",  -- change the values on the right
           ["New Gutters"] = "",
           ["Gutter Guards"] = "",
           ["Gutter Repair"] = "",
        }
        lead['GutterGuards'] = safe_map(service_type, map, "")
    end
    
    lead['now'] = create_timestamp('iso8601')
    return lead
end)()
