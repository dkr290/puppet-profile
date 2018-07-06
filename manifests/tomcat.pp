class profile::tomcat(

  Array $rules,

){
  include ::java
  include ::tomcat
  

case $facts['os']['family'] {
           'Debian': {
  $rules.each |$rule| {

     ::tomcat::firewall {$rule['name']:
          dport => $rule['dport'],
          proto => $rule['proto'],
          action => $rule['action'],

     } 

   }
 }
'RedHat', 'CentOS': { 

 
 $rules.each  |$f| {

   ::tomcat::firewall {$f['name']: 

          ensure => $f['ensure'],
          zone  =>  $f['zone'],
          port  =>  $f['port'],
          protocol => $f['protocol'],   

      }

 }
}




    }

 }
