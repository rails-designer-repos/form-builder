class Workspace
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :slug, :string
  attribute :website, :string
  attribute :description, :string
  attribute :logo, :string

  attribute :display_name, :string
  attribute :legal_name, :string
  attribute :support_email, :string
  attribute :billing_email, :string
  attribute :api_secret, :string
  attribute :smtp_password, :string
  attribute :member_search, :string
  attribute :invite_email, :string
  attribute :phone, :string
  attribute :backup_phone, :string
  attribute :docs_url, :string
  attribute :callback_url, :string

  attribute :plan, :string
  attribute :seats, :integer
  attribute :monthly_budget, :decimal
  attribute :billing_cycle, :string
  attribute :timezone, :string
  attribute :industry, :string
  attribute :owner_id, :string
  attribute :visibility, :string
  attribute :features, default: []
  attribute :integrations, default: []
  attribute :channels, default: []

  attribute :trial_ends_on, :date
  attribute :contract_started_on, :date
  attribute :daily_digest_at, :time
  attribute :maintenance_at, :datetime
  attribute :last_synced_at, :datetime
  attribute :onboarded_at, :datetime
  attribute :billing_month, :date
  attribute :launch_week, :date

  attribute :product_updates, :boolean
  attribute :usage_analytics, :boolean
  attribute :terms, :boolean
  attribute :billing_address, :string
  attribute :internal_notes, :string
  attribute :onboarding_notes, :string
  attribute :company_name, :string
  attribute :vat_id, :string
  attribute :billing_phone, :string
  attribute :payment_method, :string
  attribute :invoice_delivery, :string
  attribute :tax_document, :string

  def has_attribute?(name)
    self.class.attribute_types.key?(name.to_s)
  end

  def type_for_attribute(name)
    self.class.attribute_types[name.to_s]
  end
end
