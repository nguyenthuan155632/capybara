require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :fullname => "MyString",
      :email => "MyString",
      :is_male => false,
      :address => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input#profile_fullname[name=?]", "profile[fullname]"

      assert_select "input#profile_email[name=?]", "profile[email]"

      assert_select "input#profile_is_male[name=?]", "profile[is_male]"

      assert_select "input#profile_address[name=?]", "profile[address]"

      assert_select "input#profile_phone[name=?]", "profile[phone]"
    end
  end
end
