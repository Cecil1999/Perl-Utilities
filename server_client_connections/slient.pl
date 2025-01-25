#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket::INET;

my $socket = IO::Socket::INET->new(
	LocalAddr => '127.0.0.1',
	LocalPort => 7777,
	Proto     => 'tcp',
	ReuseAddr => 1,
	Listen    => 5,
) or die "Cannot create listener - $IO::Socket::errstr\n";

$SIG{INT} = sub { $socket->close(); exit 0; };

while(1) {
    my $client_socket = $socket->accept();

    my $data = "";
    $client_socket->recv($data, 1024);
    print sprintf "Client Message -> $data\n";
}
