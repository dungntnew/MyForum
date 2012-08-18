package MyForum::Schema::Result::UserToRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 NAME

MyForum::Schema::Result::UserToRole

=cut

__PACKAGE__->table("user_to_role");

=head1 ACCESSORS

=head2 user_id

  data_type: INT
  default_value: undef
  extra: HASH(0x3a373b0)
  is_nullable: 0
  size: 10

=head2 role_id

  data_type: INT
  default_value: undef
  extra: HASH(0x3a415e0)
  is_nullable: 0
  size: 10

=cut

__PACKAGE__->add_columns(
  "user_id",
  {
    data_type => "INT",
    default_value => undef,
    extra => { unsigned => 1 },
    is_nullable => 0,
    size => 10,
  },
  "role_id",
  {
    data_type => "INT",
    default_value => undef,
    extra => { unsigned => 1 },
    is_nullable => 0,
    size => 10,
  },
);
__PACKAGE__->set_primary_key("user_id", "role_id");


# Created by DBIx::Class::Schema::Loader v0.05003 @ 2012-08-15 23:54:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KZS5b9/V51zuCAQLLTUPlw

__PACKAGE__->belongs_to ( 'role', 'MyForum::Schema::Result::Role', { 'foreign.id' => 'self.role_id' } );
__PACKAGE__->belongs_to ( 'user', 'MyForum::Schema::Result::User', { 'foreign.id' => 'self.user_id' } );
# You can replace this text with custom content, and it will be preserved on regeneration
1;
