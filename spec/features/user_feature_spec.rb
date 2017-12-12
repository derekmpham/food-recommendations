require 'rails_helper'

describe "sign-in process", :type => :feature do
	before :each do
		User.create(email: 'user@example.com', username: 'user', password: 'password')
	end

	it "signs me in" do
		visit '/login'
		within('form') do
			fill_in 'username', with: 'user'
			fill_in 'password', with: 'password'
		end
		click_button 'Submit'
		expect(page).to have_content 'Hey user!'
	end
end
