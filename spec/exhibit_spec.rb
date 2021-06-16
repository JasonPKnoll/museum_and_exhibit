require 'patron'
require 'exhibit'

describe Exhibit do
  before(:each) do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @patron_1 = Patron.new("Bob", 20)
  end

  it 'exists' do
    expect(@exhibit).to be_a(Exhibit)
  end

  it 'has attributes' do
    expect(@exhibit.name).to eq("Gems and Minerals")
    expect(@exhibit.cost).to eq(0)
  end
end
