Given /^no domains exist$/ do
  unless Domain.all.empty?
    Domain.all.each do |domain|
      domain.destroy
    end
  end
end

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

When /^I follow "Delete" for "(.*)" keyword "(.*)"$/ do |domain_name, keyword_term|
  @domain = Domain.find_by_name(domain_name)
  @keyword = @domain.keywords.find_by_term(keyword_term)
  click_link("delete_keyword_#{@keyword.id}")
end

When /^I follow "View" for domain "(.*)"$/ do |domain_name|
  @domain = Domain.find_by_name(domain_name)
  click_link("view_domain_#{@domain.id}")
end

When /^I follow "Edit" for domain "(.*)"$/ do |domain_name|
  @domain = Domain.find_by_name(domain_name)
  click_link("edit_domain_#{@domain.id}")
end

When /^I follow "Delete" for domain "(.*)"$/ do |domain_name|
  @domain = Domain.find_by_name(domain_name)
  click_link("delete_domain_#{@domain.id}")
end

Given /^the domain "(.*)" exists with no keywords$/ do |domain_name|
  @domain = Factory.create(:domain)

  unless @domain.keywords.empty?
    @domain.keywords.each do |keyword|
      keyword.destroy
    end
  end
end
