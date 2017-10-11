require "rails_helper"

describe "Terms and Conditions Page" do

  it "shows terms and conditions on how to register for an event" do
    visit root_url
    click_on "Terms"
    
    expect(page).to have_content("Terms and conditions on how to register for an event")
  end
end
