describe "sign-in process", :type => :feature do
	before :each do
		User.make(email: 'user@example.com', username: 'user', password: 'password')
	end
	
end