package ODO::RDFS::List::PropertiesContainer;

use strict;
use warnings;

use vars qw( $AUTOLOAD @ISA );
use ODO::RDFS::Resource::PropertiesContainer;
use vars qw /$VERSION/;
$VERSION = sprintf "%d.%02d", q$Revision: 1.5 $ =~ /: (\d+)\.(\d+)/;
@ISA = (  'ODO::RDFS::Resource::PropertiesContainer', );

# Methods


sub rest {
	my $self = shift;

	my $parent = $self->{'parent'};
	unless($parent) {
		die('Fatal error in property container: parent object is not defined!');
	}

	if(   scalar(@_) > 0
	   && UNIVERSAL::isa($_[0], 'ODO::RDFS::Properties::rest')) {

		my $value = $_[0]->value();
		
		my $property = ODO::Node::Resource->new( ODO::RDFS::Properties::rest->objectURI() );
		if(UNIVERSAL::isa($value, 'ODO::Node::Literal')) {			
			my $stmt = ODO::Statement->new($parent->subject(), $property, $value);
			$parent->graph()->add($stmt);
		}
		else {
			# The property's value is a URI with other attached URIs so add them 
			# all to the graph
			my $stmt = ODO::Statement->new($parent->subject(), $property, $_[0]->subject());
			$parent->graph()->add($stmt);
			$parent->graph()->add( @{ $value } );
		}
	}
	
	return $parent->get_property_values( 'ODO::RDFS::Properties::rest' );
}

sub first {
	my $self = shift;

	my $parent = $self->{'parent'};
	unless($parent) {
		die('Fatal error in property container: parent object is not defined!');
	}

	if(   scalar(@_) > 0
	   && UNIVERSAL::isa($_[0], 'ODO::RDFS::Properties::first')) {

		my $value = $_[0]->value();
		
		my $property = ODO::Node::Resource->new( ODO::RDFS::Properties::first->objectURI() );
		if(UNIVERSAL::isa($value, 'ODO::Node::Literal')) {			
			my $stmt = ODO::Statement->new($parent->subject(), $property, $value);
			$parent->graph()->add($stmt);
		}
		else {
			# The property's value is a URI with other attached URIs so add them 
			# all to the graph
			my $stmt = ODO::Statement->new($parent->subject(), $property, $_[0]->subject());
			$parent->graph()->add($stmt);
			$parent->graph()->add( @{ $value } );
		}
	}
	
	return $parent->get_property_values( 'ODO::RDFS::Properties::first' );
}

1;
