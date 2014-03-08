### eyeOS

##### Version 2.5

###### Published under GNU Affero General Public License, version 3

eyeOS is a web desktop following the cloud computing concept that seeks to enable collaboration and communication among users. It is mainly written in PHP, XML, and JavaScript. It is a private-cloud application platform with a web-based desktop interface. Commonly called a cloud desktop because of its unique user interface, eyeOS delivers a whole desktop from the cloud with file management, personal management information tools, collaborative tools and with the integration of the client’s applications.

eyeOS released version 2.5 on May 17,2011, which was the last release of the product under an open source license. 

I am attempting to fix the bugs left behind by the eyeOS team in this release as I find them, and then later add to it.

### Installation
#### Ubuntu
Tested on Ubuntu 12.04.
#### Install prerequisites/dependencies and add eyeOS to web root
    wget https://github.com/dhamaniasad/eyeos/raw/master/setup-ubuntu.sh -O - | sh
    
Once the execution of this command is over, you must go to http://IPADDRESS/install (where IPADDRESS is the IPv4 address of your VPS) to finish installation.
#### CentOS
In case you don't have wget installed(the default in many installations is that you don't), run this command first.

    yum -y install wget
And then run this command:

    wget https://github.com/dhamaniasad/eyeos/raw/master/setup-centos.sh -O - | sh
    
Once the execution of this command is over, you must go to http://IPADDRESS/install (where IPADDRESS is the IPv4 address of your VPS) to finish installation.
### Recommended environment
Personally, I'd recommend you try running eyeOS on a [VPS](https://en.wikipedia.org/wiki/Virtual_private_server). 

#### Recommended VPS Providers
[Atlantic.Net](http://www.atlantic.net/cloud-hosting/cloud-server-pricing/) <br>
[DigitalOcean](https://www.digitalocean.com) <br>
[Uqiquity Hosting](https://www.ubiquityservers.com/cloud) <br>

#### Minimum Recommended Specs
    RAM : 512MB Minimum

    HDD : 10GB

    Port : 100Mb/s
<br>Please keep in mind that these are the bare minimum recommended specs, unless you want to run into memory issues.
