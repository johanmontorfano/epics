require "io"

-- Checks if `item` is present in `array`
function Array_has(item, array)
    for _, value in ipairs(array) do
        if value == item then
            return true
        end
    end
    return false
end

-- Reads a file
function Read_file(path)
    local file = io.open(path, "r")
    local content

    if not file then
        return nil
    end
    content = file:read("*a")
    file:close()
    return content
end

-- Returns all the sections of a document
function Get_sections(docs)
    local sections = {}

    for key, _ in pairs(docs) do
        table.insert(sections, key)
        if docs[key]["children"] ~= nil then
            for subkey, _ in pairs(docs[key]["children"]) do
                table.insert(sections, subkey)
            end
        end
    end
    return sections
end


