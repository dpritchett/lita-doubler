require "spec_helper"

describe Lita::Handlers::Doubler, lita_handler: true do
  let(:robot) { Lita::Robot.new(registry) }

  subject { described_class.new(robot) }
  
  describe ':double' do
    it { is_expected.to route("Lita double 2") }
    it { is_expected.to route("Lita double    22") }
    it { is_expected.to route("Lita doUble 4") }

    it { is_expected.to_not route("Lita double two") }
    it { is_expected.to_not route("Lita double 1e4") }

    it 'doubles numbers' do
      send_message 'Lita double 2'
      expect(replies.last).to eq('2 + 2 = 4')
    end
  end
end
