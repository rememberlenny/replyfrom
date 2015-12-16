require 'rails_helper'

RSpec.describe "emails/show", :type => :view do
  before(:each) do
    @email = assign(:email, Email.create!(
      :newsletter_id => 1,
      :to => "MyText",
      :from => "MyText",
      :subject => "MyText",
      :body => "MyText",
      :raw_text => "MyText",
      :raw_html => "MyText",
      :raw_body => "MyText",
      :headers => "MyText",
      :raw_headers => "MyText",
      :admin_email => false,
      :slug => "Slug",
      :origin_body => "MyText",
      :origin_raw_html => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
