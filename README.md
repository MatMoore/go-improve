# Improve at go

This is a web app for reviewing Go games, similar to the [Go teaching ladder](https://gtl.xmp.net/), which is unfortunately no longer accepting new games.

The most basic functionality will be:

* Players can submit a game for review
* Players can submit reviews for games
* The app pings suitable reviewers when a game is uploaded to ensure a speedy review

This is still a work in progress and is not deployed yet.

## Contributing

If you're thinking of contributing, yay! You are awesome!

### Here are some ways you can help out:

#### Create github issues for ideas, or break an existing issue down into actionable tasks

Not much is implemented yet, so creating or commenting on issues is the best way to get involved.

Please tag tickets with `beginner` if you think they are documented well enough for somebody new to pick up.

#### Improve the page design

Currently I'm using bootstrap as a way to quickly build something that looks OK. The layout is a bit wonky and there are no images :(

If you can improve the design in any way, please raise a PR!

#### Code changes

This project is written in Ruby on Rails.

* If you are new to git/github, have a look at https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/
* You can read the rails getting started guide at http://guides.rubyonrails.org/getting_started.html

When you are ready to contribute, raise a pull request with your changes.

* The PR should be as small and self contained as possible.
* It should have a description that explains what you've done and why
* It doesn't have to be complete. If it's not done, explain in the description what is left to do and how other people can help.
* Be nice to everyone else who has volunteered their time to the project.

#### Translations

If you're willing to translate the UI to another language, please get in touch via github issues. There is still a lot of coding to be done before translations can be added to the app, but is still an incredibly useful way to help the project and having willing translators makes this worth doing sooner.

#### Beta testing

Coming soon!

### How to get in touch and ask questions

For now, raise an issue and I'll do my best to respond. Thanks!

## Running the application

To run the app you will need to install ruby 2.3.0. I recommend using [rbenv](https://github.com/rbenv/rbenv#installation).

On a mac or linux, you can then run the following steps in a terminal:

1. Checkout the project with `git checkout git@github.com:MatMoore/go-improve.git`
2. Install bundler with `gem install bundler`
3. Install dependencies with `bundle install`
4. Run the rails server with `./bin/rails s`

If everything is working, you should be able to open http://localhost:3000/ in your browser.

## License

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
