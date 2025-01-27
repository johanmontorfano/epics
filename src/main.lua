require "src.utils"
require "src.errors"
require "modules.lua-yaml.yaml"

local docs_file = Read_file("docs/docs.yaml")
local docs = require("modules.lua-yaml.yaml").eval(docs_file);
local sections = Get_sections(docs)

local function print_guide(entry)
    local is_subsec = string.len(entry) == 4;
    local section = entry

    if is_subsec then
        section = string.sub(section, 0, 3)
        print(docs[section]["children"][entry]["title"])
        print(docs[section]["children"][entry]["content"])
    else
        print(docs[section]["title"])
    end
end

-- Checks if `cs_entry` is correcly formatted and an available entry. If it's 
-- the cast it returns it, otherwise the program stops.
local function load_cs_entry()
    local cs_entry = arg[1]

    if cs_entry ~= nil and Array_has(cs_entry, sections) then
        return cs_entry
    else
        Invalid_cs_entry()
    end
end

print_guide(load_cs_entry())
