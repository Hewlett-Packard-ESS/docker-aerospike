def default_value(val, default)
  if val.nil?
    return default
  end
  if val.is_a? Numeric
    return BigDecimal.new(val).to_i
  elsif val.downcase === 'true'
    return true
  elsif val.downcase === 'false'
    return false
  else
    return val
  end
end

cfg = {
	"namespace" => default_value(ENV['as_namespace'], 'docker'),
	"ttl" => default_value(ENV['as_ttl'], '30d')	
}

template '/usr/local/bin/run-aerospike.sh' do
	source  'run-aerospike.sh.erb'
	mode '0755'
	owner   'docker'
	group   'docker'
	action   :create
end

template '/storage/aerospike.conf' do
	source  'aerospike.conf.erb'
	mode '0755'
	variables cfg 
	owner   'docker'
	group   'docker'
	action   :create_if_missing
end
