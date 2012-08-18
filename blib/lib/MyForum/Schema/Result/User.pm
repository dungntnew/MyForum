package MyForum::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 NAME

MyForum::Schema::Result::User

=cut

__PACKAGE__->table("user");

=head1 ACCESSORS

=head2 id

  data_type: INT
  default_value: undef
  extra: HASH(0x3a40008)
  is_auto_increment: 1
  is_nullable: 0
  size: 10

=head2 username

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 45

=head2 password

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 128

=head2 email

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 128

=head2 first_name

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 128

=head2 last_name

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 128

=head2 avatar

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 128

=head2 status

  data_type: VARCHAR
  default_value: active
  is_nullable: 1
  size: 32

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
  "username",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 45,
  },
  "password",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 128,
  },
  "email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 128,
  },
  "first_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "last_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "avatar",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "status",
  {
    data_type => "VARCHAR",
    default_value => "active",
    is_nullable => 1,
    size => 32,
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


# Created by DBIx::Class::Schema::Loader v0.05003 @ 2012-08-15 23:54:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ra1cUyOvzqkXUzOGbTklwg


# You can replace this text with custom content, and it will be preserved on regeneration

# Add Columns for USER
#

__PACKAGE__->add_columns(
    'password'  => {
        passphrase       =>'rfc2307',
        passphrase_class =>'SaltedDigest',
        passphrase_args  => {
              algorithm     => 'SHA-1',
              salt_random   => 20
        },
        passphrase_check_method => 'check_password',
    },
);

sub fullname {
	my ($self)  = @_;
	return $self->first_name . " ". $self->last_name;
}

sub num_posts {
	my ($self)  = @_;
	return $self->posts->count;

}

sub created_date {
	my ($self) = @_;
	my $dt = $self->date;
	
	return $dt->ymd('-'). ' ' .$dt->hour_12(). ':'.$dt->minute().' '.$dt->am_or_pm(); 
}
# Define User relationships to orther table

# ===================== HAVE MANY ========================================
# Each User have many Topic
__PACKAGE__->has_many( 'topics', 'MyForum::Schema::Result::Topic', 'user_id');

# Each User have many Post
__PACKAGE__->has_many( 'posts', 'MyForum::Schema::Result::Post', 'user_id');

# Each User have many Thread
__PACKAGE__->has_many( 'threads', 'MyForum::Schema::Result::Thread', 'user_id');

# Each User have many UserToRole
__PACKAGE__->has_many( 'user_to_roles', 'MyForum::Schema::Result::UserToRole', 'user_id');
# ===================== BELONG_TO =========================================
# ===================== MANY_TO_MANY ======================================
__PACKAGE__->many_to_many ( 'roles' => 'user_to_roles', 'role');
1;
