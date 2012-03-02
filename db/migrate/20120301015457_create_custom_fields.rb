class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :fieldable_type, :null => false
      t.integer :fieldable_id, :null => false
      t.string :key, :null => false

      t.integer :account_id#, :null => false

      t.string :string_value
      t.datetime :date_value
      t.integer :currency_value
      t.integer :integer_value
      t.float :float_value

      t.timestamps
    end

    # FieldablePK
    add_index :custom_fields, [:fieldable_type, :fieldable_id, :key], :unique => true

    # select fieldable_id from custom_fields where account_id = 1 and fieldable_type = 'Deal' and key='some_key' and value like 'simple search%'
    add_index :custom_fields, [:account_id, :fieldable_type, :key, :string_value], :name => 'custom_fields_string_index'
    add_index :custom_fields, [:account_id, :fieldable_type, :key, :date_value], :name => 'custom_fields_date_index'
    add_index :custom_fields, [:account_id, :fieldable_type, :key, :currency_value], :name => 'custom_fields_currency_index'
    add_index :custom_fields, [:account_id, :fieldable_type, :key, :integer_value], :name => 'custom_fields_integer_index'
    add_index :custom_fields, [:account_id, :fieldable_type, :key, :float_value], :name => 'custom_fields_float_index'
  end
end
