feature "User can sign up" do

  scenario "I can sign up as a new user" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq("example@email.com")
  end

end
