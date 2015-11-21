require 'spec_helper'

# As a gamer
# I want to view my score
# So I can see if I win rock, paper, scissors
#
# Acceptance Criteria:
# [x] I can see the players and wins of this rock, paper, scissors game



feature "user views score" do
  scenario "view score" do

    visit '/rps_game'
    expect(page).to have_content("Rock, Paper, Scissors")
    expect(page).to have_content("Player")
    expect(page).to have_content("CPU")
    expect(page).to have_content("Score")
    save_and_open_page
  end
end
