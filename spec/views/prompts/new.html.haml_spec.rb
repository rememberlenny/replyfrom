require 'rails_helper'

RSpec.describe "prompts/new", :type => :view do
  before(:each) do
    assign(:prompt, Prompt.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new prompt form" do
    render

    assert_select "form[action=?][method=?]", prompts_path, "post" do

      assert_select "input#prompt_name[name=?]", "prompt[name]"

      assert_select "textarea#prompt_description[name=?]", "prompt[description]"
    end
  end
end
