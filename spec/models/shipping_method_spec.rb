# frozen_string_literal: true

module Spree
  RSpec.describe ShippingMethod, type: :model do
    let(:shipping_method) { create(:shipping_method) }

    context "when soft-deleting" do
      subject(:soft_deleting) do
        shipping_method.discard
        shipping_method.reload
      end

      it "keeps the translation on deletion" do
        soft_deleting
        expect(shipping_method.translations).not_to be_empty
      end
    end
  end
end
