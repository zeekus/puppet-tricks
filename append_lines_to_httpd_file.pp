#filname: append_lines_to_http_file.pp
#description: this appends 3 lines to a apache config
#Author: Teddy Knab
#Date: 5/5/2020

$my_arr = ['<Limit POST PUT DELETE>', '  Require valid-user', '</Limit>' ]  #basic limit to prevent options
$my_str = $my_arr.join("\n") #build multi line string
$myfilename = '/etc/httpd/conf.d/non-ssl.conf'
file { "$myfilename" :
     ensure => present,
}->file_line{ "apend $v to $myfilename":
     path => $myfilename,
     line => $my_str,
}
