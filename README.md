# ipset-blacklist
IP blacklisting based on ipset, iptables, and publicly accessible address lists

*  based on the original script from https://n0where.net/iptables-blacklist-script/
*  additional lists from simestd
*  refactoring by ak_hepcat
*  ipmerge.pl  from https://github.com/roycewilliams/cidr-pipes

ipmerge.pl script requires NetAddr::IP, grab it from cpan or your distros package manager.

add a line like:

    -A INPUT -m set --match-set blacklist src -j DROP  

near the very top of your iptables INPUT rules.  This will ensure the widest coverage.

You may need to make sure that it's -after- your management rules, or you could possibly
lock yourself (remotely) out of your own system.

You can set up the v4-blacklist.sh  as a daily cron job, so that you're pulling fresh data.
I wouldn't recommend much more often than that.

The ipmerge.pl script will ingest the raw cidr blocks and shrink them into the smallest possible
set of provided networks.  off-the-cuff testing showed a reduction from >80k entries down to ~ 48k
