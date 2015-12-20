json.person do
  json.id person.id
  json.name person.name
  json.age person.age
  json.mail person.mail
  json.jobkinds do
    json.array!(person.jobkinds) do |jobkind|
      case jobkind.jobkindable_type
      when 'Staff'
        json.Staff do
          json.id jobkind.jobkindable.id
          json.skill jobkind.jobkindable.skill
        end
      when 'Developer'
        json.Developer do
          json.id jobkind.jobkindable.id
          json.lang jobkind.jobkindable.lang
        end
      else
        # json.type jobkind.jobkindable_type
      end
    end
  end
end
