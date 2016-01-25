require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :user => "",
        :title => "Title",
        :content => "Content"
      ),
      Article.create!(
        :user => "",
        :title => "Title",
        :content => "Content"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
