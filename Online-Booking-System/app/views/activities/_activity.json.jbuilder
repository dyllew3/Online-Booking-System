json.extract! activity, :id, :ResponsibleTeacher, :Description, :StartClassSuitability, :EndClassSuitability, :StartDate, :EndDate, :StartTime, :EndTime, :NoOfChildren, :created_at, :updated_at
json.url activity_url(activity, format: :json)