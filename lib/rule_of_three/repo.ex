defmodule RuleOfThree.Repo do
  use Ecto.Repo,
    otp_app: :rule_of_three,
    adapter: Ecto.Adapters.Postgres
end
