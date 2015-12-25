require 'rails_helper'

RSpec.describe "accounts/index", :type => :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :user_id => 1,
        :slug => "Slug",
        :fowarded_email => "Fowarded Email",
        :description => "MyText"
      ),
      Account.create!(
        :user_id => 1,
        :slug => "Slug",
        :fowarded_email => "Fowarded Email",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Fowarded Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
