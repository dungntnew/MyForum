I. 開発環境 
OS: Centos 6 X86_64
データベース: Mysql
エディタ: VIM
フレーメーク: Catalyst - The Elegant MVC Web Application Framework 


II. 関数が完了しました
  メンバーシップ関数:
Enable users to register an account
log-in name and email is unique.
log-in name and password is one-byte alphabet&number.
Enable users to log-in and log-out.
Enable user to know where he/she is on the 'logged-in' status or 'logged-off' status.
Enable users to view and write on the bulletin board as guest user when they are not logged in.

	Bulletin Board 関数 :
Display List of topics page, List threads page where threads with latest posts are show first.
Put a “New” mark for threads to which a post was made within last 24 hours.
Last updated date & time is displayed as well as thread titles.
Make a pager and set in a way that topics  and threads, posts are shown on the next page 
when the number of topics reaches a certain number. 
Enable users to create new a thread per topic.
Thread title and body text of post  is required for the first time.
It is optional to post an image.
Enable users to reply to an existing thread.
Post title is not required in case of a reply, It is optional to post an image.
Posts is displayed automatically when making a posts: Post ID, Post Author( Log-in name, Full-Name, Join-date, Avatar) , Posts of User, Date of Post Display Guest if he/she is not logged in.
Make a page for an administrator (admin page), set a password 
protection for that, and enable the administrator to create new topic, create new thread, edit topic, edit thread and delete any posts.


III.  特別な機能
Rich Client : Ajax interactive user interface.
Clear and friendly interface.
User Input validation at client and server.
Multiple languages ( Japanese and English).
Support Unicode (UTF-8).


IV. MODULES REQUIRED
1. Catalust::Runtime 5.90015
2. Catalyst::Plugin::ConfigLoader
3. Catalyst::Plugin::Static::Simple
4. Catalyst::Action::RenderView
5. Moose
6. namespace::autoclean
7. Config::General
8. Catalyst::Plugin::Authentication
9. Catalyst::Plugin::Authorization::Roles
10. Catalyst::Plugin::StackTrace
11. Catalyst::Plugin::Static::Simple
12. Catalyst::Plugin::Localize::Simple
13. Catalyst::Plugin::Session
14. Catalyst::Plugin::Session::Store::File
15. Catalyst::Plugin::Session::State::Cookie
16. DBIx::Class::PassphraseColumn
17. Catalyst::Plugin::StatusMessage
18. Catalyst::Plugin::Breadcrumbs


ありがと。
Nguyen Tri Dung
HaNoi 18/08/2012.

