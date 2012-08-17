package MyForum::Schema::Result::Multimedia;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 NAME

MyForum::Schema::Result::Multimedia

=cut

__PACKAGE__->table("multimedia");

=head1 ACCESSORS

=head2 id

  data_type: INT
  default_value: undef
  extra: HASH(0x3d8b8b0)
  is_auto_increment: 1
  is_nullable: 0
  size: 10

=head2 user_id

  data_type: INT
  default_value: undef
  extra: HASH(0x3d8b7c0)
  is_nullable: 0
  size: 10

=head2 type

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 45

=head2 file_uri

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 256

=head2 date

  data_type: TIMESTAMP
  default_value: CURRENT_TIMESTAMP
  is_nullable: 0
  size: 14

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "INT",
    default_value => undef,
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
    size => 10,
  },
  "user_id",
  {
    data_type => "INT",
    default_value => undef,
    extra => { unsigned => 1 },
    is_nullable => 0,
    size => 10,
  },
  "type",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 45,
  },
  "file_uri",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 256,
  },
  "date",
  {
    data_type => "TIMESTAMP",
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.05003 @ 2012-08-12 10:56:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:j/39APmhUYrs9pwOqJtJEA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
