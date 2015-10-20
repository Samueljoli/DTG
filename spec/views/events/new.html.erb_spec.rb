require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :title => "MyString",
      :venue => "MyString",
      :street_number => 1,
      :city => "MyString",
      :sttate => "MyString",
      :zip => 1,
      :description => "MyText",
      :url => "MyString",
      :image => "MyString",
      :category => "MyString"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_venue[name=?]", "event[venue]"

      assert_select "input#event_street_number[name=?]", "event[street_number]"

      assert_select "input#event_city[name=?]", "event[city]"

      assert_select "input#event_sttate[name=?]", "event[sttate]"

      assert_select "input#event_zip[name=?]", "event[zip]"

      assert_select "textarea#event_description[name=?]", "event[description]"

      assert_select "input#event_url[name=?]", "event[url]"

      assert_select "input#event_image[name=?]", "event[image]"

      assert_select "input#event_category[name=?]", "event[category]"
    end
  end
end
