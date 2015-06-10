require 'spec_helper'

describe Spree::Promotion::Rules::Unique, type: :model do
  let(:rule) { described_class.new }

  describe '#eligible?' do
    subject { rule }

    let(:order) { Spree::Order.new }
    let(:promotion1) { Spree::Promotion.new }
    let(:promotion2) { Spree::Promotion.new(code: 'foo') }

    before { rule.promotion = promotion1 }

    context 'when the order does not have a promotion applied' do
      specify { expect(rule.eligible?(order)).to be_truthy }
    end

    context 'When the order has a promotion' do
      before do
        order.promotions << promotion2
      end

      specify { expect(rule.eligible?(order)).to be_falsy }
    end
  end
end
