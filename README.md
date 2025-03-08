# vim-laravel-projections

This plugin provides a set of commands and basic templates for working with
Laravel projects in Vim using [projectionist.vim][].

[projectionist.vim]: https://github.com/tpope/vim-projectionist

## Pre-requisites

- [projectionist.vim][] is required to use this plugin.
- [dispatch.vim][] is optional if you want to can be used to leverage
  `:Start`, `:Console`, `:Make` and `:Dispatch`.

Recommended, but not required:

- [composer.vim][] is recommended to use its built in support for `gf` and
  friends. It's not all all required to use the projections in this plugin.

[composer.vim]: https://github.com/noahfrederick/vim-composer
[dispatch.vim]: https://github.com/tpope/vim-dispatch

## Installation

Right now, I'm trying to avoid having this plugin do anything fancy. If you
want, you can just copy [laravel-projections.json][] to your
project at `.projections.json`.

If you are using [plug.vim][] or a similar plugin manager you can add this to
your `vimrc`:

```vim
Plug 'itspriddle/vim-laravel-projections'
```

[laravel-projections.json]: https://raw.githubusercontent.com/itspriddle/vim-laravel-projections/refs/heads/main/plugin/laravel-projections.json
[plug.vim]: https://github.com/junegunn/vim-plug

## Commands

### Base Commands

- `:Console` - Open the tinker console. Requires dispatch.vim.
- `:Start` - Open the tinker console. Requires dispatch.vim. _This isn't
  locked in. I might use it for `composer dev`._

### Entity Commands

"Entities" are basically anything under `app/` and a few others. Pretty much
everything that there's a `php artisan make:*` command is here.

If you're unfamiliar with projectionist, it sets up Vim commands based on the
file path. This means that we can run things like `:Emodel User` to open
`app/Models/User.php`. It works with tab completion, so you can type
`:Emodel U<Tab>` to complete to `:Emodel User`. And when you're in other
related files, like `app/Models/UserFactory.php`, you can run `:Emodel` to
jump to `app/Models/User.php`.

In addition to `:Emodel User` to `:edit app/Models/User.php`, we can also do:

- `:Smodel User` will `:split app/Models/User.php` in a vertical split
- `:Vmodel User` will `:vsplit app/Models/User.php` in a vertical split
- `:Tmodel User` will `:tabedit app/Models/User.php` in a new tab
- `:Dmodel User` will `:read app/Models/User.php` the template for the model
  (defined by this plugin) and replace the current buffer's contents with it
- `:Omodel User` will `:drop app/Models/User.php`, which opens the file in any
  window it's already opened in

These commands all have the following variants:

- `:E*` - `:edit` the destination file
- `:S*` - `:split` the destination file
- `:V*` - `:vsplit` the destination file
- `:T*` - `:tabedit` the destination file
- `:D*` - `:read` the destination file
- `:O*` - `:drop` the destination file

The list of commands is as follows:

- `:Ebroadcast <arg>` - Open the given broadcast.
- `:Ecast <arg>` - Open the given cast.
- `:Ecommand <arg>` - Open the given console command.
- `:Ecomposer` - Open `composer.json`.
    - Call `:Make` while editing `composer.json` or `composer.lock` to run
      `composer install` via Dispatch.
- `:Econfig [arg]` - Open the given configuration file. With no argument
  provided, opens `config/app.php`.
- `:Econtroller <arg>` - Open the given controller.
- `:Ecss [arg]` - Open the given CSS file. With no argument provided, opens
  `resources/css/app.css`.
- `:Edoc [arg]` - Open the documentation file. With no argument provided,
  opens `README.md`.
- `:Edotenv [arg]` - Open the dotenv file for the given environment. With no
  argument provided, opens `.env`.
- `:Eenum <arg>` - Open the given enum.
- `:Eevent <arg>` - Open the given event.
- `:Eexception <arg>` - Open the given exception.
- `:Efacade <arg>` - Open the given facade.
- `:Efactory <arg>` - Open the given factory.
- `:Ejob <arg>` - Open the given job.
- `:Ejs [arg]` - Open the given JavaScript file. With no argument provided,
  opens `resources/js/app.js`.
