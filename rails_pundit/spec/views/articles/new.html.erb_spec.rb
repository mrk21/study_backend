require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      :user => "",
      :title => "MyString",
      :content => "MyString"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_user[name=?]", "article[user]"

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_content[name=?]", "article[content]"
    end
  end
end
