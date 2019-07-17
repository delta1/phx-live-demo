# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveDemo.Repo.insert!(%LiveDemo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LiveDemo.Repo
alias LiveDemo.Items.Item

Repo.insert!(%Item{name: "item one", status: "created"})
Repo.insert!(%Item{name: "item two", status: "updated"})
Repo.insert!(%Item{name: "item three", status: "done"})
