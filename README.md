# Fetch

Fetch is a library for reading email and attachments, primarily using the POP 
and IMAP protocols.


## TODO

- [ ] Remove Vagrant and replace with Docker for running tests locally

## Installing

 > N.b. A note on Ubuntu 14.04 (probably other Debian-based / Apt managed
 > systems), the install of php5-imap does not enable the extension for CLI
 > (possibly others as well), which can cause composer to report fetch
 > requires `ext-imap`
 
 ```sh
sudo ln -s /etc/php5/mods-available/imap.ini /etc/php5/cli/conf.d/30-imap.ini
 ```

### Composer

Installing Fetch can be done through a variety of methods, although Composer
is recommended.

Until Fetch reaches a stable API with version 1.0 it is recommended that you
review changes before even Minor updates, although bug fixes will always be
backwards compatible.

```
"require": {
  "nurtext/fetch": "0.8.*"
}
```

### Github

Releases of Fetch are available on [Github][:releases:].


## Sample Usage

This is just a simple code to show how to access messages by using Fetch. It
uses Fetch own autoload, but it can (and should be, if applicable) replaced
with the one generated by composer.

```php
use Fetch\Server;
use Fetch\Message;

$server = new Server('imap.example.com', 993);
$server->setAuthentication('username', 'password');

/** @var Message[] $messages */
$messages = $server->getMessages();

foreach ($messages as $message) {
    echo "Subject: {$message->getSubject()}", PHP_EOL;
    echo "Body: {$message->getMessageBody()}", PHP_EOL;
}
```

## License

Fetch is licensed under the BSD License. See the LICENSE file for details.

[:releases:]: https://github.com/nurtext/Fetch/releases
