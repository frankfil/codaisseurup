require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }
  let!(:event) { create :event, user: user }

  it "has many events" do
    event1 = user.events.new(name: "FEBTGrgrheth")
    event2 = user.events.new(name: "jwfiegjeg")

    expect(user.events).to include(event1)
    expect(user.events).to include(event2)
  end

  it "deletes associated events" do
    expect { user.destroy }.to change(Event, :count).by(-1)
  end
end
