require 'factory_girl'

Factory.define(:domain) do |domain|
  domain.name "Telrepco"
  domain.url "http://telrepco.com"
end

Factory.define(:keyword) do |keyword|
  keyword.term "water buffalo"
end
