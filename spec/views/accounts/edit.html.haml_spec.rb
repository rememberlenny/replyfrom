require 'rails_helper'

RSpec.describe "accounts/edit", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :user_id => 1,
      :slug => "MyString",
      :fowarded_email => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_user_id[name=?]", "account[user_id]"

      assert_select "input#account_slug[name=?]", "account[slug]"

      assert_select "input#account_fowarded_email[name=?]", "account[fowarded_email]"

      assert_select "textarea#account_description[name=?]", "account[description]"
    end
  end
end
