<?php

// Load and set the .env variables
$env = parse_ini_file('.env');
foreach ($env as $key => $value) {
    putenv($key . "=" . $value);
}

phpinfo();

