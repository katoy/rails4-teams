json.developer do
  json.id developer.id
  json.lang developer.lang
  json.partial! 'api/v1/shared/jobkind', jobkind: developer.jobkind
end
