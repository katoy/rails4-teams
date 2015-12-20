json.member do
  json.id member.id
  case member.target_type
  when 'Staff'
    json.partial! 'api/v1/shared/staff', staff: member.target
  when 'Developer'
    json.partial! 'api/v1/shared/developer', dveloper: member.target
  end
end
