Given /^the following domains* exists*:$/ do |domains_table|
  domains_table.hashes.each do |attributes|
    Factory.create(:domain, attributes)
  end
end

Given /^the following keywords exist for "(.*)":$/ do |domain_name, keywords_table|
  domain = Domain.find_by_name(domain_name)
  # table is a Cucumber::Ast::Table
  keywords_table.hashes.each do |attributes|
    Factory.create(:keyword, attributes.merge(:domain_id => domain.id))
  end
end
