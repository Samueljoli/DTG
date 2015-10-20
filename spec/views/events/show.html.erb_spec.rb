require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Sttate/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Category/)
  end
end
