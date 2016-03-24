h1. Improve at go

This is a web app for reviewing Go games, similar to the [Go teaching ladder](https://gtl.xmp.net/), which is unfortunately no longer accepting new games.

The most basic functionality will be:

* Players can submit a game for review
* Players can submit reviews for games
* The app pings suitable reviewers when a game is uploaded to ensure a speedy review

This is still a work in progress and is not deployed yet.

h2. Contributing

If you're thinking of contributing, yay! You are awesome!

h3. Here are some ways you can help out:

h4. Create github issues for ideas, or break an existing issue down into actionable tasks

Not much is implemented yet, so creating or commenting on issues is the best way to get involved.

Please tag tickets with `beginner` if you think they are documented well enough for somebody new to pick up.

h4. Improve the page design

Currently I'm using bootstrap as a way to quickly build something that looks OK. The layout is a bit wonky and there are no images :(

If you can improve the design in any way, please raise a PR!

h4. Code changes

This project is written in Ruby on Rails.

* If you are new to git/github, have a look at https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/
* You can read the rails getting started guide at http://guides.rubyonrails.org/getting_started.html

When you are ready to contribute, raise a pull request with your changes.

* The PR should be as small and self contained as possible.
* It should have a description that explains what you've done and why
* It doesn't have to be complete. If it's not done, explain in the description what is left to do and how other people can help.
* Be nice to everyone else who has volunteered their time to the project.

h4. Translations

If you are willing to translate the UI to another language, please get in touch via github issues. There is still a lot of coding to be done before translations can be added to the app, but is still an incredibly useful way to help the project and having willing translators makes this worth doing sooner.

h4. Beta testing

Coming soon!

h3. How to get in touch and ask questions

For now, raise an issue and I'll do my best to respond. Thanks!

Running the application
-----------------------

The app requires ruby 2.3.0 and the bundler gem.

I recommend installing ruby through [rbenv](https://github.com/rbenv/rbenv#installation).

1. Install bundler with `gem install bundler`
2. Install dependencies with `bundle install`
3. Run the rails server with `./bin/rails s`
4. Open http://localhost:3000/ in your browser

License
-------

MIT License

Copyright (c) 2016 Mat Moore

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