- `:Elang <arg>` - Open the given language file.
- `:Elistener <arg>` - Open the given listener.
- `:Elivewire <arg>` - Open the given Livewire component.
- `:Elog <arg>` - Open the given log file.
- `:Email <arg>` - Open the given mail.
- `:Emiddleware <arg>` - Open the given middleware.
- `:Emigration <arg>` - Open the given DB migration.
    - Call `:Make` while editing a migration file to run `php artisan migrate`
      via Dispatch for that specific migration.
    - Call `:Dispatch` while editing a migration file to run `php artisan
      migrate` via Dispatch for all migrations.
- `:Emodel [arg]` - Open the given model.
    - Call `:Emodel` without arguments from inside a factory, seeder,
      observer, policy, or Unit test to open the model for the current file.
- `:Enotification <arg>` - Open the given notification.
- `:Enpm <arg>` - Open NPM `package.json` file.
    - Call `:Make` while editing `package.json` or `package-lock.json` to run
      `npm install` via Dispatch.
- `:Eobserver <arg>` - Open the given observer.
- `:Epolicy <arg>` - Open the given policy.
- `:Eprovider [arg]` - Open the given provider. With no argument provided,
  opens `AppServiceProvider`.
- `:Erepository <arg>` - Open the given repository.
- `:Erequest <arg>` - Open the given form request.
- `:Eresource <arg>` - Open the given API resource.
- `:Eresponse <arg>` - Open the given HTTP response.
- `:Eroute [arg]` - Open the given route file. With no argument provided,
  opens `web`.
- `:Erule <arg>` - Open the given rule.
- `:Escope <arg>` - Open the given scope.
- `:Escript <arg>` - Open the given script.
- `:Eseeder [arg]` - Open the given seeder. With no argument provided, opens
  `DatabaseSeeder`.
    - Call `:Make` while editing a seeder file to run `php artisan db:seed`
      via Dispatch for that specific seeder.
    - Call `:Dispatch` while editing a seeder file to run `php artisan seed`
      via Dispatch for the default `DatabaseSeeder`.
- `:Eservice <arg>` - Open the given service.
- `:Etailwind` - Open the Tailwind CSS configuration file.
- `:Etest <arg>` - Open the given test.
    - Call `:Dispatch` or `:Make` while editing a test file to run the test
      with `php artisan test {file}` via Dispatch.
- `:Etrait <arg>` - Open the given trait.
- `:Eview <arg>` - Open the given view.
- `:Evite` - Open the Vite configuration file.
    - Run `:Make` while editing `vite.config.js` to run `npm run build` via
      Dispatch.
    - Run `:Start` while editing `vite.config.js` to run `npx run dev` via
      Dispatch.
- `:Eworkflow [arg]` - Open the given GitHub workflow. With no argument
  provided, opens `.github/workflows/ci.yml`.

## Alternate Files

Alternate files allow you to use `:A` to switch between the main file and an
alternate. A common use case is to switch between a class and its test file.

- `app/*.php` - Open the corresponding test file under `tests/Feature/` or
  `tests/Unit/`.
- `tests/{Feature,Unit}/*Test.php` - Open the corresponding class file under
  `app/`.
- `routes/web.php` - Open the API route file (`routes/api.php`).
- `.env` - Open the `.env.example` file.
    - `.env.example` - Open the `.env` file.
- `composer.json` - Open `composer.lock`.
    - `composer.lock` - Open `composer.json`.
- `package.json` - Open `package-lock.json`.
    - `package-lock.json` - Open `package.json`.

This also lets you access `:E*` projection commands for the alternate file.

For example, if you are editing `app/Models/User.php`, you can use `:Etest` to
switch to `tests/Feature/Models/UserTest.php`; from in `UserTest.php`, you can
use `:Emodel` to switch back to `app/Models/User.php`.

- `app/*.php`:
    - `:Etest`
- `app/Models/`:
    - `:Efactory`
    - `:Eseeder`
    - `:Eobserver`
    - `:Epolicy`

## Templates

A few templates are provided for creating new files through Projectionist.
That happens when you use an `:E*` command for a file that doesn't exist yet,
or use `:A` to switch to a non-existent alternate file. If you manually create
a file, you can run `:AD` to replace the buffer contents with the new file
template.

By default, `*.php` files will just contain a `declare(strict_types=1);`
statement at the top.

Files under `app/*.php` will also include a namespace declaration based on the
file path. For example, creating a new file `app/Models/User.php` will include
the line `namespace App\Models;`.

## License

MIT License - see [`LICENSE`](./LICENSE) in this repo.
