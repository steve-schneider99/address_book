require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/phone')

get("/") do
  @contacts = Contact.all()
  @phone = Phone.all()
  erb(:index)
end

post("/new_contact") do
  name = params.fetch('name')
  number = params.fetch('number')
  email = params.fetch('email')
  Contact.new({:name => name, :number => number, :email => email}).save()
  @contacts = Contact.all()
  erb(:index)
end

get('/contact/:id') do
  @contacts = Contact.find(params.fetch('id').to_i())
  erb(:contact)
end

post("/contact") do
  number = params.fetch('number')
  email = params.fetch('email')
  

end
