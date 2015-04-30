class Phone
  attr_reader(:area_code, :number, :type)
  @@phone = []

  define_method(:initialize) do |area_code, number, type|
    @area_code = area_code
    @number = number
    @type = type
  end

  define_singleton_method(:all) do
    @@phone
  end

  define_method(:save) do
    @@phone.push(self)
  end

  define_singleton_method(:clear) do
    @@phone = []
  end
  
  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |phone_info|
    found_phone = nil
    @@phone.each() do |number|
      if number.id().eql?(phone_info.to_i())
        found_phone = number
      end
    end
    found_phone
  end

end
