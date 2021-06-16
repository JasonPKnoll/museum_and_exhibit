class Museum
  attr_reader :name, :exhibits, :patrons, :winner

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @winner = winner
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    by_exhibit = Hash.new([])
    exhibits.each do |exhibit|
      by_exhibit[exhibit] = patrons.select do |patron|
        patron.interests.include?(exhibit.name)
      end
    end
    by_exhibit
  end

  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit_interest[exhibit]
  end

  def draw_lottery_winner(exhibit)
    winner = patrons_by_exhibit_interest[exhibit].sample
    if winner == nil
      @winner = nil
    else
      @winner = winner.name
    end
  end

  def announce_lottery_winner(exhibit)
    if winner == nil
      "No winners for this lottery"
    else
      "#{winner} has won the #{exhibit.name} exhibit lottery"
    end
  end

end
