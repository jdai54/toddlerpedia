class Amount < ActiveRecord::Base
  def self.default
    5_00
  end
end
