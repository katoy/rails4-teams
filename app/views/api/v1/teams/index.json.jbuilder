json.array!(@teams) do |team|
  json.partial! 'api/v1/shared/team', team: team
end
