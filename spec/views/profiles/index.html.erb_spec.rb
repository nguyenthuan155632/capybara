require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :fullname => "Fullname",
        :email => "Email",
        :is_male => false,
        :address => "Address",
        :phone => "Phone"
      ),
      Profile.create!(
        :fullname => "Fullname",
        :email => "Email",
        :is_male => false,
        :address => "Address",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "Fullname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
