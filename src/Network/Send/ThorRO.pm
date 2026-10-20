#########################################################################
#  OpenKore - Network::Send::ThorRO
#  ThorRO: rAthena with the 2025-06-04 Ragexe client (PACKETVER 20250604).
#  rAthena accepts the same client packets as for 2021-11-03 RagexeRE.
#
#  This software is open source, licensed under the GNU General Public
#  License, version 2.
#########################################################################
package Network::Send::ThorRO;
use strict;
use base qw(Network::Send::kRO::RagexeRE_2021_11_03);

sub new {
	my ($class) = @_;
	my $self = $class->SUPER::new(@_);
	return $self;
}

1;
