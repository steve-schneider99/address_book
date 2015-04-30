require('rspec')
require('phone')
require('contact')

describe(Phone) do
 describe('#initialize') do
  it('will allow the user to add area code, number, and type') do
    test_phone = Phone.new("503", "358-3693", "cell")
    expect(test_phone.area_code()).to(eq("503"))
    expect(test_phone.number()).to(eq("358-3693"))
    expect(test_phone.type()).to(eq("cell"))
  end
 end

 describe('.all') do
   it('is empty at first') do
     expect(Phone.all()).to(eq([]))
end
end

describe('.save') do
  it('saves the input into the array') do
    test_phone = Phone.new("503", "358-3693", "cell")
    expect(test_phone.save()).to(eq([test_phone]))
  end
end

describe('.clear') do
  it('clears the array') do
    Phone.new("503", "358-3693", "cell").save()
    Phone.clear()
    expect(Phone.all()).to(eq([]))
  end
end
end
