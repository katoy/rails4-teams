json.team do
  json.id team.id
  json.name team.name
  json.members do
    json.array!(team.members) do |member|
      case member.target_type
      when 'Developer'
        json.partial! '/api/v1/shared/developer', developer: member.target
      when 'Staff'
        json.partial! '/api/v1/shared/staff', staff: member.target
      else
        json.xxx member.target_type
      end
    end
  end
end
