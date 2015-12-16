require 'rails_helper'

RSpec.describe "prompts/index", :type => :view do
  before(:each) do
    assign(:prompts, [
      Prompt.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Prompt.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of prompts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
