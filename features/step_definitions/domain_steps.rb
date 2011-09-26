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

When /^I press "Delete" for "(.*)" keyword "(.*)"$/ do |domain_name, keyword_term|
  @domain = Domain.find_by_name(domain_name)
  @keyword = @domain.keywords.find_by_term(keyword_term)
  click_link("delete_keyword_#{@keyword.id}")
end

When /^I accept the popup dialog$/ do
  
end
