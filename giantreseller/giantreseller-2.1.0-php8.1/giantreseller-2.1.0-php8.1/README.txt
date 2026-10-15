Giant Reseller WHMCS module 2.1.0 for PHP 8.1

Use the release that matches your WHMCS server's PHP version. Check it in
WHMCS under Utilities > System > PHP Info, or with php -v on the server.

Upload both folders inside "modules" into your WHMCS "modules" folder:
  modules/servers/giantreseller
  modules/addons/giantreseller

The module's PHP is encoded with ionCube, so your server needs the ionCube
Loader for PHP 8.1 (most hosts have it; see https://www.ioncube.com/loaders.php).

You can edit the wording customers see in modules/servers/giantreseller/lang/
and the client-area templates in modules/servers/giantreseller/templates/.

Setup guide: Giant-Reseller-Setup-Guide.pdf in this folder. Once installed it is
also in WHMCS under Addons > Giant Reseller > Setup guide.
