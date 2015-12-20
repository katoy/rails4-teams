json.staff do
  json.id staff.id
  json.skill staff.skill
  json.partial! 'api/v1/shared/jobkind', jobkind: staff.jobkind
end
