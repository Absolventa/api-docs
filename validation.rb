require 'rubygems'
require 'nokogiri'

def validate(document_path, schema_path)
  schema = Nokogiri::XML::Schema(File.read(schema_path))
  document = Nokogiri::XML(File.read(document_path))
  schema.validate(document)
end

xml = `find * -type f -name "*.xml"`.split("\n")

xml.each do |file|
  validation = validate(file, file.gsub(/.xml$/, ".xsd"))

  unless validation.empty?
    validation.each do |error|
      puts error.message
    end
  end
end
