package MyForum::Schema::Result::Topic;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "PassphraseColumn");

=head1 NAME

MyForum::Schema::Result::Topic

=cut

__PACKAGE__->table("topic");

=head1 ACCESSORS

=head2 id

  data_type: INT
  default_value: undef
  extra: HASH(0x3a346c0)
  is_auto_increment: 1
  is_nullable: 0
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

=head2 description

  data_type: TEXT
  default_value: undef
  is_nullable: 1
  size: 65535

=head2 date

  data_type: TIMESTAMP
  default_value: CURRENT_TIMESTAMP
  is_nullable: 0
  size: 14

=head2 active

  data_type: TINYINT
  default_value: 1
  is_nullable: 1
  size: 1

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
  "user_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "title",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "description",
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
  "active",
  { data_type => "TINYINT", default_value => 1, is_nullable => 1, size => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.05003 @ 2012-08-15 23:54:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nv7fpapH03gaVjirj0awiw


# You can replace this text with custom content, and it will be preserved on regeneration

## Custom methods

# Return number of threads in a topic
sub num_threads {
    my ($self ) = @_;
    return $self->threads->count;
}

# Return total of posts in a topic
sub num_posts {
    my ($self)  = @_;
    my $num_posts = 0; 
    foreach my $thread ($self->threads) {
        $num_posts += $thread->num_posts;    
    }

    # Return num of posts
    $num_posts;
}

# Return last thread
sub last_thread {
    my ($self)  = @_;
    return $self->threads->search(
        undef, 
        { order_by => { -desc => 'last_update'}, rows => 1 }
    )->single;
}

# Return created date with formart
sub created_date {
	my ($self) = @_;
	my $dt = $self->date;
	
	return $dt->ymd('-'). ' ' .$dt->hour_12(). ':'.$dt->minute().' '.$dt->am_or_pm(); 
}

# Return list threads 
## Relationships
# ====================== HAVE MANY ==========================================

# Each Topic have many Thread
__PACKAGE__->has_many( 
    'threads',
    'MyForum::Schema::Result::Thread', 
    'topic_id',
);

# ====================== BELONG_TO ==========================================

# Create an accessor to related class is user that refef by forgeign key 
__PACKAGE__->belongs_to( 'user', 'MyForum::Schema::Result::User', 'user_id');

1;
