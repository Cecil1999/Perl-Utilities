#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket::INET;

my $socket = IO::Socket::INET->new(
	PeerAddr => '127.0.0.1',
	PeerPort => 7777,
	Proto    => 'tcp'
) or die "Couldn't create Sender - $IO::Socket::errstr\n";

my $special_message = <<"HD";
Hello! This is the client!.

Please answer when you get this message!
HD

$socket->send($special_message);

close($socket);
