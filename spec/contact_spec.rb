require('rspec')
require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end
  
  describe('#initialize') do
    it('will create the first name, last name, and birth month variables') do
      test_contact = Contact.new({:first => "first name",
                                  :last => "last name",
                                  :month => "month"
                                })
      expect(test_contact.first()).to(eq("first name"))
      expect(test_contact.last()).to(eq("last name"))
      expect(test_contact.month()).to(eq("month"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('.save') do
    it('saves the input to the array') do
      test_contact = Contact.new({:first => "first name", :last => "last name", :month => "month"})
      expect(test_contact.save()).to(eq([test_contact]))
    end
  end

  describe('.clear') do
    it('clears the array of any inputs') do
      Contact.new({:first => "first name", :last => "last name", :month => "month"}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns the contact by its id number') do
      test_contact = Contact.new({:first => "first name", :last => "last name", :month => "month"})
      test_contact.save()
      test_contact2 = Contact.new({:first => "first name", :last => "last name", :month => "month"})
      test_contact2.save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end

  describe('#id') do
    it('returns the id of the contact') do
        test_contact = Contact.new({:first => "first name", :last => "last name", :month => "month"})
        test_contact.save()
        test_contact2 = Contact.new({:first => "first name", :last => "last name", :month => "month"})
        test_contact2.save()
        expect(test_contact.id()).to(eq(1))
        expect(test_contact2.id()).to(eq(2))
    end
  end

end
