require 'patron'
require 'exhibit'
require 'museum'

describe Museum do
  before(:each) do
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @dmns = Museum.new("Denver Museum of Nature and Science")

    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
  end

  it 'exists' do
    expect(@dmns).to be_a(Museum)
  end

  it 'has attributes' do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    expect(@dmns.exhibits).to eq([])
  end

  it 'can add exhibits' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
  end

    describe 'nested iterations' do
      before(:each) do
        @patron_1.add_interest("Dead Sea Scrolls")
        @patron_1.add_interest("Gems and Minerals")
        @patron_2 = Patron.new("Sally", 20)
        @patron_2.add_interest("IMAX")

        @dmns.add_exhibit(@gems_and_minerals)
        @dmns.add_exhibit(@dead_sea_scrolls)
        @dmns.add_exhibit(@imax)
    end

    it 'can recommend exhibits' do
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
    end
  end

  describe 'iteration 3 tests' do
    before(:each) do
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2 = Patron.new("Sally", 20)
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3 = Patron.new("Johnny", 5)
      @patron_3.add_interest("Dead Sea Scrolls")

      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
    end

    it 'admits in patrons' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
    end

    it 'organizes patrons by exhibit interest' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons_by_exhibit_interest).to eq({@gems_and_minerals => [@patron_1], @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3], @imax => []})
    end

    it 'shows ticket lottery contestants' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq([@patron_1, @patron_2, @patron_3])
    end

    it 'can draw lottery winner' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)

      allow(@dmns).to receive(:patrons).and_return([@patron_1])
      expect(@dmns.draw_lottery_winner(@dead_sea_scrolls)).to eq('Bob')
      expect(@dmns.draw_lottery_winner(@imax)).to eq(nil)
      @dmns.draw_lottery_winner(@dead_sea_scrolls)
      expect(@dmns.announce_lottery_winner(@dead_sea_scrolls)).to eq("Bob has won the Dead Sea Scrolls exhibit lottery")
      @dmns.draw_lottery_winner(@imax)
      expect(@dmns.announce_lottery_winner(@imax)).to eq("No winners for this lottery")
    end


  end
end
