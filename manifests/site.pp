node default {
 # notify {'This is the development environment. Remind me in ${fqdn_rand(100)} minutes': }
  notify {"This is the development environment. Remind me in ${fqdn_rand(100)} minutes": }

  notify {"Test function ${split('1:2:3',':')}" :}
  
  
#  $message = hiera('message','unknown')
#  $message.each |String $test| {
#    notify {"Message is $test": }
#  }

 # $x = [ '1','2' ]
 # $x.each |String $value| {
 #   notify {"M is ${value}": }
 # }
}

node web-d-001 {
  class { '::mcolective':
    middleware_hosts => [ 'web-d-002.example.com' ],
  }
}
node web-d-002 {
  notify {'Hello node 2': }
  class { 'ntp': }
  inlcude activemq
  $mess = hiera('puppet_is_enabled',true)
  $xx = hiera('ansible_rsa_priv_key',undef)
  notify {"Value is | $xx ":}
  if $mess { include puppet }
 # class { 'puppet':
 #   status => 'stopped',
 # }
}

