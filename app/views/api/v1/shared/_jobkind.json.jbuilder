json.jobkind do
  json.id jobkind.id
  json.partial! 'api/v1/shared/person', person: jobkind.person
end
