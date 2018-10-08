require "./lib/oystercard.rb"

describe Oystercard do
  it "should have a balance of 0" do
    expect(subject.balance).to eq(0)
  end
  describe "#top_up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "increases the balance of a card" do
    expect{ subject.top_up 20 }.to change{ subject.balance }.by 20
    end

    it "raises an error when maximum balance is exceeded" do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded!"
    end
  end
end
