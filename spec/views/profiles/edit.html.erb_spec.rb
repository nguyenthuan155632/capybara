require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :fullname => "MyString",
      :email => "MyString",
      :is_male => false,
      :address => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input#profile_fullname[name=?]", "profile[fullname]"

      assert_select "input#profile_email[name=?]", "profile[email]"

      assert_select "input#profile_is_male[name=?]", "profile[is_male]"

      assert_select "input#profile_address[name=?]", "profile[address]"

      assert_select "input#profile_phone[name=?]", "profile[phone]"
    end
  end
end
