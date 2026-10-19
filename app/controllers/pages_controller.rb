class PagesController < ApplicationController
  def show
    @workspace = Workspace.new(
      name: "Northstar Studio",
      slug: "northstar-studio",
      website: "https://northstar.studio",
      description: "A small product studio building calm, useful software.",
      display_name: "Northstar",
      legal_name: "Northstar Studio",
      support_email: "hello@northstar.studio",
      billing_email: "billing@northstar.studio",
      api_secret: "sk_live_123456789",
      smtp_password: "correct-horse-battery-staple",
      member_search: "Sam",
      invite_email: "taylor@northstar.studio",
      phone: "+49 30 1234 5678",
      backup_phone: "+49 30 1234 5679",
      docs_url: "https://docs.northstar.studio",
      callback_url: "https://northstar.studio/webhooks",
      plan: "pro",
      seats: 12,
      monthly_budget: 249,
      billing_cycle: "annual",
      timezone: "berlin",
      industry: "saas",
      owner_id: "alex",
      visibility: "private",
      features: ["projects", "analytics"],
      integrations: ["slack"],
      channels: ["email"],
      trial_ends_on: Date.new(2026, 11, 1),
      contract_started_on: Date.new(2026, 9, 12),
      daily_digest_at: "09:00",
      maintenance_at: Time.zone.parse("2026-11-05 02:00"),
      last_synced_at: Time.zone.parse("2026-10-18 16:30"),
      onboarded_at: Time.zone.parse("2026-09-12 10:00"),
      billing_month: Date.new(2026, 10, 1),
      launch_week: Date.new(2026, 10, 19),
      product_updates: true,
      usage_analytics: false,
      terms: false,
      billing_address: "Torstraße 12\n10119 Berlin\nGermany",
      internal_notes: "Prefers async updates.",
      onboarding_notes: "Kickoff scheduled for next week.",
      company_name: "Northstar Studio",
      vat_id: "DE123456789",
      billing_phone: "+49 30 1234 5680",
      payment_method: "card",
      invoice_delivery: "email"
    )

    @workspace.errors.add(:slug, "is already taken")
    @workspace.errors.add(:billing_email, "is invalid")
    @workspace.errors.add(:terms, "must be accepted")
  end
end
