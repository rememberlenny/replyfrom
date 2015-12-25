require 'rails_helper'

RSpec.describe "accounts/show", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :user_id => 1,
      :slug => "Slug",
      :fowarded_email => "Fowarded Email",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/Fowarded Email/)
    expect(rendered).to match(/MyText/)
  end
end
