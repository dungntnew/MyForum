package MyForum::Schema::Result::Post;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 NAME

MyForum::Schema::Result::Post

=cut

__PACKAGE__->table("post");

=head1 ACCESSORS

=head2 id

  data_type: INT
  default_value: undef
  extra: HASH(0x3d96390)
  is_auto_increment: 1
  is_nullable: 0
  size: 11

=head2 thread_id

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 user_id

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 content

  data_type: TEXT
  default_value: undef
  is_nullable: 1
  size: 65535

=head2 date

  data_type: TIMESTAMP
  default_value: CURRENT_TIMESTAMP
  is_nullable: 0
  size: 14

=head2 picture

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 128

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "INT",
    default_value => undef,
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
    size => 11,
  },
  "thread_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "user_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "content",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "date",
  {
    data_type => "TIMESTAMP",
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "picture",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.05003 @ 2012-08-12 10:56:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dsV+xx0z1qShOm1uIFXvLg

## Custom methods

# get author username
sub author {
    my ($self ) = @_;
    return $self->user ? $self->user->username : 'Guest';
}

# get excerpt

sub excerpt {
    my ($self ) = @_;
    my $excerpt = substr $self->content, 0, 10;
    return $excerpt;
}

# Return created date with formart
sub created_date {
	my ($self) = @_;
	my $dt = $self->date;
	
	return $dt->ymd('-'). ' ' .$dt->hour_12(). ':'.$dt->minute().' '.$dt->am_or_pm(); 
}

# You can replace this text with custom content, and it will be preserved on regeneration

# ===================== HAVE_MANY ==================================
# ===================== BELONG_TO ==================================

# Each Post belong to an thread
__PACKAGE__->belongs_to( 'thread', 'MyForum::Schema::Result::Thread', 'thread_id');

# Each Post belong to an user
__PACKAGE__->belongs_to( 'user', 'MyForum::Schema::Result::User', 'user_id');

1;
