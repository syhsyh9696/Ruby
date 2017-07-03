# encoding: utf-8

def serialport_command()
    result = ""
    File.open("COM6","w+") do |sp|
        while char = sp.read(1)
            result += char
            break if result.upcase.include?("ENDEND")
        end
    end
    result
end

p serialport_command
