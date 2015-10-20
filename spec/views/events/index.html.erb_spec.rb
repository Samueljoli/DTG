require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "Title",
        :venue => "Venue",
        :street_number => 1,
        :city => "City",
        :sttate => "Sttate",
        :zip => 2,
        :description => "MyText",
        :url => "Url",
        :image => "Image",
        :category => "Category"
      ),
      Event.create!(
        :title => "Title",
        :venue => "Venue",
        :street_number => 1,
        :city => "City",
        :sttate => "Sttate",
        :zip => 2,
        :description => "MyText",
        :url => "Url",
        :image => "Image",
        :category => "Category"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Venue".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Sttate".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
