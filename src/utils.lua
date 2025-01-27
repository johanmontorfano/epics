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

-- Compose multiple lines of 80 charactes from the content of a string
function Compose_80_chars_lines(line)
    local lines = {}
    local sized_line = ""

    line = line .. " " .. " "
    for w in line:gmatch("(.-) ") do
        if string.len(sized_line) > 80 then
            table.insert(lines, sized_line)
            sized_line = ""
        end
        if string.len(sized_line) > 0 then
            sized_line = string.format("%s ", sized_line)
        end
        sized_line = string.format("%s%s", sized_line, w)
    end
    table.insert(lines, sized_line)
    return lines
end

function Bold(line, ...)
    return "\x1b[1m" .. string.format(line, ...) .. "\x1b[0m"
end

function Italic(line, ...)
    return "\x1b[3m" .. string.format(line, ...) .. "\x1b[0m"
end
