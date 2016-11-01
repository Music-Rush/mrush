<?php

namespace App\Lib\Custom;

class Block
{
    private $isAuth;
    private $image;
    private $title;

    public function __construct($auth, $img, $ttl)
    {
        $this->isAuth = $auth;
        $this->image = $img;
        $this->title = $ttl;
    }

    public function Render()
    {
        echo $this->title;
    }
}