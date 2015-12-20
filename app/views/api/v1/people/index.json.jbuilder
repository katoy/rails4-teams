json.array!(@people) do |person|
  json.partial! 'api/v1/shared/person_job', person: person
end
