require 'rails_helper'

RSpec.describe "emails/edit", :type => :view do
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
      :slug => "MyString",
      :origin_body => "MyText",
      :origin_raw_html => "MyText"
    ))
  end

  it "renders the edit email form" do
    render

    assert_select "form[action=?][method=?]", email_path(@email), "post" do

      assert_select "input#email_newsletter_id[name=?]", "email[newsletter_id]"

      assert_select "textarea#email_to[name=?]", "email[to]"

      assert_select "textarea#email_from[name=?]", "email[from]"

      assert_select "textarea#email_subject[name=?]", "email[subject]"

      assert_select "textarea#email_body[name=?]", "email[body]"

      assert_select "textarea#email_raw_text[name=?]", "email[raw_text]"

      assert_select "textarea#email_raw_html[name=?]", "email[raw_html]"

      assert_select "textarea#email_raw_body[name=?]", "email[raw_body]"

      assert_select "textarea#email_headers[name=?]", "email[headers]"

      assert_select "textarea#email_raw_headers[name=?]", "email[raw_headers]"

      assert_select "input#email_admin_email[name=?]", "email[admin_email]"

      assert_select "input#email_slug[name=?]", "email[slug]"

      assert_select "textarea#email_origin_body[name=?]", "email[origin_body]"

      assert_select "textarea#email_origin_raw_html[name=?]", "email[origin_raw_html]"
    end
  end
end
