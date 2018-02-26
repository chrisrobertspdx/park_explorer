Park Explorer
#############

Park Explorer is a ruby on rails web application that lets users share their park photos and experiences with the community.
Users score their photo in different categories. The scores can then be used a diagnostic tool and or public metric that helps inform principals about the health / state of the park.

## Installation

To use this app, just clone, run 'bundle install' and then run 'rake db:migrate' and 'rake db:seed.' You can start the servers using 'rails s.' To enable Facebook login, you will have to add your own '.env' file with the appropriate key and secretvalue from Facebook's developer site.

## Usage

1. Full user account system (create, login, logout, login with facebook)
2. Admin role can add update parks
3. User role can add and view photos as well as update delete own photos.
4. Create, view, update and delete bikes.
6. View dashboard of current park metrics.

## Gems
- devise
- omniauth-facebook
- carrierwave
- mini_magick
- dotenv-rails

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'chrisrobertspdx'/park_explorer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

This project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).