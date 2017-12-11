describe "sign-in process", :type => :feature do
	before :each do
		User.make(email: 'user@example.com', username: 'user', password: 'password')
	end

	it "signs me in" do
		visit '/login'
		within("#username") do
			fill_in 'Username', with: 'user'
			fill_in 'Password', with: 'password'
		end
		click_button 'Submit'
		expect(page).to have_content 'Hey user!'

	end
end