require 'rails_helper'

describe "User Features", :type => :feature do

	# describe "new user" do
		# click sign up
		# enters new user email, username, password, and confirm password
		# click_button 'Submit'
		# expect(page).to have_content 'Hey {username}!'
	# end

	before :each do
		test_user = User.create(email: 'user@example.com', username: 'user', password: 'password')
	end

	it "signs me in" do
		visit '/login'
		expect(page).to have_current_path(login_path)
		
		within('form') do
			fill_in 'username', with: 'user'
			fill_in 'password', with: 'password'
		end
		click_button 'Submit'
		expect(page).to have_content 'Hey user!'
		# expect(page).to have_current_path(user_recommendations_path(:id))
		# expect(page).to have_current_path(people_path(search: 'name'))
	end

	# next things to test
	# sign in successfully (already have-->integrate rest of specs into signing in?)
	# ready other people's food recommendations?
	# successfully post recommendation
end
