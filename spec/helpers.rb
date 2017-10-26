module CustomSpecHelpers
  def json
    JSON.parse(response.body)
  end
end
