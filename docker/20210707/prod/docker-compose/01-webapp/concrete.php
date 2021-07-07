<?php

/**
 * Always trust incoming request.
 * 
 * application/config/concrete.php
 * 
 * For more detail, see: http://symfony.com/doc/current/cookbook/request/load_balancer_reverse_proxy.html
 */

// Get remote address
$remoteIp = $_SERVER['REMOTE_ADDR'];

return [
    'security' => [
        'trusted_proxies' => [
            'ips' => [$remoteIp]
        ],
    ],
];