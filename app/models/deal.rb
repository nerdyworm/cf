class Deal < ActiveRecord::Base
  include Fieldable
  has_many :custom_fields, :as => :fieldable
end

