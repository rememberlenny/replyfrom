require 'rails_helper'

RSpec.describe "prompts/edit", :type => :view do
  before(:each) do
    @prompt = assign(:prompt, Prompt.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit prompt form" do
    render

    assert_select "form[action=?][method=?]", prompt_path(@prompt), "post" do

      assert_select "input#prompt_name[name=?]", "prompt[name]"

      assert_select "textarea#prompt_description[name=?]", "prompt[description]"
    end
  end
end
