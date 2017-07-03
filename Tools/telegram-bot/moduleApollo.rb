# encoding: utf-8

module Apollo
    Version = "1.0"
    def nameuri(name)
        2.times do
            name = URI::encode(name)
        end
        return name
    end

    module_function :nameuri
end
