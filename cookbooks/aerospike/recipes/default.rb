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
	owner   'docker'
	group   'docker'
	action   :create_if_missing
end
