package MyForum::Schema::Result::Thread;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 NAME

MyForum::Schema::Result::Thread

=cut

__PACKAGE__->table("thread");

=head1 ACCESSORS

=head2 id

  data_type: INT
  default_value: undef
  extra: HASH(0x3d8fc08)
  is_auto_increment: 1
  is_nullable: 0
  size: 11

=head2 topic_id

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 user_id

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 title

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 128

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
    size => 11,
  },
  "topic_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "user_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "title",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nDiS+LqZJAvNNa60wvBBQA

## Add Column
__PACKAGE__->add_columns(
	date	=> { data_type => 'datetime', timezone => "local", locale => "en_EN"},
);
## Custom methods

# Return number of posts in a thread
sub num_posts {
    my ($self ) = @_;
    return $self->posts->count;
}

# Return last post
sub last_post {
    my ($self )  = @_;
    return $self->posts->first;
}

# Return true if thread or post in this thread was made within last 24 hours.
sub is_new {
    my ($self )  = @_;

    my $epoch = DateTime->now(time_zone => 'local')->epoch;
    my $yesterday = DateTime->from_epoch( epoch => $epoch - 24 * 60 * 60, time_zone => 'local');
    
	return ( $self->posts->first->date >  $yesterday);
}

# Return author 
sub author {
    my ($self )  = @_;
    return $self->user->username; #? $self->user->username : 'Guest';
}

# Return created date with formart
sub created_date {
	my ($self) = @_;
	my $dt = $self->date;
	
	return $dt->ymd('-'). ' ' .$dt->hour_12(). ':'.$dt->minute().' '.$dt->am_or_pm(); 
}

# You can replace this text with custom content, and it will be preserved on regeneration

# ========================== HAVE MANY ===================================================

# Each thread have many Post
__PACKAGE__->has_many( 
    'posts', 
    'MyForum::Schema::Result::Post', 
    { 'foreign.thread_id' => 'self.id' }, 
    { order_by => { -desc => 'date' } },
);
# ========================== BELONG_TO ===================================================
#
#  Each thread belong to an user and a topic
__PACKAGE__->belongs_to ( 'user', 'MyForum::Schema::Result::User', 'user_id');
__PACKAGE__->belongs_to ( 'topic', 'MyForum::Schema::Result::Topic', 'topic_id');
1;
