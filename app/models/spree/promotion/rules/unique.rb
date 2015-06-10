module Spree
  class Promotion
    module Rules
      class Unique < PromotionRule
        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          eligibility_errors.add(:base, eligibility_error_message(:unique)) if order.promotions.any?
          eligibility_errors.empty?
        end
      end
    end
  end
end
