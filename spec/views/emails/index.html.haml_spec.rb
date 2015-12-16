require 'rails_helper'

RSpec.describe "emails/index", :type => :view do
  before(:each) do
    assign(:emails, [
      Email.create!(
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
      ),
      Email.create!(
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
      )
    ])
  end

  it "renders a list of emails" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
