class Contact
  attr_reader(:name, :number, :email)
  @@contacts = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @number = attributes.fetch(:number)
    @email = attributes.fetch(:email)
    @id = @@contacts.length().+(1)
  end

  define_singleton_method(:all) do
   @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |contact_info|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(contact_info.to_i())
        found_contact = contact
      end
    end
    found_contact
  end
end



# Contact.new({:first => "first name", :last => "last name", :month => "month"})
