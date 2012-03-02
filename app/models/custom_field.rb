class CustomField < ActiveRecord::Base
  belongs_to :fieldable, :polymorphic => true

  validates_presence_of :account_id, :key

  def value=(value)
    self.string_value = value
  end

  def value
    self.string_value
  end
end
