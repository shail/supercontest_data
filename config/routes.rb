Rails.application.routes.draw do
  resources :teams
  resources :team_standings
  resources :contest_weekly_picks
  resources :weekly_results
  resources :contest_weekly_results
end
