xml.instruct!
xml.names do
  @names.each do |name|
    xml.name do
      xml.id name
    end
  end
end