#Description changing permsisions on a group of files for puppet
#This is an attempt to make the home directories more secure

$standard_permissions_work = [ 
'/opt/puppetlabs/server/data/puppetserver',
'/opt/puppetlabs/server/data/bolt-server',
'/opt/puppetlabs/server/data/ace-server',
'/opt/puppetlabs/server/data/puppetdb',
'/opt/puppetlabs/server/data/console-services',
'/opt/puppetlabs/server/data/orchestration-services', 
]

$some_dirs_need_755_permissions = [
'/opt/puppetlabs/server/data/postgresql',
'/var/cache/puppetlabs/nginx', 
]


#change permissions to 0755 where needed
file { $some_dirs_need_755_permissions: 
 ensure => directory,
 mode => '0755',
}

file { $standard_permissions_work:
 ensure => directory,
 mode => '0750',
}
