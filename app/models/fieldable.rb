module Fieldable
  def custom_fields=(fields)
    if fields.is_a?(Hash)
      set_field_values_from_hash(fields)
    else
      super(custom_fields)
    end
  end

  private

  def set_field_values_from_hash(hash)
    hash.each_pair do |key, value|
      field = find_or_build_custom_field_with_key(key)
      field.value = value
    end
  end

  def find_or_build_custom_field_with_key(key)
    field = custom_fields.find_by_key(key)
    if field.nil?
      field = build_custom_field_with_key(key)
    end
    field
  end

  def build_custom_field_with_key(key)
    custom_fields.new(:key => key, :account_id => 1)
  end
end
