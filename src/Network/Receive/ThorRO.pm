#########################################################################
#  OpenKore - Network::Receive::ThorRO
#  ThorRO: rAthena with the 2025-06-04 Ragexe client (PACKETVER 20250604).
#
#  Based on kRO RagexeRE 2021-11-03. Comparing rAthena built for both client
#  versions, the packets that changed are already handled by OpenKore's base
#  definitions (skill list 010F/0111/07E1 with skill names, guild info 02F7),
#  so nothing is redefined here. Packet lengths for this client are in
#  tables/ThorRO/recvpackets.txt (taken from rAthena itself).
#
#  This software is open source, licensed under the GNU General Public
#  License, version 2.
#########################################################################
package Network::Receive::ThorRO;
use strict;
use base qw(Network::Receive::kRO::RagexeRE_2021_11_03);

sub new {
	my ($class) = @_;
	my $self = $class->SUPER::new(@_);
	return $self;
}

1;
