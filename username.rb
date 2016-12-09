# Make sure to run the tests in your /spec folder
# Run `rspec /spec/username_spec.rb` to get started.
$user_types = ["user", "seller", "manager", "admin"]
def format_name(first, last)
  return nil if first.size==0 || last.size==0
  first.gsub!(/\W|\d/, "")
  last.insert(0, first.match(/^\w/).to_s).downcase.gsub(/\W|\d/, "")
end

def format_year(year)
  return nil if year.to_s.size!=4
    year.to_s.match(/.{2}$/).to_s
end

def check_privilege(index = 0)
  index = 3 if index > 4
  $user_types[index.floor]
end

def user_type_prefix(index=1)
  return "" if index ==0 && index<1
  check_privilege(index)+"-"
end

def build_username(first, last, year, index =0)
  user_type_prefix(index)+format_name(first, last)+format_year(year)
end
